import Foundation

public struct VerifyParams: Codable {
    // MARK: properties
    public let verificationCode: Int
    
    // MARK: init
    public init(verificationCode: Int) {
        self.verificationCode = verificationCode
    }
}
