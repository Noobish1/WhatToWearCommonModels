import Foundation
import WhatToWearCommonCore

// MARK: LatestAppUpdate
public struct LatestAppUpdate: Codable, Equatable {
    public enum CodingKeys: String, CodingKey {
        case minimumOSVersionString = "minimumOsVersion"
        case urlString = "trackViewUrl"
        case versionString = "version"
        case releaseNotes = "releaseNotes"
        case currentVersionReleaseDate = "currentVersionReleaseDate"
    }

    // MARK: properties
    internal let minimumOSVersionString: Version<String>
    internal let urlString: AbsoluteURL<String>
    internal let versionString: Version<String>
    internal let currentVersionReleaseDate: ISO8601UTC<String>

    public let releaseNotes: String
    
    // MARK: init
    public init(
        minimumOSVersionString: Version<String>,
        urlString: AbsoluteURL<String>,
        versionString: Version<String>,
        currentVersionReleaseDate: ISO8601UTC<String>,
        releaseNotes: String
    ) {
        self.minimumOSVersionString = minimumOSVersionString
        self.urlString = urlString
        self.versionString = versionString
        self.currentVersionReleaseDate = currentVersionReleaseDate
        self.releaseNotes = releaseNotes
    }
}

// MARK: computed properties
extension LatestAppUpdate {
    public var minimumOSVersion: OperatingSystemVersion {
        return minimumOSVersionString.object
    }

    public var version: OperatingSystemVersion {
        return versionString.object
    }

    public var url: URL {
        return urlString.url
    }

    public var versionReleaseDate: Date {
        return currentVersionReleaseDate.date
    }

    public func isInstallable(
        for bundle: Bundle,
        operatingSystemVersion: OperatingSystemVersion = ProcessInfo.processInfo.operatingSystemVersion
    ) -> Bool {
        let isNewVersion = version > bundle.version
        let ourOSIsAboveTheMinimumRequired = operatingSystemVersion >= minimumOSVersion
        let updateIs24HoursOld = Date.now.timeIntervalSince(versionReleaseDate) > 24.hours

        return isNewVersion && ourOSIsAboveTheMinimumRequired && updateIs24HoursOld
    }
}
