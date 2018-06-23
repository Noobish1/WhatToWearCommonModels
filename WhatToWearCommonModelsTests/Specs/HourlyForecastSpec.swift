import Quick
import Nimble
import WhatToWearCommonCore
@testable import WhatToWearCommonModels

internal final class HourlyForecastSpec: QuickSpec {
    internal override func spec() {
        describe("HourlyForecast") {
            var bundle: Bundle!
            
            beforeEach {
                bundle = Bundle(for: type(of: self))
            }
            
            describe("its encoder to encoder") {
                var forecast: HourlyForecast!
                var encoder: JSONEncoder!
                
                beforeEach {
                    let path = bundle.path(forResource: "hourlyforecast", ofType: "json")!
                    let data = try! Data(contentsOf: URL(fileURLWithPath: path))
                    
                    forecast = try! JSONDecoder.wtwDecoder().decode(HourlyForecast.self, from: data)
                    encoder = JSONEncoder.wtwEncoder()
                }
                
                it("should return a Data when encoded") {
                    expect {
                        _ = try encoder.encode(forecast)
                    }.toNot(
                        throwError()
                    )
                }
            }
            
            describe("its init from decoder") {
                var decoder: JSONDecoder!
                var data: Data!
                
                context("when the given data array is empty") {
                    beforeEach {
                        let path = bundle.path(forResource: "hourlyforecast-empty-data", ofType: "json")!
                        
                        data = try! Data(contentsOf: URL(fileURLWithPath: path))
                        decoder = JSONDecoder.wtwDecoder()
                    }
                    
                    it("should throw a emptyDataArray error") {
                        expect {
                            try decoder.decode(HourlyForecast.self, from: data)
                        }.to(
                            throwError(HourlyForecast.DecodingError.emptyDataArray)
                        )
                    }
                }
                
                context("when the given data array is not empty") {
                    beforeEach {
                        let path = bundle.path(forResource: "hourlyforecast", ofType: "json")!
                        
                        data = try! Data(contentsOf: URL(fileURLWithPath: path))
                        decoder = JSONDecoder.wtwDecoder()
                    }
                    
                    it("should not throw an error") {
                        expect {
                            try decoder.decode(HourlyForecast.self, from: data)
                        }.toNot(
                            throwError()
                        )
                    }
                }
            }
            
            describe("its encoded form") {
                var forecast: HourlyForecast!
                
                beforeEach {
                    let path = bundle.path(forResource: "hourlyforecast", ofType: "json")!
                    let data = try! Data(contentsOf: URL(fileURLWithPath: path))
                    let originalForecast = try! JSONDecoder.wtwDecoder().decode(HourlyForecast.self, from: data)
                    
                    let newData = try! JSONEncoder.wtwEncoder().encode(originalForecast)
                    forecast = try! JSONDecoder.wtwDecoder().decode(HourlyForecast.self, from: newData)
                }
                
                it("should be decodable back into a object") {
                    expect(forecast).toNot(beNil())
                }
            }
        }
    }
}
