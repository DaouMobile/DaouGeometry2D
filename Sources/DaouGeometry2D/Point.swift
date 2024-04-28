import Foundation
import DaouAngle

public struct Point {
    public var position: Vector
    
    public var x: Double {
        get {
            return self.position.x
        }
        set {
            self.position.x = newValue
        }
    }
    
    public var y: Double {
        get {
            return self.position.y
        }
        set {
            self.position.y = newValue
        }
    }
    
    public static let origin: Point = .init(position: .zero)
    
    public init(position: Vector) {
        self.position = position
    }
    
    public init(x: Double, y: Double) {
        self.init(position: .init(x: x, y: y))
    }
    
    public func distance(to point: Point) -> Double {
        return (self.position - point.position).magnitude
    }
    
    public static func distance(from p1: Point, to p2: Point) -> Double {
        return (p1.position - p2.position).magnitude
    }
}

public extension Point {
    var radius: Double {
        return self.distance(to: .origin)
    }
    
    var angle: Angle {
        return self.position.direction
    }
    
    init(r: Double, theta: Angle) {
        self.position = .init(magnitude: r, direction: theta)
    }
}

extension Vector {
    public init(initialPoint: Point, terminalPoint: Point) {
        self.x = terminalPoint.x - initialPoint.x
        self.y = terminalPoint.y - initialPoint.y
    }
}
