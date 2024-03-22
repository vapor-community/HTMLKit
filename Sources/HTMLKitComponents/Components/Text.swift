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
    public init(alignment: Tokens.TextAlignment = .leading, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["text", "alignment:\(alignment.value)"]
    }
    
    public init(_ localizedStringKey: String, alignment: Tokens.TextAlignment = .leading) {
        
        self.content = [LocalizedStringKey(key: localizedStringKey)]
        self.classes = ["text", "alignment:\(alignment.value)"]
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
    
    public func tag(_ value: String) -> Text {
        return self.mutate(id: value)
    }
}

extension Text: MouseEvent {
    
    public func onHover(@ActionBuilder action: (ViewAction) -> [Action]) -> Text {
        return self.mutate(hoverevent: action(.init()))
    }
    
    public func onLeave(@ActionBuilder action: (ViewAction) -> [Action]) -> Text {
        return self.mutate(leaveevent: action(.init()))
    }
}

extension Text: PressEvent {

    public func onClick(@ActionBuilder action: (ViewAction) -> [Action]) -> Text {
        return self.mutate(clickevent: action(.init()))
    }
    
    public func onTap(@ActionBuilder action: (ViewAction) -> [Action]) -> Text {
        return self.mutate(tapevent: action(.init()))
    }
    
    public func onPress(@ActionBuilder action: (ViewAction) -> [Action]) -> Text {
        return self.mutate(pressevent: action(.init()))
    }
}

extension Text: TextModifier {
   
    public func font(_ family: Tokens.FontFamily) -> Text {
        return mutate(fontfamily: family.value)
    }
    
    public func textStyle(_ style: Tokens.TextStyle) -> Text {
        return self.mutate(textstyle: style.value)
    }
    
    public func textStyle(_ style: TextConfiguration) -> Text {
        return self.mutate(classes: style.configuration)
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
    
    public func textCase(_ case: Tokens.TextCase) -> Text {
        return self.mutate(textcase: `case`.value)
    }
    
    public func fontStyle(_ style: Tokens.FontStyle) -> Text {
        return self.mutate(fontstyle: style.value)
    }
    
    public func textDecoration(_ decoration: Tokens.TextDecoration) -> Text {
        return self.mutate(textdecoration: decoration.value)
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
        return self.mutate(textdecoration: Tokens.TextDecoration.underline.value)
    }
    
    public func underline(_ condition: Bool) -> Text {
        
        if condition {
            return self.mutate(textdecoration: Tokens.TextDecoration.underline.value)
        }
        
        return self
    }
    
    public func strikethrough() -> Text {
        return self.mutate(textdecoration: Tokens.TextDecoration.strikeThrough.value)
    }
    
    public func strikethrough(_ condition: Bool) -> Text {
        
        if condition {
            return self.mutate(textdecoration: Tokens.TextDecoration.strikeThrough.value)
        }
        
        return self
    }
    
    public func lineSpacing(_ height: Tokens.LineHeight) -> Text {
        return self.mutate(lineheight: height.value)
    }
    
    public func lineLimit(_ limit: Tokens.LineLimit) -> Text {
        return self.mutate(linelimit: limit.value)
    }
    
    public func shadow(_ radius: Tokens.BlurRadius, color: Tokens.ShadowColor = .black) -> Text {
        return mutate(shadow: radius.value, color: color.value)
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
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Text {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Text {
        return self.mutate(margin: length.value, insets: insets)
    }
}
