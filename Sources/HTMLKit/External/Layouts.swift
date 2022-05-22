/*
 Abstract:
 The file contains the protocols for the layout-components.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
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
    
    associatedtype Context
    
    var context: TemplateValue<Context> { get }
}

extension View {
    
    public var context: TemplateValue<Context> { .root() }
}

/// A type that defines a component layout.
///
/// The component is a partial part of a view or page.
public protocol Component: AnyLayout, GlobalElement {
}
