import Foundation
import Tagged

public enum DegreesTag {}

public typealias Degrees<A> = Tagged<DegreesTag, A>

public extension Tagged where Tag == DegreesTag, RawValue == Double {
    public var measurement: Measurement<UnitAngle> {
        return Measurement(value: self.rawValue, unit: .degrees)
    }
}
