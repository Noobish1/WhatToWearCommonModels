import Foundation
import WhatToWearCommonCore

// MARK: MeasurementSystem
public enum MeasurementSystem: String, FiniteSetValueProtocol {
    case metric = "metric"
    case imperial = "imperial"
}

// MARK: Displayed units
extension MeasurementSystem {
    public var displayedUnitForSpeedMeasurement: UnitSpeed {
        switch self {
            case .metric: return .kilometersPerHour
            case .imperial: return .milesPerHour
        }
    }

    public var displayedUnitForTemperatureMeasurement: UnitTemperature {
        switch self {
            case .metric: return .celsius
            case .imperial: return .fahrenheit
        }
    }
}

// MARK: WTWRandomized
extension MeasurementSystem: WTWRandomized {
    // swiftlint:disable type_name
    public enum wtw: WTWRandomizer {
        public static func random() -> MeasurementSystem {
            return nonEmptyCases.randomElement()
        }
    }
    // swiftlint:enable type_name
}
