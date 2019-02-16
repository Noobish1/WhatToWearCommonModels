import Foundation
import WhatToWearCommonCore

// MARK: DailyForecast
public struct DailyForecast: Equatable {
    internal let internalData: NonEmptyArray<DailyData>
    
    public var data: DailyData { return internalData.first }
}

// MARK: ContainerCodable
extension DailyForecast: ContainerCodable {
    // MARK: DecodingError
    internal enum DecodingError: Error {
        case emptyDataArray
    }
    
    // MARK: CodingKeys
    public enum CodingKeys: String, ContainerCodingKey {
        case internalData = "data"
        
        public static let allValues: [CodingKeys] = [.internalData]
    }
    
    // MARK: Encodable
    public func encodeValue(forKey key: CodingKeys, in container: inout KeyedEncodingContainer<CodingKeys>) throws {
        switch key {
            case .internalData: try container.encode(internalData.toArray(), forKey: key)
        }
    }
    
    // MARK: Decodable
    public init(from container: KeyedDecodingContainer<CodingKeys>) throws {
        let array = try container.decode([DailyData].self, forKey: .internalData)
        
        guard let nonEmptyArray = NonEmptyArray(array: array) else {
            throw DecodingError.emptyDataArray
        }
        
        self.internalData = nonEmptyArray
    }
}
