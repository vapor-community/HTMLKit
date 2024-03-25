/*
 Abstract:
 The file contains a tabs component.
 */

import HTMLKit

/// A tab component
public struct Tabs: View, Identifiable, Modifiable {
    
    internal var id: String?
    
    /// The panes of the tabs component.
    internal var content: [Pane]
    
    /// The classes of the tabs.
    internal var classes: [String]
    
    /// Creates a tabs.
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
    
    public func hidden() -> Tabs {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Tabs {
        
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


public struct Pane: View, Modifiable {
    
    internal var id: String?
    
    internal var classes: [String]
    
    internal var label: [Content]
    
    internal var badge: Int?
    
    internal var content: [Content]
    
    public init(@ContentBuilder<Content> content: () -> [Content], @ContentBuilder<Content> label: () -> [Content]) {
        
        self.content = content()
        self.label = label()
        self.classes = ["pane"]
    }
    
    public var body: Content {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func tag(_ value: String) -> Pane {
        
        var newSelf = self
        newSelf.id = value
        
        return newSelf
    }
    
    public func badge(_ value: Int) -> Pane {
        
        var newSelf = self
        newSelf.badge = value
        
        return newSelf
    }
}
