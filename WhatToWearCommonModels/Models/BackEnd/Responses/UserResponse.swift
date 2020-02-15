import Foundation

// MARK: UserResponse
public struct UserResponse: Codable, Equatable {
    // MARK: properties
    public let id: UUID
    public let firstName: String
    public let lastName: String
    public let email: String
    public let identifierForVendor: String?
    public let callsMade: Int
    public let callLimit: Int
    public let verified: Bool
    public let globalSettings: GlobalSettings
    public let storedLocations: StoredLocations?
    public let storedRules: StoredRules
    public let timeSettings: TimeSettings
    
    // MARK: init
    public init(
        id: UUID,
        firstName: String,
        lastName: String,
        email: String,
        identifierForVendor: String?,
        callsMade: Int,
        callLimit: Int,
        verified: Bool,
        globalSettings: GlobalSettings,
        storedLocations: StoredLocations?,
        storedRules: StoredRules,
        timeSettings: TimeSettings
    ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.identifierForVendor = identifierForVendor
        self.callsMade = callsMade
        self.callLimit = callLimit
        self.verified = verified
        self.globalSettings = globalSettings
        self.storedLocations = storedLocations
        self.storedRules = storedRules
        self.timeSettings = timeSettings
    }
}
