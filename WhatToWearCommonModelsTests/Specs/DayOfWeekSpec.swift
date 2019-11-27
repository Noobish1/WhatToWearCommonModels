import Quick
import Nimble
@testable import WhatToWearCommonModels

internal final class DayOfWeekSpec: QuickSpec {
    internal override func spec() {
        describe("DayOfWeek") {
            describe("its init with date") {
                it("should create the correct DayOfWeek from the given date") {
                    let calendar = Calendar(identifier: .gregorian)

                    // April 8th 2019 was a Monday
                    let components = DateComponents(
                        year: 2019,
                        month: 4,
                        day: 8
                    )

                    let date = calendar.date(from: components)!

                    expect(DayOfWeek(date: date)) == .monday
                }
            }
        }
    }
}
