import Foundation

public struct ChangePasswordParams: Codable {
    // MARK: properties
    public let newPassword: String
    
    // MARK: init
    public init(newPassword: String) {
        self.newPassword = newPassword
    }
}
