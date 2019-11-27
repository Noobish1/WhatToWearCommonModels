import Quick
import Nimble
@testable import WhatToWearCommonCore
@testable import WhatToWearCommonModels

internal final class HourlyForecastSpec: QuickSpec {
    internal override func spec() {
        describe("HourlyForecast") {
            var encoder: JSONEncoder!
            var decoder: JSONDecoder!

            beforeEach {
                encoder = JSONEncoder()
                decoder = JSONDecoder()
            }

            describe("its encoder to encoder") {
                var forecast: HourlyForecast!

                beforeEach {
                    forecast = try! HourlyForecast.fixtures.valid.object()
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
                        data = try! HourlyForecast.fixtures.emptyData.fixtureData()
                    }

                    it("should throw a emptyDataArray error") {
                        expect {
                            try decoder.decode(HourlyForecast.self, from: data)
                        }.to(
                            throwError(NonEmptyArray<HourlyDataPoint>.DecodingError.emptyArray)
                        )
                    }
                }

                context("when the given data array is not empty") {
                    beforeEach {
                        data = try! HourlyForecast.fixtures.valid.fixtureData()
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
                    let originalForecast = try! HourlyForecast.fixtures.valid.object()
                    let newData = try! encoder.encode(originalForecast)

                    forecast = try! decoder.decode(HourlyForecast.self, from: newData)
                }

                it("should be decodable back into a object") {
                    expect(forecast).toNot(beNil())
                }
            }
        }
    }
}
