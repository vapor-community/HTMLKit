/*
 Abstract:
 The file contains the default definition of different types of layouts.
 */

/// A type that defines a page layout.
public protocol Page {
    
    var views: [View] { get }
}

/// A type that defines a view layout.
public protocol View: Layout {
    
    static var name: String { get }
}

extension View {
    
    public static var name: String {
        return String(reflecting: type(of: Self.self))
    }
}

public protocol Component: Layout {
}
