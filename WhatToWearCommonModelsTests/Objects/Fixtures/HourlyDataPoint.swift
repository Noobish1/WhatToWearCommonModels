import Foundation
import WhatToWearCommonModels
import WhatToWearCommonTesting

extension HourlyDataPoint: Fixturable {
    public enum Fixtures: String, FixtureProtocol {
        public typealias EnclosingType = HourlyDataPoint
        
        case valid = "datapoint-with-precip"
        case withoutPrecip = "datapoint-without-precip"
    }
    
    public static let fixtures = Fixtures.self
}
