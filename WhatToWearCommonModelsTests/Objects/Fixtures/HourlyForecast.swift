import Foundation
import WhatToWearCommonModels

extension HourlyForecast: Fixturable {
    internal enum Fixtures: String, FixtureProtocol {
        typealias EnclosingType = HourlyForecast
        
        case valid = "hourlyforecast"
        case emptyData = "hourlyforecast-empty-data"
    }
    
    internal static var fixtures = HourlyForecast.Fixtures.self
}
