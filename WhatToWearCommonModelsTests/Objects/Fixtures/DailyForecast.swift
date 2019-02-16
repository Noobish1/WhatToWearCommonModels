import Foundation
import WhatToWearCommonModels
import WhatToWearCommonTesting

extension DailyForecast: Fixturable {
    public enum Fixtures: String, FixtureProtocol {
        public typealias EnclosingType = DailyForecast
        
        case valid = "dailyforecast"
        case emptyData = "dailyforecast-empty-data"
    }
    
    public static let fixtures = Fixtures.self
}
