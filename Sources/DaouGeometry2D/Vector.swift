import Foundation
import DaouAngle

public struct Vector {
    public var x: Double
    public var y: Double
    
    public static let zero: Vector = .init(x: 0, y: 0)
    
    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    public static prefix func - (value: Vector) -> Vector {
        return .init(x: -value.x, y: -value.y)
    }
    
    public static func + (lhs: Vector, rhs: Vector) -> Vector {
        return .init(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    public static func - (lhs: Vector, rhs: Vector) -> Vector {
        return .init(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    public static func * (lhs: Vector, rhs: Double) -> Vector {
        return .init(x: lhs.x * rhs, y: lhs.y * rhs)
    }
}

public extension Vector {
    var magnitude: Double {
        get {
            return sqrt(pow(self.x, 2) + pow(self.y, 2))
        }
        set(newMagnitude) {
            let direction: Angle = self.direction
            self.x = newMagnitude * direction.cosine
            self.y = newMagnitude * direction.sine
        }
    }

    var direction: Angle {
        get {
            return .radian(.arctangent(of: self.y / self.x))
        }
        set(newDirection) {
            let magnitude: Double = self.magnitude
            self.x = magnitude * newDirection.cosine
            self.y = magnitude * newDirection.sine
        }
    }
    
    init(magnitude: Double, direction: Angle) {
        self.x = magnitude * direction.cosine
        self.y = magnitude * direction.sine
    }
    
    static func * (lhs: Vector, rhs: Vector) -> Double {
        return lhs.magnitude * rhs.magnitude * (rhs.direction - lhs.direction).cosine
    }
}
