import Foundation

public struct AddForecastsParams: Codable {
    // MARK: properties
    public let numberOfForecasts: Int
    
    // MARK: init
    public init(numberOfForecasts: Int) {
        self.numberOfForecasts = numberOfForecasts
    }
}
