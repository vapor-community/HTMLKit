/// The enum is for
///
///
public enum EscapingOption: CustomDebugStringConvertible {
    case unsafeNone
    case safeHTML

    public var debugDescription: String {
        switch self {
        case .unsafeNone: return "Unsafe"
        case .safeHTML: return "Safe"
        }
    }
}
