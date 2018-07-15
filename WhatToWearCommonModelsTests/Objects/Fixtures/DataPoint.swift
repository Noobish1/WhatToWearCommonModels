import Foundation
import WhatToWearCommonModels
import WhatToWearCommonTesting

extension DataPoint: Fixturable {
    public enum Fixtures: String, FixtureProtocol {
        public typealias EnclosingType = DataPoint
        
        case valid = "datapoint-with-precip"
        case withoutPrecip = "datapoint-without-precip"
    }
    
    public static let fixtures = Fixtures.self
}
