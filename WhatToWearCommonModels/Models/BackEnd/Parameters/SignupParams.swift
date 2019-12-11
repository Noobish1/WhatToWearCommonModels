import Foundation

public struct SignupParams: Codable {
    // MARK: properties
    public let email: String
    public let password: String
    public let globalSettings: GlobalSettings
    public let timeSettings: TimeSettings
    public let storedRules: StoredRules
    public let storedLocations: StoredLocations?
    
    // MARK: init
    public init(
        email: String,
        password: String,
        globalSettings: GlobalSettings,
        timeSettings: TimeSettings,
        storedRules: StoredRules,
        storedLocations: StoredLocations?
    ) {
        self.email = email
        self.password = password
        self.globalSettings = globalSettings
        self.timeSettings = timeSettings
        self.storedRules = storedRules
        self.storedLocations = storedLocations
    }
}
