/*
 Abstract:
 The file contains the default definition of different types of layouts.
 */

/// A type that defines a page layout.
public protocol Page: AnyLayout {
}

/// A type that defines a view layout.
public protocol View: AnyLayout {
}

/// A type that defines a component layout.
public protocol Component: AnyLayout {
}
