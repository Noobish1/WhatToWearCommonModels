import Foundation

public struct ResetAndChangePasswordParams: Codable {
    // MARK: properties
    public let newPassword: String
    public let verificationCode: String
    
    // MARK: init
    public init(newPassword: String, verificationCode: String) {
        self.newPassword = newPassword
        self.verificationCode = verificationCode
    }
}
