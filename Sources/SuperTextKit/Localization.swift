public protocol Localization: RawRepresentable, CaseIterable where RawValue == String {}

@propertyWrapper
public struct Localized<T: Localization> {
    public let wrappedValue: T
    
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
    
    public var projectedValue: Localized<T> {
        return self
    }
}
