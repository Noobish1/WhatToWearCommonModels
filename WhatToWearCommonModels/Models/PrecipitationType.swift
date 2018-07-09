import Foundation
import WhatToWearCommonCore

// MARK: PrecipitationType
public enum PrecipitationType: String, Equatable {
    case rain
    case snow
    case sleet
}

// MARK: Codable
extension PrecipitationType: Codable {}

// MARK: StringRepresentable
extension PrecipitationType: StringRepresentable {
    public var stringRepresentation: String {
        return rawValue.capitalized
    }
}
