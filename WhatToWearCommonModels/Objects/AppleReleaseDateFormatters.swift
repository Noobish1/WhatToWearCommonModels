import Foundation
import WhatToWearCommonCore

public final class AppleReleaseDateFormatters: Singleton {
    // MARK: static properties
    public static let shared = AppleReleaseDateFormatters()
    
    // MARK: instance properties
    internal private(set) var appleReleaseDateFormatters: [TimeZone: ISO8601DateFormatter] = [:]
    
    // MARK: retrieving a (possibly cached) formatter
    public func formatter(for timeZone: TimeZone) -> ISO8601DateFormatter {
        // Example: 2019-02-26T01:46:22Z
        return appleReleaseDateFormatters.value(
            forKey: timeZone,
            orInsertAndReturn: {
                let formattter = ISO8601DateFormatter()
                formattter.formatOptions = [
                    .withFullDate, .withFullTime, .withColonSeparatorInTime, .withDashSeparatorInDate
                ]
                formattter.timeZone = timeZone
                
                return formattter
            }()
        )
    }
}
