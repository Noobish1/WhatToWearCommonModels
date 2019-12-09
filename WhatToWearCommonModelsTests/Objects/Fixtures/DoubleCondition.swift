import Foundation
import WhatToWearCommonModels
import Rswift
import WhatToWearCommonTesting

extension DoubleCondition: Fixturable {
    public enum Fixtures: FixtureProtocol {
        public typealias EnclosingType = DoubleCondition

        case valid

        public var url: URL {
            switch self {
                case .valid: return R.file.doubleConditionJson()!
            }
        }
    }
}
