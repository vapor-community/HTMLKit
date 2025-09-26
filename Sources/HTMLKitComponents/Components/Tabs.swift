import HTMLKit

/// A view that represents tabs container.
///
/// Use `Tabs` to switch between multiple panes.
///
/// ```swift
/// Tabs(direction: .horizontal) {
///     Pane {
///         Text {
///             "Lorem ipsum..."
///         }
///     } label: {
///         Text {
///             "Lorem ipsum"
///         }
///     }
///     .tag("lorem")
///     Pane {
///         Text {
///             "Lorem ipsum..."
///         }
///     } label: {
///         Text {
///             "Lorem ipsum"
///         }
///     }
///     .tag("ipsum")
/// }
/// ```
public struct Tabs: View, Identifiable, Modifiable {
    
    /// The unique identifier of the tabs.
    internal var id: String?
    
    /// The panes of the tabs.
    internal var content: [Pane]
    
    /// The class names of the tabs.
    internal var classes: [String]
    
    /// Create a tabs.
    ///
    /// - Parameters:
    ///   - direction: The direction the tabs should go
    ///   - content: The tab's content.
    public init(direction: Tokens.FlowDirection, @ContentBuilder<Pane> content: () -> [Pane]) {
        
        self.content = content()
        self.classes = ["tabs", "direction:\(direction.value)"]
    }
    
    public var body: Content {
        Division {
            Division {
                for item in content {
                    Division {
                        Anchor {
                            item.label
                        }
                        .class("tab-label")
                        .modify(unwrap: item.id) {
                            $0.reference("#" + $1)
                        }
                        if let badge = item.badge {
                            Span {
                                "\(badge)"
                            }
                            .class("tab-badge")
                        }
                    }
                    .class("tabs-tab")
                }
            }
            .class("tabs-tabs")
            Division {
                content
            }
            .class("tabs-panes")
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    /// Set the identifier for the tabs.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The tabs
    public func tag(_ value: String) -> Tabs {
        return self.mutate(id: value)
    }
}

extension Tabs: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> Tabs {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Tabs {
        return self.mutate(zindex: index.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Tabs {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func hidden(_ condition: Bool = true) -> Tabs {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Tabs {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet, length: Tokens.PaddingLength) -> Tabs {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Tabs {
        return self.mutate(bordershape: shape.value)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> Tabs {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight?, alignment: Tokens.FrameAlignment?) -> Tabs {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet, length: Tokens.MarginLength) -> Tabs {
        return self.mutate(margin: length.value, insets: insets)
    }
}
