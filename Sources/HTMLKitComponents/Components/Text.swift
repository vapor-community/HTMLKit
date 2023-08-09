/*
 Abstract:
 The file contains everything related to the text component.
 */

import HTMLKit

/// A component that displays text.
public struct Text: View, Actionable, Modifiable {

    internal var id: String?
    
    /// The content of the text.
    internal var content: [Content]
    
    /// The classes of the text.
    internal var classes: [String]
    
    internal var events: [String]?
    
    /// Creates a text.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["text"]
    }
    
    public init(_ localizedStringKey: String) {
        
        self.content = [LocalizedStringKey(key: localizedStringKey)]
        self.classes = ["text"]
    }
    
    /// Creates a text.
    internal init(content: [Content], classes: [String], events: [String]?, id: String?) {
        
        self.content = content
        self.classes = classes
        self.events = events
        self.id = id
    }
    
    public var body: Content {
        Paragraph {
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
}

extension Text: HoverModifier {
    
    public func tag(_ value: String) -> Text {
        return self.mutate(id: value)
    }
    
    public func onHover(perfom action: Actions) -> Text {
        return self.mutate(hoverevent: action.script)
    }
    
    public func onLeave(perfom action: Actions) -> Text {
        return self.mutate(leaveevent: action.script)
    }
}

extension Text: PressModifier {

    public func onClick(perfom action: Actions) -> Text {
        return self.mutate(clickevent: action.script)
    }
    
    public func onTap(perfom action: Actions) -> Text {
        return self.mutate(tapevent: action.script)
    }
    
    public func onPress(perfom action: Actions) -> Text {
        return self.mutate(pressevent: action.script)
    }
}

extension Text: TextModifier {
    
    public func font(_ style: Tokens.TextStyle) -> Text {
        return self.mutate(font: style.value)
    }
    
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> Text {
        return self.mutate(foregroundcolor: color.value)
    }
    
    public func fontSize(_ size: Tokens.FontSize) -> Text {
        return self.mutate(fontsize: size.value)
    }
    
    public func fontWeight(_ weight: Tokens.FontWeight) -> Text {
        return self.mutate(fontweight: weight.value)
    }
    
    public func fontTransformation(_ transformation: Tokens.TextTransformation) -> Text {
        return self.mutate(fonttransformation: transformation.value)
    }
    
    public func fontStyle(_ style: Tokens.FontStyle) -> Text {
        return self.mutate(fontstyle: style.value)
    }
    
    public func bold() -> Text {
        return self.mutate(fontweight: Tokens.FontWeight.bold.value)
    }
    
    public func bold(_ condition: Bool) -> Text {
        
        if condition {
            return self.mutate(fontweight: Tokens.FontWeight.bold.value)
        }
        
        return self
    }
    
    public func italic() -> Text {
        return self.mutate(fontstyle: Tokens.FontStyle.italic.value)
    }
    
    public func italic(_ condition: Bool) -> Text {
    
        if condition {
            return self.mutate(fontstyle: Tokens.FontStyle.italic.value)
        }
        
        return self
    }
    
    public func underline() -> Text {
        return self.mutate(fontdecoration: Tokens.TextDecoration.underline.value)
    }
    
    public func underline(_ condition: Bool) -> Text {
        
        if condition {
            return self.mutate(fontdecoration: Tokens.TextDecoration.underline.value)
        }
        
        return self
    }
    
    public func strikethrough() -> Text {
        return self.mutate(fontdecoration: Tokens.TextDecoration.strikeThrough.value)
    }
    
    public func strikethrough(_ condition: Bool) -> Text {
        
        if condition {
            return self.mutate(fontdecoration: Tokens.TextDecoration.strikeThrough.value)
        }
        
        return self
    }
    
    public func lineSpacing(_ height: Tokens.LineHeight) -> Text {
        return self.mutate(lineheight: height.value)
    }
    
    public func lineLimit(_ limit: Tokens.LineLimit) -> Text {
        return self.mutate(linelimit: limit.value)
    }
}

extension Text: ViewModifier {
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Text {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func opacity(_ value: Tokens.OpacityValue) -> Text {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Text {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> Text {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Text {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Text {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Text {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Text {
        return self.mutate(bordershape: shape.value)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> Text {
        return self.mutate(bordercolor: color.value)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> Text {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Text {
        return self.mutate(margin: length.value, insets: insets)
    }
}
