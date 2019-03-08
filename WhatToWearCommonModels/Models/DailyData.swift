import Foundation
import TaggedTime

// MARK: DailyData
public struct DailyData: Codable, Equatable {
    private enum CodingKeys: String, CodingKey {
        case apparentTemperatureHighTime = "apparentTemperatureHighTime"
        case apparentTemperatureLowTime = "apparentTemperatureLowTime"
        case apparentTemperatureMaxTime = "apparentTemperatureMaxTime"
        case apparentTemperatureMinTime = "apparentTemperatureMinTime"
        case temperatureHighTime = "temperatureHighTime"
        case temperatureLowTime = "temperatureLowTime"
        case temperatureMaxTime = "temperatureMaxTime"
        case temperatureMinTime = "temperatureMinTime"
        case uvIndexTime = "uvIndexTime"
        case windGustTime = "windGustTime"
        case rawApparentTemperatureHigh = "apparentTemperatureHigh"
        case rawApparentTemperatureLow = "apparentTemperatureLow"
        case rawApparentTemperatureMax = "apparentTemperatureMax"
        case rawApparentTemperatureMin = "apparentTemperatureMin"
        case rawTemperatureHigh = "temperatureHigh"
        case rawTemperatureLow = "temperatureLow"
        case rawTemperatureMax = "temperatureMax"
        case rawTemperatureMin = "temperatureMin"
    }
    
    // Times
    public let apparentTemperatureHighTime: Seconds<Int>?
    public let apparentTemperatureLowTime: Seconds<Int>?
    public let apparentTemperatureMaxTime: Seconds<Int>?
    public let apparentTemperatureMinTime: Seconds<Int>?
    public let temperatureHighTime: Seconds<Int>?
    public let temperatureLowTime: Seconds<Int>?
    public let temperatureMaxTime: Seconds<Int>?
    public let temperatureMinTime: Seconds<Int>?
    public let uvIndexTime: Seconds<Int>?
    public let windGustTime: Seconds<Int>?
    
    // Properties requiring units
    internal let rawApparentTemperatureHigh: Double?
    internal let rawApparentTemperatureLow: Double?
    internal let rawApparentTemperatureMax: Double?
    internal let rawApparentTemperatureMin: Double?
    internal let rawTemperatureHigh: Double?
    internal let rawTemperatureLow: Double?
    internal let rawTemperatureMax: Double?
    internal let rawTemperatureMin: Double?
}

// MARK: Extensions
public extension DailyData {
    public var apparentTemperatureHigh: Measurement<UnitTemperature>? {
        return rawApparentTemperatureHigh.map {
            Measurement(value: $0, unit: .celsius)
        }
    }
    public var apparentTemperatureLow: Measurement<UnitTemperature>? {
        return rawApparentTemperatureLow.map {
            Measurement(value: $0, unit: .celsius)
        }
    }
    public var apparentTemperatureMax: Measurement<UnitTemperature>? {
        return rawApparentTemperatureMax.map {
            Measurement(value: $0, unit: .celsius)
        }
    }
    public var apparentTemperatureMin: Measurement<UnitTemperature>? {
        return rawApparentTemperatureMin.map {
            Measurement(value: $0, unit: .celsius)
        }
    }
    public var temperatureHigh: Measurement<UnitTemperature>? {
        return rawTemperatureHigh.map {
            Measurement(value: $0, unit: .celsius)
        }
    }
    public var temperatureLow: Measurement<UnitTemperature>? {
        return rawTemperatureLow.map {
            Measurement(value: $0, unit: .celsius)
        }
    }
    public var temperatureMax: Measurement<UnitTemperature>? {
        return rawTemperatureMax.map {
            Measurement(value: $0, unit: .celsius)
        }
    }
    public var temperatureMin: Measurement<UnitTemperature>? {
        return rawTemperatureMin.map {
            Measurement(value: $0, unit: .celsius)
        }
    }
}
