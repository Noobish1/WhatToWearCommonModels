import Foundation
import WhatToWearCommonModels
import WhatToWearCommonTesting

extension HourlyForecast: Fixturable {
    public enum Fixtures: String, FixtureProtocol {
        public typealias EnclosingType = HourlyForecast
        
        case valid = "hourlyforecast"
        case emptyData = "hourlyforecast-empty-data"
    }
    
    public static let fixtures = Fixtures.self
}
