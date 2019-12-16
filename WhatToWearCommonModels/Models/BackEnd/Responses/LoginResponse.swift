import Foundation

// MARK: LoginResponse
public struct LoginResponse: Codable, Equatable {
    // MARK: properties
    public let token: String
    public let user: UserResponse
    
    // MARK: init
    public init(token: String, user: UserResponse) {
        self.token = token
        self.user = user
    }
}
