/// The struct is for
///
///
@dynamicMemberLookup struct StringValue {
    
    public subscript<Type: ExpressibleByStringLiteral>(dynamicMember string: Type) -> StringValue {
        return .init()
    }
}
