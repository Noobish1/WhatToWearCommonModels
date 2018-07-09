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
            
            describe("its windDirection") {
                beforeEach {
                    dataPoint = DataPoint.fixtures.valid.object(for: bundle)
                }
                
                it("should be derived from the dataPoints windBearing") {
                    expect(dataPoint.windDirection) == WindDirection(windBearing: dataPoint.windBearing?.value)
                }
            }
            
            describe("its windBearing") {
                beforeEach {
                    dataPoint = DataPoint.fixtures.valid.object(for: bundle)
                }
                
                describe("its value") {
                    it("should be equal to its rawWindBearing") {
                        expect(dataPoint.windBearing?.value) == dataPoint.rawWindBearing
                    }
                }
                
                describe("its unit") {
                    it("should be degrees") {
                        expect(dataPoint.windBearing?.unit) == .degrees
                    }
                }
            }
            
            describe("its apparentTemperature") {
                beforeEach {
                    dataPoint = DataPoint.fixtures.valid.object(for: bundle)
                }
                
                describe("its value") {
                    it("should be equal to its rawApparentTemperature") {
                        expect(dataPoint.apparentTemperature.value) == dataPoint.rawApparentTemperature
                    }
                }
                
                describe("its unit") {
                    it("should be celsius") {
                        expect(dataPoint.apparentTemperature.unit) == .celsius
                    }
                }
            }
            
            describe("its temperature") {
                beforeEach {
                    dataPoint = DataPoint.fixtures.valid.object(for: bundle)
                }
                
                describe("its value") {
                    it("should be equal to its rawTemperature") {
                        expect(dataPoint.temperature.value) == dataPoint.rawTemperature
                    }
                }
                
                describe("its unit") {
                    it("should be celsius") {
                        expect(dataPoint.temperature.unit) == .celsius
                    }
                }
            }
            
            describe("its windGust") {
                beforeEach {
                    dataPoint = DataPoint.fixtures.valid.object(for: bundle)
                }
                
                describe("its value") {
                    it("should be equal to its rawWindGust") {
                        expect(dataPoint.windGust?.value) == dataPoint.rawWindGust
                    }
                }
                
                describe("its unit") {
                    it("should be metersPerSecond") {
                        expect(dataPoint.windGust?.unit) == .metersPerSecond
                    }
                }
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
