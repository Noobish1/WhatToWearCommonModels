import Foundation
import WhatToWearCommonCore

// MARK: KnownPrecipitationType
internal enum KnownPrecipitationType: String {
    case rain
    case snow
    case sleet
    case none
    
    // MARK: computed properties
    internal var precipitationType: PrecipitationType {
        switch self {
            case .rain: return .rain
            case .snow: return .snow
            case .sleet: return .sleet
            case .none: return .none
        }
    }
}

// MARK: PrecipitationType
public enum PrecipitationType: Equatable {
    case rain
    case snow
    case sleet
    case none
    case other(String)
}

// MARK: RawRepresentable
extension PrecipitationType: RawRepresentable {
    public init?(rawValue: String) {
        guard let knownType = KnownPrecipitationType(rawValue: rawValue.lowercased()) else {
            self = .other(rawValue)
            
            return
        }
        
        self = knownType.precipitationType
    }
    
    public var rawValue: String {
        switch self {
            case .rain: return KnownPrecipitationType.rain.rawValue
            case .snow: return KnownPrecipitationType.snow.rawValue
            case .sleet: return KnownPrecipitationType.sleet.rawValue
            case .none: return KnownPrecipitationType.none.rawValue
            case .other(let other): return other
        }
    }
}

// MARK: Codable
extension PrecipitationType: Codable {}

// MARK: StringRepresentable
extension PrecipitationType: StringRepresentable {
    public var stringRepresentation: String {
        return rawValue.capitalized
    }
}
