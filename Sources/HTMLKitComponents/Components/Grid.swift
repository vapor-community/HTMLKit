import HTMLKit

/// A view that represents grid.
///
/// Use `Grid` to collect and arrange items horizontally.
///
/// ```swift
/// Grid(ratio: .third) {
///     Card {
///         Text {
///             "Lorem ipsum..."
///         }
///     } header: {
///         Image(source: "...png")
///     }
///     Card {
///         Text {
///             "Lorem ipsum..."
///         }
///     } header: {
///         Image(source: "...png")
///     }
/// }
/// ```
public struct Grid: View, Modifiable, Actionable {
    
    /// The unique identifier of the grid.
    internal var id: String?
    
    /// The body content of the grid.
    internal let content: [Content]
    
    /// The class names for the grid.
    internal var classes: [String]
    
    /// The event handlers on the grid.
    internal var events: [String]?
    
    /// The horizontal content space of the grid.
    internal let horizontalSpacing: Tokens.ContentSpace?
    
    /// The vertical content space of the grid.
    internal let verticalSpacing: Tokens.ContentSpace?
    
    /// Create a grid.
    ///
    /// - Parameters:
    ///   - ratio: The ratio of items
    ///   - spacing: The spacing between items
    ///   - content: The grid's content
    public init(ratio: Tokens.GridRatio = .fit, spacing: Tokens.ContentSpace? = nil, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["grid", "ratio:\(ratio.value)"]
        self.horizontalSpacing = spacing
        self.verticalSpacing = spacing
    }
    
    /// Creates a grid
    ///
    /// - Parameters:
    ///   - ratio: The ratio of items
    ///   - horizontalSpacing: The horizontal gap between items
    ///   - verticalSpacing: The vertical gap between items
    ///   - content: The grid's content
    public init(ratio: Tokens.GridRatio = .fit, horizontalSpacing: Tokens.ContentSpace? = nil, verticalSpacing: Tokens.ContentSpace? = nil, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["grid", "ratio:\(ratio.value)"]
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
    }
    
    public var body: Content {
        Division {
            content
        }
        .class(classes)
        .modify(unwrap: id) {
            $0.id($1)
        }
        .modify(unwrap: horizontalSpacing, use: .combining) {
            $0.class("horizontal-spacing:\($1.value)")
        }
        .modify(unwrap: verticalSpacing, use: .combining) {
            $0.class("vertical-spacing:\($1.value)")
        }
        if let events = self.events {
            Script {
                events
            }
        }
    }
    
    /// Set the identifier for the grid.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The grid
    public func tag(_ value: String) -> Grid {
        return self.mutate(id: value)
    }
}

extension Grid: MouseEvent {

    public func onHover(@ActionBuilder action: (ViewAction) -> [Action]) -> Grid {
        return self.mutate(hoverevent: action(.init()))
    }
    
    public func onLeave(@ActionBuilder action: (ViewAction) -> [Action]) -> Grid {
        return self.mutate(leaveevent: action(.init()))
    }
}

extension Grid: ViewModifier {
    
    @available(*, deprecated, message: "Use the background(_:) modifier instead.")
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Grid {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func background(_ color: Tokens.BackgroundColor) -> Grid {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func opacity(_ value: Tokens.OpacityValue) -> Grid {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Grid {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden(_ condition: Bool = true) -> Grid {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Grid {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Grid {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    @available(*, deprecated, message: "Use the border(_:width:shape:) modifier instead.")
    public func borderShape(_ shape: Tokens.BorderShape) -> Grid {
        return self.mutate(bordershape: shape.value)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small, shape: Tokens.BorderShape? = nil) -> Grid {
        return self.mutate(border: color.value, width: width.value, shape: shape?.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Grid {
        return self.mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Grid {
        return self.mutate(margin: length.value, insets: insets)
    }
}
