import Foundation
import TaggedTime

// MARK: DataPoint
public struct HourlyDataPoint: Codable, Equatable {
    private enum CodingKeys: String, CodingKey {
        case time = "time"
        case cloudCover = "cloudCover"
        case rawTemperature = "temperature"
        case rawApparentTemperature = "apparentTemperature"
        case chanceOfPrecipitation = "precipProbability"
        case precipitationType = "precipType"
        case rawWindGust = "windGust"
        case humidity = "humidity"
        case rawWindBearing = "windBearing"
        case rawDewPoint = "dewPoint"
        case rawPrecipAccumulation = "precipAccumulation"
        case rawPressure = "pressure"
        case uvIndex = "uvIndex"
        case rawVisibility = "visibility"
    }

    public let time: Seconds<Int>
    public let cloudCover: Double?
    public let chanceOfPrecipitation: Double?
    public let humidity: Double?
    public let precipitationType: PrecipitationType?
    public let uvIndex: Double?
    
    internal let rawWindBearing: Double?
    internal let rawApparentTemperature: Double
    internal let rawTemperature: Double
    internal let rawWindGust: Double?
    internal let rawDewPoint: Double?
    internal let rawPrecipAccumulation: Double?
    internal let rawPressure: Double?
    internal let rawVisibility: Double?
}

// MARK: computed properties
public extension HourlyDataPoint {
    public var visibility: Measurement<UnitLength>? {
        return rawVisibility.map {
            Measurement(value: $0, unit: .kilometers)
        }
    }
    
    public var pressure: Measurement<UnitPressure>? {
        return rawPressure.map {
            Measurement(value: $0, unit: .hectopascals)
        }
    }
    
    public var precipAccumulation: Measurement<UnitLength>? {
        return rawPrecipAccumulation.map {
            Measurement(value: $0, unit: .centimeters)
        }
    }
    
    public var dewPoint: Measurement<UnitTemperature>? {
        return rawDewPoint.map {
            Measurement(value: $0, unit: .celsius)
        }
    }
    
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
