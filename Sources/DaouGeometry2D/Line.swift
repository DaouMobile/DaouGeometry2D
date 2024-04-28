import Foundation

public enum Line {
    public enum IntersectionResult {
        case empty
        case point(Point)
        case line(Line)
        
        var point: Point? {
            guard case let .point(point) = self else {
                return nil
            }
            return point
        }
    }
    
    case horizontal(yIntercept: Double)
    case vertical(xIntercept: Double)
    case normal(slope: Double, yIntercept: Double)
    
    var slope: Double {
        switch self {
        case .horizontal:
            return .zero
        case .vertical:
            return .infinity
        case let .normal(slope, _):
            return slope
        }
    }
    
    public var yIntercept: Double? {
        switch self {
        case let .horizontal(yIntercept):
            return yIntercept
        case .vertical:
            return nil
        case let .normal(_, yIntercept):
            return yIntercept
        }
    }
    
    public var xIntercept: Double? {
        switch self {
        case .horizontal:
            return nil
        case let .vertical(xIntercept):
            return xIntercept
        case let .normal(slope, yIntercept):
            return -yIntercept / slope
        }
    }
    
    public static let xAxis: Line = .horizontal(yIntercept: 0)
    
    public static let yAxis: Line = .vertical(xIntercept: 0)
    
    public init(slope: Double, passThrough point: Point) {
        switch slope {
        case .zero:
            self = .horizontal(yIntercept: point.y)
        case .infinity:
            self = .vertical(xIntercept: point.x)
        default:
            let yIntercept = point.y - slope * point.x
            self = .normal(slope: slope, yIntercept: yIntercept)
        }
    }
    
    public init?(passThrough point1: Point, and point2: Point) {
        let dx = point2.x - point1.x
        let dy = point2.y - point1.y
        guard dx != 0 else {
            if dy == 0 {
                return nil
            } else {
                self = .vertical(xIntercept: point1.x)
                return
            }
        }
        guard dy != 0 else {
            self = .horizontal(yIntercept: point1.y)
            return
        }
        let slope = dy / dx
        let yIntercept = point2.y - slope * point2.x
        self = .normal(slope: slope, yIntercept: yIntercept)
    }
    
    public func pointAt(x: Double) -> IntersectionResult {
        return self.intersection(with: .vertical(xIntercept: x))
    }
    
    public func pointAt(y: Double) -> IntersectionResult {
        return self.intersection(with: .horizontal(yIntercept: y))
    }
    
    public func intersection(with line: Line) -> IntersectionResult {
        return Self.intersection(of: self, and: line)
    }
    
    public static func intersection(of line1: Line, and line2: Line) -> IntersectionResult {
        switch (line1, line2) {
        case let (.horizontal(yIntercept1), .horizontal(yIntercept2)):
            if yIntercept1 == yIntercept2 {
                return .line(line1)
            } else {
                return .empty
            }
        case let (.vertical(xIntercept1), .vertical(xIntercept2)):
            if xIntercept1 == xIntercept2 {
                return .line(line1)
            } else {
                return .empty
            }
        case let (.normal(slope1, yIntercept1), .normal(slope2, yIntercept2)):
            guard slope1 != slope2 else {
                if yIntercept1 == yIntercept2 {
                    return .line(line1)
                } else {
                    return .empty
                }
            }
            let x = -(yIntercept2 - yIntercept1) / (slope2 - slope1)
            let y = slope1 * x + yIntercept1
            return .point(.init(x: x, y: y))
        case let (.horizontal(yIntercept), .vertical(xIntercept)), let (.vertical(xIntercept), .horizontal(yIntercept)):
            return .point(.init(x: xIntercept, y: yIntercept))
        case let (.horizontal(y), .normal(slope, yIntercept)), let (.normal(slope, yIntercept), .horizontal(y)):
            let x = (y - yIntercept) / slope
            return .point(.init(x: x, y: y))
        case let (.normal(slope, yIntercept), .vertical(x)), let (.vertical(x), .normal(slope, yIntercept)):
            let y = slope * x + yIntercept
            return .point(.init(x: x, y: y))
        }
    }
    
    public func perpendicular(passThrough point: Point) -> Line {
        switch self {
        case .horizontal:
            return .vertical(xIntercept: point.x)
        case .vertical:
            return .horizontal(yIntercept: point.y)
        case let .normal(slope, _):
            let slope = -1 / slope
            let yIntercept = point.y - slope * point.x
            return .normal(slope: slope, yIntercept: yIntercept)
        }
    }
    
    public func relativePosition(of point: Point) -> Vector {
        let perpendicular = self.perpendicular(passThrough: point)
        let footOfPerpendicular = self.intersection(with: perpendicular).point!
        return .init(initialPoint: footOfPerpendicular, terminalPoint: point)
    }
    
    public static func relativePosition(of point: Point, to line: Line) -> Vector {
        return line.relativePosition(of: point)
    }
}
