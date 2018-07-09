import Quick
import Nimble
import Fakery
@testable import WhatToWearCommonModels

internal final class PrecipitationTypeSpec: QuickSpec {
    internal override func spec() {
        describe("PrecipitationType") {
            context("when it is rain") {
                var precipType: PrecipitationType!
                
                beforeEach {
                    precipType = .rain
                }
                
                describe("its stringRepresentation") {
                    it("should be Rain") {
                        expect(precipType.stringRepresentation) == NSLocalizedString("Rain", comment: "")
                    }
                }
            }

            context("when it is snow") {
                var precipType: PrecipitationType!
                
                beforeEach {
                    precipType = .snow
                }
                
                describe("its stringRepresentation") {
                    it("should be Snow") {
                        expect(precipType.stringRepresentation) == NSLocalizedString("Snow", comment: "")
                    }
                }
            }
            
            context("when it is sleet") {
                var precipType: PrecipitationType!
                
                beforeEach {
                    precipType = .sleet
                }
                
                describe("its stringRepresentation") {
                    it("should be Sleet") {
                        expect(precipType.stringRepresentation) == NSLocalizedString("Sleet", comment: "")
                    }
                }
            }
        }
    }
}
