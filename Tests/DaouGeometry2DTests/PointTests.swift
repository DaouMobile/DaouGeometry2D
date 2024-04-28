import XCTest
import DaouAngle
@testable import DaouGeometry2D

final class PointTests: XCTestCase {
    func testInit() {
        let point1: Point = .init(x: 4, y: 3)
        let point2: Point = .init(r: 5, theta: .radian(.arctangent(of: 3.0 / 4.0)))
        
        XCTAssertEqual(point1, point2)
    }
    
    func testDistance() {
        let point1: Point = .init(x: 0, y: 3)
        let point2: Point = .init(x: 0, y: 6)
        
        XCTAssertEqual(point1.distance(to: point2), 3)
    }
    
    func testRange() {
        let point: Point = .init(x: -1, y: 0.5)
        
        let expected: Point = .init(x: 0, y: 0.5)
        
        let actual: Point = point.ranged(from: .init(x: 0, y: 0), to: .init(x: 1, y: 1))
        
        XCTAssertEqual(expected, actual)
    }
}
