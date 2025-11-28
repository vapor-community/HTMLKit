import HTMLKit

extension HTMLKit.Image {

    /// Specify the source path to load the image from.
    ///
    /// - Parameter value: A container holding the concrete source type.
    ///
    /// - Returns: The image
    internal func source(_ value: DynamicType) -> HTMLKit.Image {

        switch value {
        case .string(let string):
            return self.source(string)

        case .value(let value):
            return self.source(value)
        }
    }
}

extension HTMLKit.Video {

    /// Specify the source path to load the video from.
    ///
    /// - Parameter value: A container holding the concrete source type.
    ///
    /// - Returns: The video
    internal func source(_ value: DynamicType) -> HTMLKit.Video {

        switch value {
        case .string(let string):
            return self.source(string)

        case .value(let value):
            return self.source(value)
        }
    }
}
