import HTMLKit

/// A view that represents a file dialog.
///
/// Use `FileDialog` to upload files to the server.
///
/// ```swift
/// FileDialog(name: "lorem")
/// ```
public struct FileDialog: View, Modifiable, Identifiable {
    
    /// The unique identifier of the dialog.
    internal var id: String?
    
    /// The name of the search field.
    internal let name: String
    
    /// The class names for the field.
    internal var classes: [String]
    
    /// The event handlers on the field.
    internal var events: [String]?
    
    /// Create a file dialog.
    ///
    /// - Parameter name: The name to assign to the field.
    public init(name: String) {
        
        self.name = name
        self.classes = ["filedialog"]
    }
    
    public var body: Content {
        Input()
            .type(.file)
            .name(name)
            .class(classes.joined(separator: " "))
            .modify(unwrap: id) {
                $0.id($1)
            }
    }
    
    /// Set the identifier for the dialog.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The dialog
    public func tag(_ value: String) -> FileDialog {
        return self.mutate(id: value)
    }
}

extension FileDialog: InputModifier {
    
    public func disabled(_ condition: Bool) -> FileDialog {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> FileDialog {
        return self.mutate(focuscolor: color.value)
    }
}

extension FileDialog: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> FileDialog {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> FileDialog {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> FileDialog {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> FileDialog {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> FileDialog {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> FileDialog {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> FileDialog {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> FileDialog {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> FileDialog {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> FileDialog {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> FileDialog {
        return self.mutate(margin: length.value, insets: insets)
    }
}
