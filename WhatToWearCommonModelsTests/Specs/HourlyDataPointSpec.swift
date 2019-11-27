import Quick
import Nimble
import WhatToWearCommonCore
@testable import WhatToWearCommonModels

internal final class HourlyDataPointSpec: QuickSpec {
    internal override func spec() {
        describe("HourlyDataPoint") {
            var dataPoint: HourlyDataPoint!

            describe("its time") {
                beforeEach {
                    dataPoint = try! HourlyDataPoint.fixtures.valid.object()
                }

                it("should be a date created from the rawTime value") {
                    expect(dataPoint.time) == Date(timeIntervalSince1970: dataPoint.rawTime.rawValue)
                }
            }

            describe("its dayOfWeek") {
                beforeEach {
                    dataPoint = try! HourlyDataPoint.fixtures.valid.object()
                }

                it("should be a DayOfWeek created from the date value") {
                    expect(dataPoint.dayOfWeek) == DayOfWeek(date: dataPoint.time)
                }
            }

            describe("its windDirection") {
                beforeEach {
                    dataPoint = try! HourlyDataPoint.fixtures.valid.object()
                }

                it("should be derived from the dataPoints windBearing") {
                    expect(dataPoint.windDirection) == WindDirection(windBearing: dataPoint.windBearing?.value)
                }
            }

            describe("its windBearing") {
                beforeEach {
                    dataPoint = try! HourlyDataPoint.fixtures.valid.object()
                }

                describe("its value") {
                    it("should be equal to its rawWindBearing") {
                        expect(dataPoint.windBearing?.value) == dataPoint.rawWindBearing?.rawValue
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
                    dataPoint = try! HourlyDataPoint.fixtures.valid.object()
                }

                describe("its value") {
                    it("should be equal to its rawApparentTemperature") {
                        expect(dataPoint.apparentTemperature.value) == dataPoint.rawApparentTemperature.rawValue
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
                    dataPoint = try! HourlyDataPoint.fixtures.valid.object()
                }

                describe("its value") {
                    it("should be equal to its rawTemperature") {
                        expect(dataPoint.temperature.value) == dataPoint.rawTemperature.rawValue
                    }
                }

                describe("its unit") {
                    it("should be celsius") {
                        expect(dataPoint.temperature.unit) == .celsius
                    }
                }
            }

            describe("its dewPoint") {
                beforeEach {
                    dataPoint = try! HourlyDataPoint.fixtures.valid.object()
                }

                describe("its value") {
                    it("should be equal to its rawDewPoint") {
                        expect(dataPoint.dewPoint?.value) == dataPoint.rawDewPoint?.rawValue
                    }
                }

                describe("its unit") {
                    it("should be metersPerSecond") {
                        expect(dataPoint.dewPoint?.unit) == .celsius
                    }
                }
            }

            describe("its precipAccumulation") {
                beforeEach {
                    dataPoint = try! HourlyDataPoint.fixtures.valid.object()
                }

                describe("its value") {
                    it("should be equal to its rawPrecipAccumulation") {
                        expect(dataPoint.precipAccumulation?.value) == dataPoint.rawPrecipAccumulation?.rawValue
                    }
                }

                describe("its unit") {
                    it("should be centimeters") {
                        expect(dataPoint.precipAccumulation?.unit) == .centimeters
                    }
                }
            }

            describe("its pressure") {
                beforeEach {
                    dataPoint = try! HourlyDataPoint.fixtures.valid.object()
                }

                describe("its value") {
                    it("should be equal to its rawPressure") {
                        expect(dataPoint.pressure?.value) == dataPoint.rawPressure?.rawValue
                    }
                }

                describe("its unit") {
                    it("should be hectopascals") {
                        expect(dataPoint.pressure?.unit) == .hectopascals
                    }
                }
            }

            describe("its visibility") {
                beforeEach {
                    dataPoint = try! HourlyDataPoint.fixtures.valid.object()
                }

                describe("its value") {
                    it("should be equal to its rawVisibility") {
                        expect(dataPoint.visibility?.value) == dataPoint.rawVisibility?.rawValue
                    }
                }

                describe("its unit") {
                    it("should be metersPerSecond") {
                        expect(dataPoint.visibility?.unit) == .kilometers
                    }
                }
            }

            describe("its windGust") {
                beforeEach {
                    dataPoint = try! HourlyDataPoint.fixtures.valid.object()
                }

                describe("its value") {
                    it("should be equal to its rawWindGust") {
                        expect(dataPoint.windGust?.value) == dataPoint.rawWindGust?.rawValue
                    }
                }

                describe("its unit") {
                    it("should be metersPerSecond") {
                        expect(dataPoint.windGust?.unit) == .metersPerSecond
                    }
                }
            }
            
            describe("its windSpeed") {
                beforeEach {
                    dataPoint = try! HourlyDataPoint.fixtures.valid.object()
                }

                describe("its value") {
                    it("should be equal to its rawWindSpeed") {
                        expect(dataPoint.windSpeed?.value) == dataPoint.rawWindSpeed?.rawValue
                    }
                }

                describe("its unit") {
                    it("should be metersPerSecond") {
                        expect(dataPoint.windGust?.unit) == .metersPerSecond
                    }
                }
            }

            describe("its encoded form") {
                var dataPoint: HourlyDataPoint!

                beforeEach {
                    let originalDataPoint = try! HourlyDataPoint.fixtures.valid.object()
                    let newData = try! JSONEncoder().encode(originalDataPoint)

                    dataPoint = try! JSONDecoder().decode(HourlyDataPoint.self, from: newData)
                }

                it("should be decodable back into a object") {
                    expect(dataPoint).toNot(beNil())
                }
            }
        }
    }
}
