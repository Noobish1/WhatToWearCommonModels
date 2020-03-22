import Foundation

// MARK: ForecastResponse
public enum ForecastResponse: Equatable {
    // MARK: BaseForecastResponse
    internal enum BaseForecastResponse: String, Codable {
        case outOfForecasts = "outOfForecasts"
        case forecast = "forecast"
    }
    
    case outOfForecasts(UserResponse)
    case forecast(InnerForecastResponse)
    
    // MARK: computed properties
    internal var baseTestResponse: BaseForecastResponse {
        switch self {
            case .outOfForecasts: return .outOfForecasts
            case .forecast: return .forecast
        }
    }
    
    public var userResponse: UserResponse {
        switch self {
            case .outOfForecasts(let uResponse): return uResponse
            case .forecast(let innerResponse): return innerResponse.user
        }
    }
}

// MARK: Codable
extension ForecastResponse: Codable {
    // MARK: CodingKeys
    public enum CodingKeys: String, CodingKey {
        case base = "base"
        case outOfForecasts = "outOfForecasts"
        case forecast = "forecast"
    }
    
    // MARK: Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let base = try container.decode(BaseForecastResponse.self, forKey: .base)
        
        switch base {
            case .forecast:
                self = .forecast(try container.decode(InnerForecastResponse.self, forKey: .forecast))
            case .outOfForecasts:
                self = .outOfForecasts(try container.decode(UserResponse.self, forKey: .outOfForecasts))
        }
    }
    
    // MARK: Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(baseTestResponse, forKey: .base)
        
        switch self {
            case .outOfForecasts(let userResponse):
                try container.encode(userResponse, forKey: .outOfForecasts)
            case .forecast(let forecastResponse):
                try container.encode(forecastResponse, forKey: .forecast)
        }
    }
}
