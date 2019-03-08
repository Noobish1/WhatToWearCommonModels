import Foundation

public protocol FixtureProtocol: RawRepresentable where RawValue == String {
    associatedtype EnclosingType: Decodable
    
    func fixtureData(for bundle: Bundle) throws -> Data
    func object(for bundle: Bundle, decoder: JSONDecoder) throws -> EnclosingType
}

public extension FixtureProtocol {
    // MARK: objects
    public func object(for bundle: Bundle, decoder: JSONDecoder = .init()) throws -> EnclosingType {
        let data = try fixtureData(for: bundle)
        
        return try decoder.decode(EnclosingType.self, from: data)
    }
    
    // MARK: data
    public func fixtureData(for bundle: Bundle) throws -> Data {
        return try fixtureData(for: bundle, resource: self.rawValue, type: "json")
    }
    
    private func fixtureData(for bundle: Bundle, resource: String, type: String) throws -> Data {
        guard let path = bundle.path(forResource: resource, ofType: type) else {
            fatalError("Could not find path for resource: \(resource) of type: \(type)")
        }
        
        return try Data(contentsOf: URL(fileURLWithPath: path))
    }
}
