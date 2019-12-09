import Foundation
import WhatToWearCommonCore

// MARK: GlobalSettings
public struct GlobalSettings: Codable, Equatable, Withable {
    // MARK: properties
    public var measurementSystem: MeasurementSystem
    public var shownComponents: [WeatherChartComponent: Bool]
    public var appBackgroundOptions: AppBackgroundOptions
    public var temperatureType: TemperatureType
    public var windType: WindType
    public var whatsNewOnLaunch: Bool

    // MARK: computed static properties
    public static var `default`: Self {
        return Self(
            measurementSystem: .metric,
            shownComponents: WeatherChartComponent.defaultMapping,
            appBackgroundOptions: .original,
            temperatureType: .apparent,
            windType: .gust,
            whatsNewOnLaunch: true
        )
    }

    // MARK: computed properties
    public var shownComponentsSet: Set<WeatherChartComponent> {
        return Set(shownComponents.filter { $0.1 }.map { $0.0 })
    }

    // MARK: init
    public init(
        measurementSystem: MeasurementSystem,
        shownComponents: [WeatherChartComponent: Bool],
        appBackgroundOptions: AppBackgroundOptions,
        temperatureType: TemperatureType,
        windType: WindType,
        whatsNewOnLaunch: Bool
    ) {
        self.measurementSystem = measurementSystem
        self.shownComponents = shownComponents
        self.appBackgroundOptions = appBackgroundOptions
        self.temperatureType = temperatureType
        self.windType = windType
        self.whatsNewOnLaunch = whatsNewOnLaunch
    }
}

// MARK: with functions
extension GlobalSettings {
    public func with(selectedComponents: Set<WeatherChartComponent>) -> Self {
        let newMapping = Dictionary(uniqueKeysWithValues: WeatherChartComponent.allCases.map {
            ($0, selectedComponents.contains($0))
        })

        return with(\.shownComponents, value: newMapping)
    }
}
