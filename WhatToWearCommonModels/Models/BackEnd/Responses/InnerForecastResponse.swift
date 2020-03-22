import Foundation

// MARK: InnerForecastResponse
public struct InnerForecastResponse: Codable, Equatable {
    // MARK: properties
    public let forecast: Forecast
    public let user: UserResponse
    
    // MARK: init
    public init(forecast: Forecast, user: UserResponse) {
        self.forecast = forecast
        self.user = user
    }
}
