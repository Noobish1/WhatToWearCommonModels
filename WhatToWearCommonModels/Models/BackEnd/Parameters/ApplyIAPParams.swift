import Foundation
import WhatToWearCommonCore

public struct ApplyIAPParams: Codable {
    // MARK: properties
    public let productIDs: NonEmptyArray<String>
    
    // MARK: init
    public init(productIDs: NonEmptyArray<String>) {
        self.productIDs = productIDs
    }
}
