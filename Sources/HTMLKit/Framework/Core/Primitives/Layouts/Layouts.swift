/*
 Abstract:
 The file contains the default definition of different types of layouts.
 */

/// A type that defines a page layout.
///
/// The page covers the whole frame of a hompage. It can contain views and components.
public protocol Page: AnyLayout, GlobalElement {
}

/// A type that defines a view layout.
///
/// The view is a single part of page. It can contain views ad components.
public protocol View: AnyLayout, GlobalElement {
}

/// A type that defines a component layout.
///
/// The component is a partial part of a view or page.
public protocol Component: AnyLayout, GlobalElement {
}
