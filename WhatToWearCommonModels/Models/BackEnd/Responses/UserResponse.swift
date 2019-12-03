import Foundation

// MARK: UserResponse
internal struct UserResponse: Codable {
    // MARK: properties
    internal let id: UUID
    internal let email: String
    internal let callsMade: Int
    internal let callLimit: Int
    internal let verified: Bool
}
