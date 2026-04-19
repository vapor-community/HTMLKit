import HTMLKit

extension HTMLKit.Button {
    
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
    internal func accessibilityLabel(_ value: DynamicString) -> HTMLKit.Button {

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

extension HTMLKit.Anchor {
    
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
    internal func accessibilityLabel(_ value: DynamicString) -> HTMLKit.Anchor {

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
