import Quick
import Nimble
import Fakery
@testable import WhatToWearCommonModels

internal final class PrecipitationTypeSpec: QuickSpec {
    internal override func spec() {
        describe("PrecipitationType") {
            var faker: Faker!
            
            beforeEach {
                faker = Faker()
            }
            
            describe("its init with rawValue") {
                var precipitationType: PrecipitationType!
                
                context("when the given rawValue matches a known precipitation type") {
                    var knownType: KnownPrecipitationType!
                    
                    beforeEach {
                        knownType = KnownPrecipitationType.rain
                        precipitationType = PrecipitationType(rawValue: knownType.rawValue)
                    }
                    
                    it("should return the known precipitation type") {
                        expect(precipitationType) == knownType.precipitationType
                    }
                }
                
                context("when the given rawValue does not match a known precipitation type") {
                    var rawValue: String!
                    
                    beforeEach {
                        rawValue = faker.lorem.characters()
                        precipitationType = PrecipitationType(rawValue: rawValue)
                    }
                    
                    it("should return other with the rawValue as its associated value") {
                        expect(precipitationType) == .other(rawValue)
                    }
                }
            }
            
            describe("its rawValue") {
                context("when it is rain") {
                    it("should return the same rawValue as KnownPrecipitationType.rain") {
                        expect(PrecipitationType.rain.rawValue) == KnownPrecipitationType.rain.rawValue
                    }
                }
                
                context("when it is snow") {
                    it("should return the same rawValue as KnownPrecipitationType.snow") {
                        expect(PrecipitationType.snow.rawValue) == KnownPrecipitationType.snow.rawValue
                    }
                }
                
                context("when it is sleet") {
                    it("should return the same rawValue as KnownPrecipitationType.sleet") {
                        expect(PrecipitationType.sleet.rawValue) == KnownPrecipitationType.sleet.rawValue
                    }
                }
                
                context("when it is none") {
                    it("should return the same rawValue as KnownPrecipitationType.none") {
                        expect(PrecipitationType.none.rawValue) == KnownPrecipitationType.none.rawValue
                    }
                }
                
                context("when it is other") {
                    var rawValue: String!
                    var precipitationType: PrecipitationType!
                    
                    beforeEach {
                        rawValue = faker.lorem.characters()
                        precipitationType = .other(rawValue)
                    }
                    
                    it("should return other with the rawValue as the associated value") {
                        expect(precipitationType.rawValue) == rawValue
                    }
                }
            }
        }
    }
}
