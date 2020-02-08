#if !os(Linux)
import CoreLocation
import MapKit
#endif

import Foundation

// MARK: ValidLocation
public struct ValidLocation: Codable {
    // MARK: properties
    public let address: String?
    public let latitude: Double
    public let longitude: Double
    
    // MARK: init
    public init(address: String?, latitude: Double, longitude: Double) {
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
    }
}

// MARK: extensions
#if !os(Linux)
extension ValidLocation {
    // MARK: computed properties
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    // MARK: init from MKMapItem
    public init?(mapItem: MKMapItem) {
        guard let formattedAddressLines = mapItem.placemark.addressDictionary?["FormattedAddressLines"] as? [String] else {
            return nil
        }

        self.address = formattedAddressLines.joined(separator: ", ")
        self.latitude = mapItem.placemark.coordinate.latitude
        self.longitude = mapItem.placemark.coordinate.longitude
    }

    // MARK: init from CLPLacemark
    public init?(placemark: CLPlacemark) {
        guard let location = placemark.location else {
            return nil
        }

        guard let formattedAddressLines = placemark.addressDictionary?["FormattedAddressLines"] as? [String] else {
            return nil
        }

        self.address = formattedAddressLines.joined(separator: ", ")
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
    }

    // MARK: init from coordinate
    public init(location: CLLocation) {
        self.address = nil
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
    }
}
#endif

// MARK: Hashable
extension ValidLocation: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(address)
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
}

// MARK: Equatable
extension ValidLocation: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        // We're looking for exact matches
        return  lhs.address == rhs.address &&
                abs(lhs.latitude - rhs.latitude) < Double.ulpOfOne &&
                abs(lhs.longitude - rhs.longitude) < Double.ulpOfOne
    }
}
