import Quick
import Nimble
import WhatToWearCommonCore
@testable import WhatToWearCommonModels

internal final class DataPointSpec: QuickSpec {
    internal override func spec() {
        describe("DataPoint") {
            var bundle: Bundle!
            var dataPoint: DataPoint!
            
            beforeEach {
                bundle = Bundle(for: type(of: self))
            }
            
            describe("its optionalTemperature") {
                beforeEach {
                    dataPoint = DataPoint.fixtures.valid.object(for: bundle)
                }
                
                it("should return the same value as its temperature") {
                    expect(dataPoint.optionalTemperature) == dataPoint.temperature
                }
            }
            
            describe("its optionalApparentTemperature") {
                beforeEach {
                    dataPoint = DataPoint.fixtures.valid.object(for: bundle)
                }
                
                it("should return the same value as its apparentTemperature") {
                    expect(dataPoint.optionalApparentTemperature) == dataPoint.apparentTemperature
                }
            }
            
            describe("its precipitationType") {
                context("when its internalPrecipitationType is nil") {
                    beforeEach {
                        dataPoint = DataPoint.fixtures.withoutPrecip.object(for: bundle)
                    }
                    
                    it("should return none") {
                        expect(dataPoint.precipitationType) == PrecipitationType.none
                    }
                }
                
                context("when its internalPrecipitationType is non-nil") {
                    beforeEach {
                        dataPoint = DataPoint.fixtures.valid.object(for: bundle)
                    }
                    
                    it("should return the internalPrecipitationType") {
                        expect(dataPoint.precipitationType) == dataPoint.internalPrecipitationType
                    }
                }
            }
            
            describe("its encoded form") {
                var dataPoint: DataPoint!
                
                beforeEach {
                    let originalDataPoint = DataPoint.fixtures.valid.object(for: bundle)
                    let newData = try! JSONEncoder.wtwEncoder().encode(originalDataPoint)
                    
                    dataPoint = try! JSONDecoder.wtwDecoder().decode(DataPoint.self, from: newData)
                }
                
                it("should be decodable back into a object") {
                    expect(dataPoint).toNot(beNil())
                }
            }
        }
    }
}
