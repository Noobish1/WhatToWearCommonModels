import Foundation
import WhatToWearCommonModels

extension DataPoint: Fixturable {
    internal enum Fixtures: String, FixtureProtocol {
        typealias EnclosingType = DataPoint
        
        case valid = "datapoint-with-precip"
        case withoutPrecip = "datapoint-without-precip"
    }
    
    internal static let fixtures = Fixtures.self
}
