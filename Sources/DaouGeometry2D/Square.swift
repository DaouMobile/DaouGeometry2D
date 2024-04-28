import Foundation

public struct Square {
    public var firstVertex: Point
    public var secondVertex: Point
    public var thirdVertex: Point
    public var fourthVertex: Point
    
    public var vertices: [Point] {
        return [self.firstVertex, self.secondVertex, self.thirdVertex, self.fourthVertex]
    }
    
    public init(firstVertex: Point, secondVertex: Point, thirdVertex: Point, fourthVertex: Point) {
        self.firstVertex = firstVertex
        self.secondVertex = secondVertex
        self.thirdVertex = thirdVertex
        self.fourthVertex = fourthVertex
    }
}
