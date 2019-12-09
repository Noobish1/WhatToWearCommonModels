import Foundation

public protocol SelectableConditionValueProtocol: FiniteSetValueProtocol {
    static func specializedMeasurement(from wrapper: WeatherMeasurement) -> SelectableMeasurement<Self>?
}
