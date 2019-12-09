import Foundation
import WhatToWearCommonCore

// MARK: TimeSymbol
public enum TimeSymbol: String, SymbolProtocol, FiniteSetValueProtocol {
    case between = "between"
    case before = "before"
    case after = "after"
}
