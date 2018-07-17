import Foundation
import WhatToWearCommonCore

public struct Forecast: Equatable {
    public let timeZone: TimeZone
    public let hourly: HourlyForecast
}

extension Forecast: ContainerCodable {
    internal enum DecodingError: Error {
        case invalidTimeZone
    }
    
    public enum CodingKeys: String, ContainerCodingKey {
        case timeZone = "timezone"
        case hourly = "hourly"
        
        public static let allValues: [CodingKeys] = [.timeZone, .hourly]
    }
    
    // MARK: ContainerDecodable
    public init(from container: KeyedDecodingContainer<CodingKeys>) throws {
        let timeZoneIdentifier = try container.decode(String.self, forKey: .timeZone)
        
        guard let timeZone = TimeZone(identifier: timeZoneIdentifier) else {
            throw DecodingError.invalidTimeZone
        }
        
        self.timeZone = timeZone
        self.hourly = try container.decode(HourlyForecast.self, forKey: .hourly)
    }
    
    // MARK: ContainerEncodable
    public func encodeValue(forKey key: CodingKeys, in container: inout KeyedEncodingContainer<CodingKeys>) throws {
        switch key {
            case .timeZone: try container.encode(timeZone.identifier, forKey: key)
            case .hourly: try container.encode(hourly, forKey: .hourly)
        }
    }
}
