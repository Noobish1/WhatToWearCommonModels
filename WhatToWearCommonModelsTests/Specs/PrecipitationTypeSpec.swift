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
                var precipType: PrecipitationType!
                
                context("when the given rawValue matches a known precipitation type") {
                    var knownType: KnownPrecipitationType!
                    
                    beforeEach {
                        knownType = KnownPrecipitationType.rain
                        precipType = PrecipitationType(rawValue: knownType.rawValue)
                    }
                    
                    it("should return the known precipitation type") {
                        expect(precipType) == knownType.precipitationType
                    }
                }
                
                context("when the given rawValue does not match a known precipitation type") {
                    var rawValue: String!
                    
                    beforeEach {
                        rawValue = faker.lorem.characters()
                        precipType = PrecipitationType(rawValue: rawValue)
                    }
                    
                    it("should return other with the rawValue as its associated value") {
                        expect(precipType) == .other(rawValue)
                    }
                }
            }

            context("when it is rain") {
                var precipType: PrecipitationType!
                
                beforeEach {
                    precipType = .rain
                }
                
                describe("its rawValue") {
                    it("should return the same rawValue as KnownPrecipitationType.rain") {
                        expect(precipType.rawValue) == KnownPrecipitationType.rain.rawValue
                    }
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
                
                describe("its rawValue") {
                    it("should return the same rawValue as KnownPrecipitationType.snow") {
                        expect(precipType.rawValue) == KnownPrecipitationType.snow.rawValue
                    }
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
                
                describe("its rawValue") {
                    it("should return the same rawValue as KnownPrecipitationType.sleet") {
                        expect(precipType.rawValue) == KnownPrecipitationType.sleet.rawValue
                    }
                }
                
                describe("its stringRepresentation") {
                    it("should be Sleet") {
                        expect(precipType.stringRepresentation) == NSLocalizedString("Sleet", comment: "")
                    }
                }
            }
            
            context("when it is none") {
                var precipType: PrecipitationType!
                
                beforeEach {
                    precipType = PrecipitationType.none
                }
                
                describe("its rawValue") {
                    it("should return the same rawValue as KnownPrecipitationType.none") {
                        expect(precipType.rawValue) == KnownPrecipitationType.none.rawValue
                    }
                }
                
                describe("its stringRepresentation") {
                    it("should be None") {
                        expect(precipType.stringRepresentation) == NSLocalizedString("None", comment: "")
                    }
                }
            }
            
            context("when it is other") {
                var rawValue: String!
                var precipitationType: PrecipitationType!
                
                beforeEach {
                    rawValue = faker.lorem.characters()
                    precipitationType = .other(rawValue)
                }
                
                describe("its rawValue") {
                    it("should return other with the rawValue as the associated value") {
                        expect(precipitationType.rawValue) == rawValue
                    }
                }
                
                describe("its stringRepresentation") {
                    it("should be the capitalized version of its rawValue") {
                        expect(precipitationType.stringRepresentation) == rawValue.capitalized
                    }
                }
            }
        }
    }
}
