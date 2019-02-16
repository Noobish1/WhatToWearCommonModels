import Foundation
import WhatToWearCommonModels
import WhatToWearCommonTesting

extension DailyData: Fixturable {
    public enum Fixtures: String, FixtureProtocol {
        public typealias EnclosingType = DailyData
        
        case valid = "dailydata"
    }
    
    public static let fixtures = Fixtures.self
}
