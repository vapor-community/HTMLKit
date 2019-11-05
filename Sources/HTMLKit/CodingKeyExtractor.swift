import Runtime

public struct CodingKeyExtractor<D: Decodable> {
    public let type: D.Type
    public let keyType: CodingKey.Type
    internal var valueInfo: TypeInfo
    internal var keyInfo: TypeInfo

    public init(type: D.Type) {
        self.type = type

        let decoder = CodingKeyDecoder()
        do { _ = try type.init(from: decoder) }
        catch { }

        self.keyType = decoder.type
        self.valueInfo = try! typeInfo(of: type)
        self.keyInfo = try! typeInfo(of: decoder.type)
    }
    
    public func keyName<V>(forKeyPath keyPath: KeyPath<D, V>) -> String? {
        guard let offset = MemoryLayout<D>.offset(of: keyPath) else {
            return nil
        }
        
        return valueInfo.properties.first { info in
            return info.offset == offset
        }?.name
    }

    public func codingKeys() -> [CodingKey] {
        return self.keyInfo.cases.compactMap { self.keyType.init(stringValue: $0.name) }
    }

    public func codingKey(for string: String) -> CodingKey? {
        return self.keyType.init(stringValue: string)
    }

    public func codingKey(for int: Int) -> CodingKey? {
        return self.keyType.init(intValue: int)
    }
}

internal final class CodingKeyDecoder: Decoder {
    enum Exit: Error {
        case finish
    }
    
    var type: CodingKey.Type!

    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        self.type = Key.self
        throw Exit.finish
    }

    // Required

    let codingPath: [CodingKey] = []
    let userInfo: [CodingUserInfoKey : Any] = [:]

    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        throw Exit.finish
    }

    func singleValueContainer() throws -> SingleValueDecodingContainer {
        throw Exit.finish
    }
}
