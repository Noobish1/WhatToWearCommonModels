import Foundation

public protocol BasicConditionProtocol {
    func isMetBy(dataPoint: HourlyDataPoint, for forecast: Forecast) -> Bool
}
