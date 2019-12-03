import Foundation

// MARK: ForecastResponse
public struct ForecastResponse: Codable {
    public let forecast: Forecast
    public let user: UserResponse
}
