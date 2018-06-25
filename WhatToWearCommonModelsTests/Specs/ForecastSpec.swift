import Quick
import Nimble
import WhatToWearCommonCore
@testable import WhatToWearCommonModels

internal final class ForecastSpec: QuickSpec {
    internal override func spec() {
        describe("Forecast") {
            var bundle: Bundle!
            
            beforeEach {
                bundle = Bundle(for: type(of: self))
            }
            
            describe("its init from decoder") {
                var decoder: JSONDecoder!
                var data: Data!
                
                context("when given an invalid timeZone") {
                    beforeEach {
                        data = Forecast.fixtures.invalidTimeZone.fixtureData(for: bundle)
                        decoder = JSONDecoder.wtwDecoder()
                    }
                    
                    it("should throw a invalidTimeZone error") {
                        expect {
                            try decoder.decode(Forecast.self, from: data)
                        }.to(
                            throwError(Forecast.DecodingError.invalidTimeZone)
                        )
                    }
                }
                
                context("when not given an invalid timeZone") {
                    beforeEach {
                        data = Forecast.fixtures.valid.fixtureData(for: bundle)
                        decoder = JSONDecoder.wtwDecoder()
                    }
                    
                    it("should not throw an error") {
                        expect {
                            try decoder.decode(Forecast.self, from: data)
                        }.toNot(
                            throwError()
                        )
                    }
                }
            }
            
            describe("its encode to encoder") {
                var forecast: Forecast!
                var encoder: JSONEncoder!
                
                beforeEach {
                    forecast = Forecast.fixtures.valid.object(for: bundle)
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
            
            describe("its encoded form") {
                var forecast: Forecast!
                
                beforeEach {
                    let originalForecast = Forecast.fixtures.valid.object(for: bundle)
                    let newData = try! JSONEncoder.wtwEncoder().encode(originalForecast)
                    
                    forecast = try! JSONDecoder.wtwDecoder().decode(Forecast.self, from: newData)
                }
                
                it("should be decodable back into a object") {
                    expect(forecast).toNot(beNil())
                }
            }
        }
    }
}
