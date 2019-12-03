import Foundation

internal struct VerifyParams: Codable {
    internal let email: String
    internal let verificationId: Int
}
