import Foundation

public struct SignupParams: Codable {
    // MARK: properties
    public let firstName: String
    public let lastName: String
    public let email: String
    public let password: String
    public let identifierForVendor: String?
    public let globalSettings: GlobalSettings
    public let timeSettings: TimeSettings
    public let storedRules: StoredRules
    public let storedLocations: StoredLocations?
    
    // MARK: init
    public init(
        firstName: String,
        lastName: String,
        email: String,
        password: String,
        identifierForVendor: String?,
        globalSettings: GlobalSettings,
        timeSettings: TimeSettings,
        storedRules: StoredRules,
        storedLocations: StoredLocations?
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.identifierForVendor = identifierForVendor
        self.globalSettings = globalSettings
        self.timeSettings = timeSettings
        self.storedRules = storedRules
        self.storedLocations = storedLocations
    }
}
