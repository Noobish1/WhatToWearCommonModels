import Quick
import Nimble
@testable import WhatToWearCommonModels

internal final class PercentageSpec: QuickSpec {
    internal override func spec() {
        describe("Percentage") {
            describe("its percent") {
                var percentage: Percentage<Double>!
                
                beforeEach {
                    percentage = Percentage(rawValue: Double.random(in: 0...1))
                }
                
                it("should return itself") {
                    expect(percentage.percent) == percentage
                }
            }
        }
    }
}
