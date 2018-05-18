import Quick
import Nimble
import WhatToWearCommonCore
@testable import WhatToWearCommonModels

internal final class ForecastSpec: QuickSpec {
    internal override func spec() {
        describe("Forecast") {
            var bundle: Bundle!
            
            beforeEach {
                bundle = Bundle(for: ForecastSpec.self)
            }
            
            describe("its init from decoder") {
                var decoder: JSONDecoder!
                var data: Data!
                
                context("when given an invalid timeZone") {
                    beforeEach {
                        let path = bundle.path(forResource: "forecast-bad-timezone", ofType: "json")!
                        
                        data = try! Data(contentsOf: URL(fileURLWithPath: path))
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
                
                context("when given valid JSON") {
                    beforeEach {
                        let path = bundle.path(forResource: "forecast", ofType: "json")!
                        
                        data = try! Data(contentsOf: URL(fileURLWithPath: path))
                        decoder = JSONDecoder.wtwDecoder()
                    }
                    
                    it("should return a Forecast") {
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
                    let path = bundle.path(forResource: "forecast", ofType: "json")!
                    let data = try! Data(contentsOf: URL(fileURLWithPath: path))
                    
                    forecast = try! JSONDecoder.wtwDecoder().decode(Forecast.self, from: data)
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
        }
    }
}
