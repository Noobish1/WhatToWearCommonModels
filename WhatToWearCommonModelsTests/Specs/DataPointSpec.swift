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
                    let path = bundle.path(forResource: "datapoint-with-precip", ofType: "json")!
                    let data = try! Data(contentsOf: URL(fileURLWithPath: path))
                    
                    dataPoint = try! JSONDecoder.wtwDecoder().decode(DataPoint.self, from: data)
                }
                
                it("should return the same value as its temperature") {
                    expect(dataPoint.optionalTemperature) == dataPoint.temperature
                }
            }
            
            describe("its optionalApparentTemperature") {
                beforeEach {
                    let path = bundle.path(forResource: "datapoint-with-precip", ofType: "json")!
                    let data = try! Data(contentsOf: URL(fileURLWithPath: path))
                    
                    dataPoint = try! JSONDecoder.wtwDecoder().decode(DataPoint.self, from: data)
                }
                
                it("should return the same value as its apparentTemperature") {
                    expect(dataPoint.optionalApparentTemperature) == dataPoint.apparentTemperature
                }
            }
            
            describe("its precipitationType") {
                context("when its internalPrecipitationType is nil") {
                    beforeEach {
                        let path = bundle.path(forResource: "datapoint-without-precip", ofType: "json")!
                        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
                        
                        dataPoint = try! JSONDecoder.wtwDecoder().decode(DataPoint.self, from: data)
                    }
                    
                    it("should return none") {
                        expect(dataPoint.precipitationType) == PrecipitationType.none
                    }
                }
                
                context("when its internalPrecipitationType is non-nil") {
                    beforeEach {
                        let path = bundle.path(forResource: "datapoint-with-precip", ofType: "json")!
                        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
                        
                        dataPoint = try! JSONDecoder.wtwDecoder().decode(DataPoint.self, from: data)
                    }
                    
                    it("should return the internalPrecipitationType") {
                        expect(dataPoint.precipitationType) == dataPoint.internalPrecipitationType
                    }
                }
            }
        }
    }
}
