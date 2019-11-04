import BSON

extension Primitive {
    var string: String? {
        switch self {
        case let value as String:
            return value
        case let value as Int:
            return String(value)
        case let value as Double:
            return String(value)
        case let value as Bool:
            return String(value)
        default:
            return nil
        }
    }
}
