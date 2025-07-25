/// A specification for the appearance and interaction of a button component.
public protocol ButtonConfiguration {
    
    var borderColor: Tokens.BorderColor? { get set }
    
    var borderShape: Tokens.BorderShape? { get set }
    
    var backgroundColor: Tokens.BackgroundColor? { get set }
    
    var foregroundColor: Tokens.ForegroundColor? { get set }
}

extension ButtonConfiguration {
    
    internal var configuration: [String] {
        
        var configuration: [String] = []
        
        if let borderColor = self.borderColor {
            configuration.append("border:\(borderColor.value)")
        }
        
        if let borderShape = self.borderShape {
            configuration.append("shape:\(borderShape.value)")
        }
        
        if let backgroundColor = self.backgroundColor {
            configuration.append("background:\(backgroundColor.value)")
        }
        
        if let foregroundColor = self.foregroundColor {
            configuration.append("foreground:\(foregroundColor)")
        }
        
        return configuration
    }
}

/// A specification for the appearance and interaction of a card component.
public protocol CardConfiguration {
    
    var borderColor: Tokens.BorderColor? { get set }
    
    var borderShape: Tokens.BorderShape? { get set }
    
    var backgroundColor: Tokens.BackgroundColor? { get set }
    
    var foregroundColor: Tokens.ForegroundColor? { get set }
}

extension CardConfiguration {
 
    internal var configuration: [String] {
        
        var configuration: [String] = []
        
        if let borderColor = self.borderColor {
            configuration.append("border:\(borderColor.value)")
        }
        
        if let borderShape = self.borderShape {
            configuration.append("shape:\(borderShape.value)")
        }
        
        if let backgroundColor = self.backgroundColor {
            configuration.append("background:\(backgroundColor.value)")
        }
        
        if let foregroundColor = self.foregroundColor {
            configuration.append("foreground:\(foregroundColor)")
        }
        
        return configuration
    }
}

/// A specification for the appearance and interaction of a field component.
public protocol FieldConfiguration {
    
    var borderColor: Tokens.BorderColor? { get set }
    
    var borderShape: Tokens.BorderShape? { get set }
    
    var backgroundColor: Tokens.BackgroundColor? { get set }
    
    var foregroundColor: Tokens.ForegroundColor? { get set }
    
    var focusColor: Tokens.FocusColor? { get set }
}

extension FieldConfiguration {
    
    internal var configuration: [String] {
        
        var configuration: [String] = []
        
        if let borderColor = self.borderColor {
            configuration.append("border:\(borderColor.value)")
        }
        
        if let borderShape = self.borderShape {
            configuration.append("shape:\(borderShape.value)")
        }
        
        if let backgroundColor = self.backgroundColor {
            configuration.append("background:\(backgroundColor.value)")
        }
        
        if let foregroundColor = self.foregroundColor {
            configuration.append("foreground:\(foregroundColor)")
        }
        
        if let focusColor = self.focusColor {
            configuration.append("focus:\(focusColor)")
        }
        
        return configuration
    }
}

/// A specification for the appearance and interaction of a text component.
public protocol TextConfiguration {
    
    var fontFamily: Tokens.FontFamily? { get set }
    
    var fontSize: Tokens.FontSize? { get set }
    
    var fontWeight: Tokens.FontWeight? { get set }
    
    var foregroundColor: Tokens.ForegroundColor? { get set }
}


extension TextConfiguration {
    
    internal var configuration: [String] {
        
        var configuration: [String] = []
        
        if let fontFamily = self.fontFamily {
            configuration.append("font:\(fontFamily.value)")
        }
        
        if let fontSize = self.fontSize {
            configuration.append("size:\(fontSize.value)")
        }
        
        if let fontWeight = self.fontWeight {
            configuration.append("weight:\(fontWeight.value)")
        }
        
        if let foregroundColor = self.foregroundColor {
            configuration.append("foreground:\(foregroundColor.value)")
        }
        
        return configuration
    }
}

/// A specification for the appearance and interaction of a modal component.
public protocol ModalConfiguration {
    
    var borderColor: Tokens.BorderColor? { get set }
    
    var borderShape: Tokens.BorderShape? { get set }
    
    var backgroundColor: Tokens.BackgroundColor? { get set }
}

extension ModalConfiguration {
    
    internal var configuration: [String] {
        
        var configuration: [String] = []
        
        if let borderColor = self.borderColor {
            configuration.append("border:\(borderColor.value)")
        }
        
        if let borderShape = self.borderShape {
            configuration.append("shape:\(borderShape.value)")
        }
        
        if let backgroundColor = self.backgroundColor {
            configuration.append("background:\(backgroundColor.value)")
        }
        
        return configuration
    }
}

/// A specification for the appearance and interaction of a image component.
public protocol ImageConfiguration {
    
    var borderColor: Tokens.BorderColor? { get set }
    
    var borderShape: Tokens.BorderShape? { get set }
    
    var backgroundColor: Tokens.BackgroundColor? { get set }
}

extension ImageConfiguration {
    
    internal var configuration: [String] {
        
        var configuration: [String] = []
        
        if let borderColor = self.borderColor {
            configuration.append("border:\(borderColor.value)")
        }
        
        if let borderShape = self.borderShape {
            configuration.append("shape:\(borderShape.value)")
        }
        
        if let backgroundColor = self.backgroundColor {
            configuration.append("background:\(backgroundColor.value)")
        }
        
        return configuration
    }
}

/// A specification for the appearance and interaction of a snippet component.
public protocol SnippetConfiguration {
    
    var borderColor: Tokens.BorderColor? { get set }
    
    var borderShape: Tokens.BorderShape? { get set }
    
    var backgroundColor: Tokens.BackgroundColor? { get set }
}

extension SnippetConfiguration {
    
    internal var configuration: [String] {
        
        var configuration: [String] = []
        
        if let borderColor = self.borderColor {
            configuration.append("border:\(borderColor.value)")
        }
        
        if let borderShape = self.borderShape {
            configuration.append("shape:\(borderShape.value)")
        }
        
        if let backgroundColor = self.backgroundColor {
            configuration.append("background:\(backgroundColor.value)")
        }
        
        return configuration
    }
}

/// A specification for the appearance and interaction of a carousel component
public protocol CarouselConfiguration {
    
    var borderColor: Tokens.BorderColor? { get set }
    
    var borderShape: Tokens.BorderShape? { get set }
    
    var backgroundColor: Tokens.BackgroundColor? { get set }
}

extension CarouselConfiguration {
    
    internal var configuration: [String] {
        
        var configuration: [String] = []
        
        if let borderColor = self.borderColor {
            configuration.append("border:\(borderColor.value)")
        }
        
        if let borderShape = self.borderShape {
            configuration.append("shape:\(borderShape.value)")
        }
        
        if let backgroundColor = self.backgroundColor {
            configuration.append("background:\(backgroundColor.value)")
        }
        
        return configuration
    }
}

/// A specification for the appearance and interaction of a navigation component.
public protocol NavigationConfiguration {
    
    var borderColor: Tokens.BorderColor? { get set }
    
    var borderShape: Tokens.BorderShape? { get set }
    
    var backgroundColor: Tokens.BackgroundColor? { get set }
}

extension NavigationConfiguration {
    
    internal var configuration: [String] {
        
        var configuration: [String] = []
        
        if let borderColor = self.borderColor {
            configuration.append("border:\(borderColor.value)")
        }
        
        if let borderShape = self.borderShape {
            configuration.append("shape:\(borderShape.value)")
        }
        
        if let backgroundColor = self.backgroundColor {
            configuration.append("background:\(backgroundColor.value)")
        }
        
        return configuration
    }
}

/// A specification for the appearance and interaction of a list component.
public protocol ListConfiguration {
    
    var borderColor: Tokens.BorderColor? { get set }
    
    var borderShape: Tokens.BorderShape? { get set }
    
    var backgroundColor: Tokens.BackgroundColor? { get set }
}

extension ListConfiguration {
    
    internal var configuration: [String] {
        
        var configuration: [String] = []
        
        if let borderColor = self.borderColor {
            configuration.append("border:\(borderColor.value)")
        }
        
        if let borderShape = self.borderShape {
            configuration.append("shape:\(borderShape.value)")
        }
        
        if let backgroundColor = self.backgroundColor {
            configuration.append("background:\(backgroundColor.value)")
        }
        
        return configuration
    }
}
