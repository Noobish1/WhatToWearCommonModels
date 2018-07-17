import Foundation
import WhatToWearCommonCore

// MARK: WindDirection
public enum WindDirection: String, Codable {
    case north = "north"
    case south = "south"
    case east = "east"
    case west = "west"
    case northEast = "northEast"
    case northWest = "northWest"
    case southEast = "southEast"
    case southWest = "southWest"
    
    // MARK: init
    public init?(windBearing: Double?) {
        guard let bearing = windBearing else {
            return nil
        }
        
        for direction in type(of: self).allDirections {
            if direction.ranges.any({ $0.contains(bearing) }) {
                self = direction
                
                return
            }
        }

        return nil
    }
    
    // MARK: static compued properties
    public static var allDirections: NonEmptyArray<WindDirection> {
        return NonEmptyArray(
            elements: .north, .south, .east, .west,
            .northEast, .northWest, .southEast, .southWest
        )
    }
    
    // MARK: computed properties
    private var ranges: [ClosedRange<Double>] {
        // 360 degrees, divided by 8 directions, divided by 2 sides (of its numerical center value)
        let halfSection: Double = (360 / 8) / 2
        
        guard self != .north else {
            return [(360 - halfSection...360), (self.numericalValue...halfSection)]
        }
        
        return [(self.numericalValue - halfSection)...(self.numericalValue + halfSection)]
    }
    
    private var numericalValue: Double {
        switch self {
            case .north: return 0
            case .south: return 180
            case .east: return 90
            case .west: return 270
            case .northEast: return 45
            case .northWest: return 315
            case .southEast: return 135
            case .southWest: return 225
        }
    }
    
    public var arrowString: String {
        switch self {
            case .north: return "↑"
            case .south: return "↓"
            case .east: return "→"
            case .west: return "←"
            case .northEast: return "↗"
            case .northWest: return "↖"
            case .southEast: return "↘"
            case .southWest: return "↙"
        }
    }
}

// MARK: StringRepresentable
extension WindDirection: StringRepresentable {
    public var stringRepresentation: String {
        switch self {
            case .north: return NSLocalizedString("North", comment: "")
            case .south: return NSLocalizedString("South", comment: "")
            case .east: return NSLocalizedString("East", comment: "")
            case .west: return NSLocalizedString("West", comment: "")
            case .northEast: return NSLocalizedString("North East", comment: "")
            case .northWest: return NSLocalizedString("North West", comment: "")
            case .southEast: return NSLocalizedString("South East", comment: "")
            case .southWest: return NSLocalizedString("South West", comment: "")
        }
    }
}
