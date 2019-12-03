import Foundation

public struct SignupParams: Codable {
    // MARK: properties
    public let email: String
    public let password: String
    
    // MARK: init
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
