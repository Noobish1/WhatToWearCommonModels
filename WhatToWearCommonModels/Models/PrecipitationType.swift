import Foundation

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
        switch rawValue.lowercased() {
            case "rain": self = .rain
            case "snow": self = .snow
            case "sleet": self = .sleet
            default: self = .other(rawValue)
        }
    }
    
    public var rawValue: String {
        switch self {
            case .rain: return "rain"
            case .snow: return "snow"
            case .sleet: return "sleet"
            case .none: return "none"
            case .other(let other): return other
        }
    }
}

// MARK: Codable
extension PrecipitationType: Codable {}
