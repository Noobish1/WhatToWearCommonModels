import Foundation
import WhatToWearCommonCore

// MARK: PrecipitationType
public enum PrecipitationType: String, FiniteSetValueProtocol {
    case rain = "rain"
    case snow = "snow"
    case sleet = "sleet"
}

// MARK: SelectableValueProtocol
extension PrecipitationType: SelectableConditionValueProtocol {
    public static func specializedMeasurement(from wrapper: WeatherMeasurement) -> SelectableMeasurement<PrecipitationType>? {
        guard case .enumeration(.precipType(let measurement)) = wrapper else {
            return nil
        }

        return measurement
    }
}
