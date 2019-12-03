import Foundation

// MARK: LoginResponse
public struct LoginResponse: Codable {
    // MARK: properties
    public let token: String
    public let user: UserResponse
}
