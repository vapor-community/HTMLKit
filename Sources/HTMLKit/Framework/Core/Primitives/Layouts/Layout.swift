/*
 Abstract:
 The file contains the default definition of a layout. It defines which properties and methods a layout should come with.
 */

import Foundation

public protocol Layout: Content {
    
    /// The content of the page.
    @ContentBuilder<Content> var body: Content { get }
}
