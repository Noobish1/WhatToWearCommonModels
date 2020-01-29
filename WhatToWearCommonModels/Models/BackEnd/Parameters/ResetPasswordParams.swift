import Foundation

public struct ResetPasswordParams: Codable {
    // MARK: properties
    public let email: String
    
    // MARK: init
    public init(email: String) {
        self.email = email
    }
}
