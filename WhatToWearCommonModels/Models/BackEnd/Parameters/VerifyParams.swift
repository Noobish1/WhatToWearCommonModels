import Foundation

public struct VerifyParams: Codable {
    public let email: String
    public let verificationId: Int
}
