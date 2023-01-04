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
    
    public func id(_ value: String) -> Text {
        return self.mutate(id: value)
    }
}

extension Text: HoverModifier {
    
    public func onHover(perfom action: Actions) -> Text {
        return self.mutate(hoverevent: action.script)
    }
    
    public func onLeave(perfom action: Actions) -> Text {
        return self.mutate(leaveevent: action.script)
    }
}

extension Text: TextModifier {
    
    public func font(_ style: Tokens.TextStyle) -> Text {
        return self.mutate(font: style.rawValue)
    }
    
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> Text {
        return self.mutate(foregroundcolor: color.rawValue)
    }
    
    public func fontSize(_ size: Tokens.FontSize) -> Text {
        return self.mutate(fontsize: size.rawValue)
    }
    
    public func fontWeight(_ weight: Tokens.FontWeight) -> Text {
        return self.mutate(fontweight: weight.rawValue)
    }
    
    public func fontTransformation(_ transformation: Tokens.TextTransformation) -> Text {
        return self.mutate(fonttransformation: transformation.rawValue)
    }
    
    public func fontStyle(_ style: Tokens.FontStyle) -> Text {
        return self.mutate(fontstyle: style.rawValue)
    }
    
    public func bold() -> Text {
        return self.mutate(bold: Tokens.FontWeight.bold.rawValue)
    }
    
    public func italic() -> Text {
        return self.mutate(italic: Tokens.FontStyle.italic.rawValue)
    }
    
    public func underline() -> Text {
        return self.mutate(underline: Tokens.TextDecoration.underline.rawValue)
    }
}
