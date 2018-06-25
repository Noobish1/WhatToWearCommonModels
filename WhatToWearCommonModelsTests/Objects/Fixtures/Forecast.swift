import Foundation
import WhatToWearCommonModels

extension Forecast: Fixturable {
    internal enum Fixtures: String, FixtureProtocol {
        typealias EnclosingType = Forecast
        
        case valid = "forecast"
        case invalidTimeZone = "forecast-bad-timezone"
    }
    
    internal static var fixtures = Forecast.Fixtures.self
}
