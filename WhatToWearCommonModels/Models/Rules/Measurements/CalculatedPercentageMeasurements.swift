import Foundation
import WhatToWearCommonCore

extension CalculatedPercentageMeasurement {
    internal static func sunAltitude(for id: MeasurementID) -> Self {
        return Self(
            id: id,
            name: NSLocalizedString("Sun Altitude", comment: ""),
            basicValue: .hourly,
            explanation: NSLocalizedString("The altitude of the sun as a percentage of its highest altitude.", comment: ""),
            calculation: { dataPoint, forecast in
                let altitude = SunCalculator.sunAltitude(
                    date: dataPoint.time,
                    latitude: forecast.latitude,
                    longitude: forecast.longitude
                )

                return Double(Normalizer.normalize(
                    value: altitude,
                    fromRange: SunCalculator.sunAltitudeRange,
                    toRange: 0...1
                ))
            }
        )
    }
}
