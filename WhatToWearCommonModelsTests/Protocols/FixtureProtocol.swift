import Foundation

internal protocol FixtureProtocol: RawRepresentable where RawValue == String {
    associatedtype EnclosingType: Decodable
    
    func fixtureData(for bundle: Bundle) -> Data
    func object(for bundle: Bundle) -> EnclosingType
}

internal extension FixtureProtocol {
    // MARK: objects
    internal func object(for bundle: Bundle) -> EnclosingType {
        let data = fixtureData(for: bundle)
        
        return try! JSONDecoder.wtwDecoder().decode(EnclosingType.self, from: data)
    }
    
    // MARK: data
    internal func fixtureData(for bundle: Bundle) -> Data {
        return fixtureData(for: bundle, resource: self.rawValue, type: "json")
    }
    
    private func fixtureData(for bundle: Bundle, resource: String, type: String) -> Data {
        let path = bundle.path(forResource: resource, ofType: type)!
        
        return try! Data(contentsOf: URL(fileURLWithPath: path))
    }
}
