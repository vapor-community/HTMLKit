/*
 Abstract:
 The file contains the default definition of a layout. It defines which properties and methods a layout should come with.
 */

import Foundation

public protocol AnyLayout: AnyContent {
    
    /// The content of the page.
    @ContentBuilder<AnyContent> var body: AnyContent { get }
}
