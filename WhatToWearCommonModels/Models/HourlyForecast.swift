import Foundation
import WhatToWearCommonCore

public struct HourlyForecast: Equatable {
    public let data: NonEmptyArray<HourlyDataPoint>
}

// MARK: Codable
extension HourlyForecast: ContainerCodable {
    // MARK: DecodingError
    internal enum DecodingError: Error {
        case emptyDataArray
    }
    
    // MARK: CodingKeys
    public enum CodingKeys: String, ContainerCodingKey {
        case data = "data"
    }
    
    // MARK: Encodable
    public func encodeValue(
        forKey key: CodingKeys,
        in container: inout KeyedEncodingContainer<CodingKeys>
    ) throws {
        switch key {
            case .data: try container.encode(data.toArray(), forKey: key)
        }
    }
    
    // MARK: Decodable
    public init(from container: KeyedDecodingContainer<CodingKeys>) throws {
        let array = try container.decode([HourlyDataPoint].self, forKey: .data)
        
        guard let nonEmptyArray = NonEmptyArray(array: array) else {
            throw DecodingError.emptyDataArray
        }
        
        self.data = nonEmptyArray
    }
}
