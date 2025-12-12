/// A type that describes the modifier of a view.
public protocol ViewModifier {

    /// Set the opacity for the view.
    ///
    /// - Parameter value: The level to apply to the view.
    ///
    /// - Returns: The view
    func opacity(_ value: Tokens.OpacityValue) -> Self
    
    /// Set the hierarchy for the view.
    ///
    /// - Parameter index: The index at which to position the view.
    ///
    /// - Returns: The view
    func zIndex(_ index: Tokens.PositionIndex) -> Self
    
    /// Fill the background of the view.
    ///
    /// - Parameter color: The color to use for the background.
    ///
    /// - Returns: The view
    func backgroundColor(_ color: Tokens.BackgroundColor) -> Self
    
    /// Hide the view.
    ///
    /// - Parameter condition: Whether to hide the view.
    ///
    /// - Returns: The view
    func hidden(_ condition: Bool) -> Self
    
    /// Set the color scheme for the view.
    ///
    /// - Parameter scheme: The scheme to use throughout the view.
    ///
    /// - Returns: The view
    func colorScheme(_ scheme: Tokens.ColorScheme) -> Self
    
    /// Set the padding for the view.
    ///
    /// - Parameters:
    ///   - inSet: The edges to apply the padding to.
    ///   - length: The amount of padding to apply.
    ///
    /// - Returns: The view
    func padding(insets: EdgeSet, length: Tokens.PaddingLength) -> Self
    
    /// Set the border for the view.
    ///
    /// - Parameters:
    ///   - color: The color to fill the border with.
    ///   - width: The thickness to apply to the border.
    ///   - shape: The border shape to use for the view.
    ///
    /// - Returns: The view
    func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth, shape: Tokens.BorderShape?) -> Self
    
    /// Set the frame for the view.
    ///
    /// - Parameters:
    ///   - width: The width to constrain the frame to.
    ///   - height: The height to constrain the frame to.
    ///   - alignment: The rule to align the frame relative to its parent.
    ///
    /// - Returns: The view
    func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight?, alignment: Tokens.FrameAlignment?) -> Self
    
    /// Set the margin for the view.
    ///
    /// - Parameters:
    ///   - inSet: The edges to apply the margin to.
    ///   - length: The amount of margin to apply.
    ///
    /// - Returns: The view
    func margin(insets: EdgeSet, length: Tokens.MarginLength) -> Self
}

extension ViewModifier where Self: Modifiable {
    
    internal func mutate(opacity value: String) -> Self {
        return self.mutate(classes: "opacity:\(value)")
    }
    
    internal func mutate(zindex value: String) -> Self {
        return self.mutate(classes: "zindex:\(value)")
    }
    
    internal func mutate(backgroundcolor value: String) -> Self {
        return self.mutate(classes: "background:\(value)")
    }
    
    internal func mutate(viewstate value: String) -> Self {
        return self.mutate(classes: "state:\(value)")
    }
    
    internal func mutate(scheme value: String) -> Self {
        return self.mutate(classes: "scheme:\(value)")
    }
    
    internal func mutate(padding value: String) -> Self {
        return self.mutate(classes: "padding:\(value)")
    }
    
    internal func mutate(padding value: String, insets: EdgeSet) -> Self {
     
        var classes: [String] = []
        
        if !insets.contains(.all) {
            
            if insets.contains(.top) {
                classes.append("padding-top:\(value)")
            }
            
            if insets.contains(.bottom) {
                classes.append("padding-bottom:\(value)")
            }
            
            if insets.contains(.leading) {
                classes.append("padding-leading:\(value)")
            }
            
            if insets.contains(.trailing) {
                classes.append("padding-trailing:\(value)")
            }
            
            if insets.contains(.horizontal) {
                classes.append("padding-inline:\(value)")
            }
            
            if insets.contains(.vertical) {
                classes.append("padding-block:\(value)")
            }
            
        } else {
            classes.append("padding:\(value)")
        }
        
        return self.mutate(classes: classes)
    }
    
    internal func mutate(bordershape value: String) -> Self {
        return self.mutate(classes: "shape:\(value)")
    }
    
    internal func mutate(border color: String, width: String, shape: String? = nil) -> Self {
        
        if let shape = shape {
            return self.mutate(classes: "border:\(color)", "border:\(width)", "shape:\(shape)")
        }
        
        return self.mutate(classes: "border:\(color)", "border:\(width)")
    }
    
    internal func mutate(frame width: String, height: String? = nil, alignment: String? = nil) -> Self {
        
        var classes: [String] = []
        
        if let height {
            classes.append("height:\(height)")
        }
        
        if let alignment {
            classes.append("frame-alignment:\(alignment)")
        }
        
        classes.append("width:\(width)")
        
        return self.mutate(classes: classes)
    }
    
    internal func mutate(margin value: String, insets: EdgeSet) -> Self {
     
        var classes: [String] = []
        
        if !insets.contains(.all) {
            
            if insets.contains(.top) {
                classes.append("margin-top:\(value)")
            }
            
            if insets.contains(.bottom) {
                classes.append("margin-bottom:\(value)")
            }
            
            if insets.contains(.leading) {
                classes.append("margin-leading:\(value)")
            }
            
            if insets.contains(.trailing) {
                classes.append("margin-trailing:\(value)")
            }
            
            if insets.contains(.horizontal) {
                classes.append("margin-inline:\(value)")
            }
            
            if insets.contains(.vertical) {
                classes.append("margin-block:\(value)")
            }
            
        } else {
            classes.append("margin:\(value)")
        }
        
        return self.mutate(classes: classes)
    }
}
