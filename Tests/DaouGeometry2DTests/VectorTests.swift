import XCTest
import DaouAngle
@testable import DaouGeometry2D

final class VectorTests: XCTestCase {
    func testInit() {
        let vector1: Vector = .init(x: 4, y: 3)
        let vector2: Vector = .init(magnitude: 5, direction: .radian(.arctangent(of: 3.0 / 4.0)))
        
        XCTAssertEqual(vector1, vector2)
    }
    
    func testMagnitude() {
        let vector: Vector = .init(x: 3, y: 4)
        
        XCTAssertEqual(vector.magnitude, 5)
    }
    
    func testMultipliedByScalar() {
        let vector: Vector = .init(x: 1, y: 2)
        let scalar: Double = 3
        let expected: Vector = .init(x: 3, y: 6)
        let actual: Vector = vector * scalar
        XCTAssertEqual(expected, actual)
    }
}
