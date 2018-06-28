import Foundation
import WhatToWearCommonCore

public struct HourlyForecast: Equatable {
    public let data: NonEmptyArray<DataPoint>
}

// MARK: Codable
extension HourlyForecast: Codable {
    // MARK: DecodingError
    internal enum DecodingError: Error {
        case emptyDataArray
    }
    
    // MARK: CodingKeys
    internal enum CodingKeys: String, CodingKey {
        case data
    }
    
    // MARK: Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data.toArray(), forKey: .data)
    }
    
    // MARK: Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let array = try container.decode([DataPoint].self, forKey: .data)
        
        guard let nonEmptyArray = NonEmptyArray(array: array) else {
            throw DecodingError.emptyDataArray
        }
        
        self.data = nonEmptyArray
    }
}
