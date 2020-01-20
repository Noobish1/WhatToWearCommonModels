import Foundation

public struct ChangeEmailParams: Codable {
    // MARK: properties
    public let newEmail: String
    
    // MARK: init
    public init(newEmail: String) {
        self.newEmail = newEmail
    }
}
