import Quick
import Nimble
import WhatToWearCommonCore
@testable import WhatToWearCommonModels

internal final class DailyDataSpec: QuickSpec {
    internal override func spec() {
        describe("DailyData") {
            var bundle: Bundle!
            var data: DailyData!
            
            beforeEach {
                bundle = Bundle(for: type(of: self))
            }
            
            describe("its apparentTemperatureHigh") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                describe("its value") {
                    it("should be equal to its rawApparentTemperatureHigh") {
                        expect(data.apparentTemperatureHigh?.value) == data.rawApparentTemperatureHigh
                    }
                }
                
                describe("its unit") {
                    it("should be celsius") {
                        expect(data.apparentTemperatureHigh?.unit) == .celsius
                    }
                }
            }
            
            describe("its apparentTemperatureLow") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                describe("its value") {
                    it("should be equal to its rawApparentTemperatureLow") {
                        expect(data.apparentTemperatureLow?.value) == data.rawApparentTemperatureLow
                    }
                }
                
                describe("its unit") {
                    it("should be celsius") {
                        expect(data.apparentTemperatureLow?.unit) == .celsius
                    }
                }
            }
            
            describe("its apparentTemperatureMax") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                describe("its value") {
                    it("should be equal to its rawApparentTemperatureMax") {
                        expect(data.apparentTemperatureMax?.value) == data.rawApparentTemperatureMax
                    }
                }
                
                describe("its unit") {
                    it("should be celsius") {
                        expect(data.apparentTemperatureMax?.unit) == .celsius
                    }
                }
            }
            
            describe("its apparentTemperatureMin") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                describe("its value") {
                    it("should be equal to its rawApparentTemperatureMin") {
                        expect(data.apparentTemperatureMin?.value) == data.rawApparentTemperatureMin
                    }
                }
                
                describe("its unit") {
                    it("should be celsius") {
                        expect(data.apparentTemperatureMin?.unit) == .celsius
                    }
                }
            }
            
            describe("its temperatureHigh") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                describe("its value") {
                    it("should be equal to its rawTemperatureHigh") {
                        expect(data.temperatureHigh?.value) == data.rawTemperatureHigh
                    }
                }
                
                describe("its unit") {
                    it("should be celsius") {
                        expect(data.temperatureHigh?.unit) == .celsius
                    }
                }
            }
            
            describe("its temperatureLow") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                describe("its value") {
                    it("should be equal to its rawTemperatureLow") {
                        expect(data.temperatureLow?.value) == data.rawTemperatureLow
                    }
                }
                
                describe("its unit") {
                    it("should be celsius") {
                        expect(data.temperatureLow?.unit) == .celsius
                    }
                }
            }
            
            describe("its temperatureMax") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                describe("its value") {
                    it("should be equal to its rawTemperatureMax") {
                        expect(data.temperatureMax?.value) == data.rawTemperatureMax
                    }
                }
                
                describe("its unit") {
                    it("should be celsius") {
                        expect(data.temperatureMax?.unit) == .celsius
                    }
                }
            }
            
            describe("its temperatureMin") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                describe("its value") {
                    it("should be equal to its rawTemperatureMin") {
                        expect(data.temperatureMin?.value) == data.rawTemperatureMin
                    }
                }
                
                describe("its unit") {
                    it("should be celsius") {
                        expect(data.temperatureMin?.unit) == .celsius
                    }
                }
            }
            
            describe("its encoded form") {
                beforeEach {
                    let originalData = try! DailyData.fixtures.valid.object(for: bundle)
                    let newData = try! JSONEncoder().encode(originalData)
                    
                    data = try! JSONDecoder().decode(DailyData.self, from: newData)
                }
                
                it("should be decodable back into a object") {
                    expect(data).toNot(beNil())
                }
            }
        }
    }
}
