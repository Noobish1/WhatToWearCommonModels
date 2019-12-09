import Foundation

// MARK: DoubleMeasurementProtocol
public protocol DoubleMeasurementProtocol: MeasurementProtocol, BasicDoubleMeasurementProtocol {
    var symbol: DoubleSymbol.Type { get }
}
