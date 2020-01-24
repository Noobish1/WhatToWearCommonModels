import Quick
import Nimble
import WhatToWearCommonCore
@testable import WhatToWearCommonModels

internal final class ForecastSpec: QuickSpec {
    internal override func spec() {
        describe("Forecast") {
            var encoder: JSONEncoder!
            var decoder: JSONDecoder!

            beforeEach {
                encoder = JSONEncoder()
                decoder = JSONDecoder()
            }

            describe("its init from decoder") {
                var data: Data!

                context("when given an invalid timeZone") {
                    beforeEach {
                        data = try! Forecast.fixtures.invalidTimeZone.fixtureData()
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
                        data = try! Forecast.fixtures.valid.fixtureData()
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

                beforeEach {
                    forecast = try! Forecast.fixtures.valid.object()
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
                    let originalForecast = try! Forecast.fixtures.valid.object()
                    let newData = try! encoder.encode(originalForecast)

                    forecast = try! decoder.decode(Forecast.self, from: newData)
                }

                it("should be decodable back into a object") {
                    expect(forecast).toNot(beNil())
                }
            }
        }
    }
}
