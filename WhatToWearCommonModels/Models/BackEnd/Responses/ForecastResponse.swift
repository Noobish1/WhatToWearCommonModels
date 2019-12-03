import Foundation

// MARK: ForecastResponse
internal struct ForecastResponse: Codable {
    internal let forecast: Forecast
    internal let user: UserResponse
}
