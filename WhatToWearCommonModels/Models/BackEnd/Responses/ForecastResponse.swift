import Foundation

// MARK: ForecastResponse
public struct ForecastResponse: Codable {
    // MARK: properties
    public let forecast: Forecast
    public let user: UserResponse
    
    // MARK: init
    public init(forecast: Forecast, user: UserResponse) {
        self.forecast = forecast
        self.user = user
    }
}
