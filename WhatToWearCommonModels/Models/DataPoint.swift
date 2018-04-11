import Foundation

// MARK: DataPoint
public struct DataPoint: Codable, Equatable {
    private enum CodingKeys: String, CodingKey {
        case time
        case cloudCover
        case temperature
        case apparentTemperature
        case chanceOfPrecipitation = "precipProbability"
        case internalPrecipitationType = "precipType"
        case windGust
        case humidity
        case windBearing
    }

    public let time: Date
    public let cloudCover: Double?
    public let temperature: Double
    public let apparentTemperature: Double
    public let chanceOfPrecipitation: Double?
    public let windGust: Double?
    public let humidity: Double?
    public let windBearing: Double?
    
    private let internalPrecipitationType: PrecipitationType?
}

// MARK: computed properties
public extension DataPoint {
    public var optionalTemperature: Double? {
        return temperature
    }
    
    public var optionalApparentTemperature: Double? {
        return apparentTemperature
    }
    
    public var precipitationType: PrecipitationType {
        return internalPrecipitationType ?? .none
    }
}
