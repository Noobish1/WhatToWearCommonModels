import Foundation
import WhatToWearCommonModels
import WhatToWearCommonTesting

extension Forecast: Fixturable {
    public enum Fixtures: String, FixtureProtocol {
        public typealias EnclosingType = Forecast
        
        case valid = "forecast"
        case invalidTimeZone = "forecast-bad-timezone"
    }
    
    public static let fixtures = Fixtures.self
}
