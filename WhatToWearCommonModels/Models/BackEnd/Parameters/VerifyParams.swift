import Foundation

public struct VerifyParams: Codable {
    // MARK: properties
    public let email: String
    public let verificationId: Int
    
    // MARK: init
    public init(email: String, verificationId: Int) {
        self.email = email
        self.verificationId = verificationId
    }
}
