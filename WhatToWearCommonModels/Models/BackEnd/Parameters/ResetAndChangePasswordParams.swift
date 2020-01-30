import Foundation

public struct ResetAndChangePasswordParams: Codable {
    // MARK: properties
    public let email: String
    public let newPassword: String
    public let verificationCode: String
    
    // MARK: init
    public init(email: String, newPassword: String, verificationCode: String) {
        self.email = email
        self.newPassword = newPassword
        self.verificationCode = verificationCode
    }
}
