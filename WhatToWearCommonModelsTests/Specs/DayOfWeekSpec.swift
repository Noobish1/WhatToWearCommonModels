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
            
            describe("its stringRepresentation") {
                var day: DayOfWeek!
                
                context("when the day is Monday") {
                    beforeEach {
                        day = .monday
                    }
                    
                    it("should return Monday as a capitalized string") {
                        expect(day.stringRepresentation) == "Monday"
                    }
                }
                
                context("when the day is Tuesday") {
                    beforeEach {
                        day = .tuesday
                    }
                    
                    it("should return Tuesday as a capitalized string") {
                        expect(day.stringRepresentation) == "Tuesday"
                    }
                }
                
                context("when the day is Wednesday") {
                    beforeEach {
                        day = .wednesday
                    }
                    
                    it("should return Wednesday as a capitalized string") {
                        expect(day.stringRepresentation) == "Wednesday"
                    }
                }
                
                context("when the day is Thursday") {
                    beforeEach {
                        day = .thursday
                    }
                    
                    it("should return Thursday as a capitalized string") {
                        expect(day.stringRepresentation) == "Thursday"
                    }
                }
                
                context("when the day is Friday") {
                    beforeEach {
                        day = .friday
                    }
                    
                    it("should return Friday as a capitalized string") {
                        expect(day.stringRepresentation) == "Friday"
                    }
                }
                
                context("when the day is Saturday") {
                    beforeEach {
                        day = .saturday
                    }
                    
                    it("should return Saturday as a capitalized string") {
                        expect(day.stringRepresentation) == "Saturday"
                    }
                }
                
                context("when the day is Sunday") {
                    beforeEach {
                        day = .sunday
                    }
                    
                    it("should return Sunday as a capitalized string") {
                        expect(day.stringRepresentation) == "Sunday"
                    }
                }
            }
        }
    }
}
