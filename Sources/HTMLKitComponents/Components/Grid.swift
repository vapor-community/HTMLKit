/*
 Abstract:
 The file contains everything related to the grid component.
 */

import HTMLKit

/// A component that collects and arranges collection items horizontally.
public struct Grid: View, Modifiable, Actionable {
    
    public var id: String?
    
    /// The content of the collection.
    internal var content: [Content]
    
    /// The classes of the collection.
    internal var classes: [String]
    
    internal var events: [String]?
    
    /// Creates a collection.
    public init(ratio: Tokens.GridRatio = .fit, spacing: Tokens.ContentSpace? = nil, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["grid", "ratio:\(ratio.value)"]
        
        if let spacing {
            self.classes.append("horizontal-spacing:\(spacing.value)")
            self.classes.append("vertical-spacing:\(spacing.value)")
        }
    }
    
    /// Creates a collection.
    public init(ratio: Tokens.GridRatio = .fit, horizontalSpacing: Tokens.ContentSpace? = nil, verticalSpacing: Tokens.ContentSpace? = nil, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["grid", "ratio:\(ratio.value)"]
        
        if let horizontalSpacing {
            self.classes.append("horizontal-spacing:\(horizontalSpacing.value)")
        }
        
        if let verticalSpacing {
            self.classes.append("vertical-spacing:\(verticalSpacing.value)")
        }
    }
    
    public var body: Content {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
        if let events = self.events {
            Script {
                events
            }
        }
    }
    
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
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Grid {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func opacity(_ value: Tokens.OpacityValue) -> Grid {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Grid {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> Grid {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Grid {
        
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
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Grid {
        return self.mutate(bordershape: shape.value)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> Grid {
        return self.mutate(bordercolor: color.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil) -> Grid {
        return mutate(frame: width.value, height: height?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Grid {
        return self.mutate(margin: length.value, insets: insets)
    }
}
