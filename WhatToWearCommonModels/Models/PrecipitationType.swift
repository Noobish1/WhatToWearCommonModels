import Foundation
import WhatToWearCommonCore

// MARK: PrecipitationType
public enum PrecipitationType: String, Equatable {
    case rain = "rain"
    case snow = "snow"
    case sleet = "sleet"
}

// MARK: CaseIterable
extension PrecipitationType: CaseIterable {}

// MARK: Codable
extension PrecipitationType: Codable {}

// MARK: StringRepresentable
extension PrecipitationType: StringRepresentable {
    public var stringRepresentation: String {
        return rawValue.capitalized
    }
}
