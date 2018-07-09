import Foundation

// MARK: DataPoint
public struct DataPoint: Codable, Equatable {
    private enum CodingKeys: String, CodingKey {
        case time
        case cloudCover
        case rawTemperature = "temperature"
        case rawApparentTemperature = "apparentTemperature"
        case chanceOfPrecipitation = "precipProbability"
        case precipitationType = "precipType"
        case rawWindGust = "windGust"
        case humidity
        case rawWindBearing = "windBearing"
    }

    public let time: Date
    public let cloudCover: Double?
    public let chanceOfPrecipitation: Double?
    public let humidity: Double?
    public let precipitationType: PrecipitationType?
    
    internal let rawWindBearing: Double?
    internal let rawApparentTemperature: Double
    internal let rawTemperature: Double
    internal let rawWindGust: Double?
}

// MARK: computed properties
public extension DataPoint {
    public var windDirection: WindDirection? {
        return WindDirection(windBearing: windBearing?.value)
    }
    
    public var windBearing: Measurement<UnitAngle>? {
        return rawWindBearing.map {
            Measurement(value: $0, unit: .degrees)
        }
    }
    
    public var apparentTemperature: Measurement<UnitTemperature> {
        return Measurement(value: rawApparentTemperature, unit: .celsius)
    }
    
    public var temperature: Measurement<UnitTemperature> {
        return Measurement(value: rawTemperature, unit: .celsius)
    }
    
    public var windGust: Measurement<UnitSpeed>? {
        return rawWindGust.map {
            Measurement(value: $0, unit: .metersPerSecond)
        }
    }
    
    public var optionalTemperature: Measurement<UnitTemperature>? {
        return temperature
    }
    
    public var optionalApparentTemperature: Measurement<UnitTemperature>? {
        return apparentTemperature
    }
}
