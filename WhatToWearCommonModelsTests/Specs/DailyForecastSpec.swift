import Quick
import Nimble
import WhatToWearCommonCore
@testable import WhatToWearCommonModels

internal final class DailyForecastSpec: QuickSpec {
    internal override func spec() {
        describe("DailyForecast") {
            var bundle: Bundle!
            var encoder: JSONEncoder!
            var decoder: JSONDecoder!
            
            beforeEach {
                bundle = Bundle(for: type(of: self))
                encoder = JSONEncoder()
                decoder = JSONDecoder()
            }
            
            describe("its data") {
                var forecast: DailyForecast!
                
                beforeEach {
                    forecast = try! DailyForecast.fixtures.valid.object(for: bundle)
                }
                
                it("should be its the first object in the internalData array") {
                    expect(forecast.data) == forecast.internalData.first
                }
            }
            
            describe("its encoder to encoder") {
                var forecast: DailyForecast!
                
                beforeEach {
                    forecast = try! DailyForecast.fixtures.valid.object(for: bundle)
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
                var data: Data!
                
                context("when the given data array is empty") {
                    beforeEach {
                        data = try! DailyForecast.fixtures.emptyData.fixtureData(for: bundle)
                    }
                    
                    it("should throw a emptyDataArray error") {
                        expect {
                            try decoder.decode(DailyForecast.self, from: data)
                        }.to(
                            throwError(DailyForecast.DecodingError.emptyDataArray)
                        )
                    }
                }
                
                context("when the given data array is not empty") {
                    beforeEach {
                        data = try! DailyForecast.fixtures.valid.fixtureData(for: bundle)
                    }
                    
                    it("should not throw an error") {
                        expect {
                            try decoder.decode(DailyForecast.self, from: data)
                        }.toNot(
                            throwError()
                        )
                    }
                }
            }
            
            describe("its encoded form") {
                var forecast: DailyForecast!
                
                beforeEach {
                    let originalForecast = try! DailyForecast.fixtures.valid.object(for: bundle)
                    let newData = try! encoder.encode(originalForecast)
                    
                    forecast = try! decoder.decode(DailyForecast.self, from: newData)
                }
                
                it("should be decodable back into a object") {
                    expect(forecast).toNot(beNil())
                }
            }
        }
    }
}
