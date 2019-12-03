import Foundation

public struct ForecastParams: Codable {
    // MARK: properties
    public let lat: Double
    public let lon: Double
    public let time: Int
    
    // MARK: init
    public init(lat: Double, lon: Double, time: Int) {
        self.lat = lat
        self.lon = lon
        self.time = time
    }
}
