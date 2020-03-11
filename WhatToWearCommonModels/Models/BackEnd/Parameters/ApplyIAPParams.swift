import Foundation

public struct ApplyIAPParams: Codable {
    // MARK: properties
    public let productIDs: [String]
    
    // MARK: init
    public init(productIDs: [String]) {
        self.productIDs = productIDs
    }
}
