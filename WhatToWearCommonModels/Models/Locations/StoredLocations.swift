import Foundation
import WhatToWearCommonCore

// MARK: StoredLocations
public struct StoredLocations: Codable, Equatable, Withable {
    // MARK: properties
    public let locations: NonEmptyArray<ValidLocation>
    public var defaultLocation: ValidLocation
    
    // MARK: static computed properties
    public static var `default`: Self? {
        return nil
    }
    
    // MARK: init
    public init(locations: NonEmptyArray<ValidLocation>, defaultLocation: ValidLocation) {
        self.locations = locations
        self.defaultLocation = defaultLocation
    }
    
    // MARK: adding
    public func adding(location: ValidLocation) -> Self {
        return Self(locations: locations.byAppending(location), defaultLocation: defaultLocation)
    }
}
