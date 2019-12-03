import Foundation

// MARK: UserResponse
public struct UserResponse: Codable {
    // MARK: properties
    public let id: UUID
    public let email: String
    public let callsMade: Int
    public let callLimit: Int
    public let verified: Bool
}
