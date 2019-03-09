import Quick
import Nimble
@testable import WhatToWearCommonModels

internal final class PercentageSpec: QuickSpec {
    internal override func spec() {
        describe("Percentage") {
            describe("percent") {
                context("when called on an Int") {
                    var originalInt: Int!
                    var percentage: Percentage<CGFloat>!
                    
                    beforeEach {
                        let ourInt = Int.random(in: 0...100)
                        
                        originalInt = ourInt
                        percentage = ourInt.percent
                    }
                    
                    it("should return a percentage with its rawValue equal to the given value divided by 100") {
                        expect(percentage.rawValue) == (CGFloat(originalInt) / 100)
                    }
                }
            }
        }
    }
}
