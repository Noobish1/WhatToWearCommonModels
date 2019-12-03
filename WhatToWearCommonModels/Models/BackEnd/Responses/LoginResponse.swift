import Foundation

// MARK: LoginResponse
internal struct LoginResponse: Codable {
    // MARK: properties
    internal let token: String
    internal let user: UserResponse
}
