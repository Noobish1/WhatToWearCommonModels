import Foundation
import WhatToWearCommonCore

// MARK: TemperatureType
public enum TemperatureType: String, NonEmptyCaseIterable, Equatable, Codable {
    case apparent = "apparent"
    case air = "air"
}

// MARK: Extensions
extension TemperatureType {
    public var dataPointKeyPath: KeyPath<HourlyDataPoint, Measurement<UnitTemperature>> {
        switch self {
            case .apparent: return \.apparentTemperature
            case .air: return \.temperature
        }
    }
}
