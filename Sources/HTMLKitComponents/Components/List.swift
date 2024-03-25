/*
 Abstract:
 The file contains everything related to the list component.
 */

import HTMLKit

/// A component that collects and arranges list items vertically.
public struct List: View, Modifiable, Actionable {
    
    internal var id: String?
    
    /// The content of the list.
    internal var content: [ListElement]
    
    /// The classes of the list.
    internal var classes: [String]
    
    internal var events: [String]?
    
    /// Creates a list.
    public init(direction: Tokens.FlowDirection, @ContentBuilder<ListElement> content: () -> [ListElement]) {
        
        self.content = content()
        self.classes = ["list", "direction:\(direction.value)"]
    }
    
    public var body: Content {
        UnorderedList {
            for item in content {
                ListItem {
                    item
                }
                .class("list-row")
            }
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
    
    /// Sets the style for the list.
    public func listStyle(_ style: Tokens.ListStyle) -> List {
        
        var newSelf = self
        newSelf.classes.append("style:\(style.value)")
        
        return newSelf
    }
    
    public func listStyle(_ style: ListConfiguration) -> List {
        return self.mutate(classes: style.configuration)
    }
    
    public func listSpacing(_ size: Tokens.ListSpace) -> List {
        return mutate(class: "spacing:\(size.value)")
    }
    
    public func tag(_ value: String) -> List {
        return self.mutate(id: value)
    }
}

extension List: MouseEvent {

    public func onHover(@ActionBuilder action: (ViewAction) -> [Action]) -> List {
        return self.mutate(hoverevent: action(.init()))
    }
    
    public func onLeave(@ActionBuilder action: (ViewAction) -> [Action]) -> List {
        return self.mutate(leaveevent: action(.init()))
    }
}

extension List: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> List {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func opacity(_ value: Tokens.OpacityValue) -> List {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> List {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> List {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> List {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> List {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> List {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> List {
        return self.mutate(bordershape: shape.value)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> List {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> List {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> List {
        return self.mutate(margin: length.value, insets: insets)
    }
}
