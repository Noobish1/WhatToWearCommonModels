import Foundation

public struct Forecast: Equatable {
    public let timeZone: TimeZone
    public let hourly: HourlyForecast
}

extension Forecast: Codable {
    internal enum DecodingError: Error {
        case invalidTimeZone
    }
    
    internal enum CodingKeys: String, CodingKey {
        case timeZone = "timezone"
        case hourly
    }
    
    // MARK: Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let timeZoneIdentifier = try container.decode(String.self, forKey: .timeZone)
        
        guard let timeZone = TimeZone(identifier: timeZoneIdentifier) else {
            throw DecodingError.invalidTimeZone
        }
        
        self.timeZone = timeZone
        self.hourly = try container.decode(HourlyForecast.self, forKey: .hourly)
    }
    
    // MARK: Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(timeZone.identifier, forKey: .timeZone)
        try container.encode(hourly, forKey: .hourly)
    }
}
