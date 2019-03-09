import Foundation
import Tagged

public enum SecondsTag {}
/// A type that represents seconds of time.
public typealias Seconds<A> = Tagged<SecondsTag, A>

extension Tagged where Tag == SecondsTag, RawValue: BinaryFloatingPoint {
    /// Converts seconds into `TimeInterval`.
    public var timeInterval: TimeInterval {
        return TimeInterval(self.rawValue)
    }
    
    /// Converts seconds in `Date`.
    public var date: Date {
        return Date(timeIntervalSince1970: self.timeInterval)
    }
}
