import HTMLKit

extension HTMLKit.Image {

    /// Specify the source path to load the image from.
    ///
    /// - Parameter value: A container holding the concrete source type.
    ///
    /// - Returns: The image
    internal func source(_ value: DynamicSource) -> HTMLKit.Image {

        switch value {
        case .deferred(let value):
            return self.source(value)

        case .literal(let value):
            return self.source(value)
        }
    }
    
    /// Provide an alternative information.
    ///
    /// ```swift
    /// Image()
    ///     .alternate("Lorem ipsum...")
    /// ```
    ///
    /// - Parameter value: A container holding the concrete type.
    ///
    /// - Returns: The element
    internal func alternate(_ value: DynamicString) -> HTMLKit.Image {

        switch value {
        case .localized(let value, let tableName):
            return self.alternate(value, tableName: tableName)

        case .literal(let value):
            return self.alternate(value)
            
        default:
            return self
        }
    }
}

extension HTMLKit.Video {

    /// Specify the source path to load the video from.
    ///
    /// - Parameter value: A container holding the concrete source type.
    ///
    /// - Returns: The video
    internal func source(_ value: DynamicSource) -> HTMLKit.Video {

        switch value {
        case .deferred(let value):
            return self.source(value)

        case .literal(let value):
            return self.source(value)
        }
    }
    
    /// Indicate a label for the current element.
    ///
    /// ```swift
    /// Button {
    ///     Vector {
    ///        Path {
    ///        }
    ///        .draw("M...")
    ///     }
    /// }
    /// .accessibilityLabel("Lorem ipsum")
    /// ```
    /// - Parameter value: The label to describe the element.
    ///
    /// - Returns: The element
    internal func accessibilityLabel(_ value: DynamicString) -> HTMLKit.Video {

        switch value {
        case .localized(let value, let tableName):
            return self.accessibilityLabel(value, tableName: tableName)

        case .literal(let value):
            return self.accessibilityLabel(value)
            
        default:
            return self
        }
    }
}
