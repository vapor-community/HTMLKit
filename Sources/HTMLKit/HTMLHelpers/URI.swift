public protocol URIStringRepresentable {
    func makeURIString() -> String
}

extension String: URIStringRepresentable {
    @inlinable
    public func makeURIString() -> String { self }
}
