import Quick
import Nimble
@testable import WhatToWearCommonModels

internal final class DegreesSpec: QuickSpec {
    internal override func spec() {
        describe("Degreex") {
            describe("its toRadians") {
                var expected: Radians<Double>!
                var actual: Radians<Double>!
                
                beforeEach {
                    let degrees = Degrees(rawValue: Double.wtw.random())
                    let degreesMeasurement = Measurement<UnitAngle>(
                        value: degrees.rawValue, unit: .degrees
                    )
                    
                    expected = Radians(rawValue: degreesMeasurement.converted(to: .radians).value)
                    actual = degrees.toRadians()
                }
                
                it("should return a degrees object with a correct rawValue") {
                    expect(actual) == expected
                }
            }
        }
    }
}
