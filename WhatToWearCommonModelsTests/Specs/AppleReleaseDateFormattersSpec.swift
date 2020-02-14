import Quick
import Nimble
@testable import WhatToWearCommonModels

internal final class AppleReleaseDateFormattersSpec: QuickSpec {
    internal override func spec() {
        describe("AppleReleaseDateFormatters") {
            describe("its formatter for timeZone") {
                var formatters: AppleReleaseDateFormatters!
                
                beforeEach {
                    formatters = AppleReleaseDateFormatters.shared
                }
                
                it("should cache the used formatter") {
                    let first = formatters.formatter(for: .current)
                    let second = formatters.formatter(for: .current)
                    
                    expect(first) == second
                    expect(formatters.appleReleaseDateFormatters.count) == 1
                }
            }
        }
    }
}
