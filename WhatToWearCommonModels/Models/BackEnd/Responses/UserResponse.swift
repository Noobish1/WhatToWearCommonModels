import Foundation

// MARK: UserResponse
public struct UserResponse: Codable, Equatable {
    // MARK: properties
    public let id: UUID
    public let firstName: String
    public let lastName: String
    public let email: String
    public let callsMade: Int
    public let callLimit: Int
    public let verified: Bool
    
    // MARK: init
    public init(
        id: UUID,
        firstName: String,
        lastName: String,
        email: String,
        callsMade: Int,
        callLimit: Int,
        verified: Bool
    ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.callsMade = callsMade
        self.callLimit = callLimit
        self.verified = verified
    }
}
