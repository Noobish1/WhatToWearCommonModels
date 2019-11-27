import Quick
import Nimble
@testable import WhatToWearCommonModels

internal final class RadiansSpec: QuickSpec {
    internal override func spec() {
        describe("Radians") {
            describe("its toDegrees") {
                var expected: Degrees<Double>!
                var actual: Degrees<Double>!

                beforeEach {
                    let radians = Radians(rawValue: Double.wtw.random())
                    let radiansMeasurement = Measurement<UnitAngle>(
                        value: radians.rawValue, unit: .radians
                    )

                    expected = Degrees(rawValue: radiansMeasurement.converted(to: .degrees).value)
                    actual = radians.toDegrees()
                }

                it("should return a degrees object with a correct rawValue") {
                    expect(actual) == expected
                }
            }
        }
    }
}
