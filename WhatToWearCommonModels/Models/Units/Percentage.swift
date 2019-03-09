import Foundation
import Tagged

public enum PercentageTag {}

public typealias Percentage<A> = Tagged<PercentageTag, A>

public extension Tagged where Tag == PercentageTag {
    public var percent: Tagged<PercentageTag, RawValue> {
        return self
    }
}
