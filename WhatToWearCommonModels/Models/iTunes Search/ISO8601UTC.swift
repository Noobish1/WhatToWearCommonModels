import Foundation
import Tagged

public enum ISO8601UTCTag {}

public typealias ISO8601UTC<A> = Tagged<ISO8601UTCTag, A>

extension Tagged where Tag == ISO8601UTCTag, RawValue == String {
    public var date: Date {
        let formatter = AppleReleaseDateFormatters.shared.formatter(for: .current)
    
        guard let date = formatter.date(from: rawValue) else {
            fatalError("Could not convert \(rawValue) to a Date")
        }

        return date
    }
}
