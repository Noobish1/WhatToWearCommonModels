import Foundation
import WhatToWearCommonCore

public enum WindDirection: String, Codable {
    case north
    case south
    case east
    case west
    case northEast
    case northWest
    case southEast
    case southWest
    
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
    private static var allDirections: NonEmptyArray<WindDirection> {
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
