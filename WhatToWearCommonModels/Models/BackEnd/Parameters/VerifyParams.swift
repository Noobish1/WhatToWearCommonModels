import Foundation

public struct VerifyParams: Codable {
    // MARK: properties
    public let verificationCode: String
    
    // MARK: init
    public init(verificationCode: String) {
        self.verificationCode = verificationCode
    }
}
