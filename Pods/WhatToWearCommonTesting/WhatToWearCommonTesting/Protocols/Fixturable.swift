import Foundation

public protocol Fixturable {
    associatedtype Fixtures: FixtureProtocol where Fixtures.EnclosingType == Self
    
    static var fixtures: Fixtures.Type { get }
}
