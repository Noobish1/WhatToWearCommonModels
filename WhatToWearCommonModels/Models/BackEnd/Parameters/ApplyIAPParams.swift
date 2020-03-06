import Foundation

public struct ApplyIAPParams: Codable {
    // MARK: properties
    public let productID: String
    
    // MARK: init
    public init(productID: String) {
        self.productID = productID
    }
}
