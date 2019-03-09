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
            
            describe("its apparentTemperatureHighTime") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                it("should be a date created from the raw property") {
                    expect(data.apparentTemperatureHighTime) == data.rawApparentTemperatureHighTime.map {
                        Date(timeIntervalSince1970: $0.rawValue)
                    }
                }
            }
            
            describe("its apparentTemperatureLowTime") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                it("should be a date created from the raw property") {
                    expect(data.apparentTemperatureLowTime) == data.rawApparentTemperatureLowTime.map {
                        Date(timeIntervalSince1970: $0.rawValue)
                    }
                }
            }
            
            describe("its apparentTemperatureMaxTime") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                it("should be a date created from the raw property") {
                    expect(data.apparentTemperatureMaxTime) == data.rawApparentTemperatureMaxTime.map {
                        Date(timeIntervalSince1970: $0.rawValue)
                    }
                }
            }
            
            describe("its apparentTemperatureMinTime") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                it("should be a date created from the raw property") {
                    expect(data.apparentTemperatureMinTime) == data.rawApparentTemperatureMinTime.map {
                        Date(timeIntervalSince1970: $0.rawValue)
                    }
                }
            }
            
            describe("its temperatureHighTime") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                it("should be a date created from the raw property") {
                    expect(data.temperatureHighTime) == data.rawTemperatureHighTime.map {
                        Date(timeIntervalSince1970: $0.rawValue)
                    }
                }
            }
            
            describe("its temperatureLowTime") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                it("should be a date created from the raw property") {
                    expect(data.temperatureLowTime) == data.rawTemperatureLowTime.map {
                        Date(timeIntervalSince1970: $0.rawValue)
                    }
                }
            }
            
            describe("its temperatureMaxTime") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                it("should be a date created from the raw property") {
                    expect(data.temperatureMaxTime) == data.rawTemperatureMaxTime.map {
                        Date(timeIntervalSince1970: $0.rawValue)
                    }
                }
            }
            
            describe("its temperatureMinTime") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                it("should be a date created from the raw property") {
                    expect(data.temperatureMinTime) == data.rawTemperatureMinTime.map {
                        Date(timeIntervalSince1970: $0.rawValue)
                    }
                }
            }
            
            describe("its uvIndexTime") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                it("should be a date created from the raw property") {
                    expect(data.uvIndexTime) == data.rawUvIndexTime.map {
                        Date(timeIntervalSince1970: $0.rawValue)
                    }
                }
            }
            
            describe("its windGustTime") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                it("should be a date created from the raw property") {
                    expect(data.windGustTime) == data.rawWindGustTime.map {
                        Date(timeIntervalSince1970: $0.rawValue)
                    }
                }
            }
            
            describe("its apparentTemperatureHigh") {
                beforeEach {
                    data = try! DailyData.fixtures.valid.object(for: bundle)
                }
                
                describe("its value") {
                    it("should be equal to its rawApparentTemperatureHigh") {
                        expect(data.apparentTemperatureHigh?.value) == data.rawApparentTemperatureHigh?.rawValue
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
                        expect(data.apparentTemperatureLow?.value) == data.rawApparentTemperatureLow?.rawValue
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
                        expect(data.apparentTemperatureMax?.value) == data.rawApparentTemperatureMax?.rawValue
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
                        expect(data.apparentTemperatureMin?.value) == data.rawApparentTemperatureMin?.rawValue
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
                        expect(data.temperatureHigh?.value) == data.rawTemperatureHigh?.rawValue
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
                        expect(data.temperatureLow?.value) == data.rawTemperatureLow?.rawValue
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
                        expect(data.temperatureMax?.value) == data.rawTemperatureMax?.rawValue
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
                        expect(data.temperatureMin?.value) == data.rawTemperatureMin?.rawValue
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
