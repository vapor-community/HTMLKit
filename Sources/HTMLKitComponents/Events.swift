/*
 Abstract:
 The file contains the event stencils for the components.
 */

import Foundation

/// A collection of events, that can occur on components.
public enum Events {
    
    /// Returns a hover event stencil.
    static func hover(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onHover(function() {
                    \(script)
                });
                """
    }
    
    /// Returns a leave event stencil.
    static func leave(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onLeave(function() {
                    \(script)
                });
                """
    }
    
    /// Returns a change event stencil.
    static func change(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onChange(function() {
                    \(script)
                });
                """
    }
    
    /// Returns a click event stencil.
    static func click(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onClick(function() {
                    \(script)
                });
                """
    }
    
    /// Returns a tap gesture stencil.
    static func tap(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onTapGesture(function() {
                    \(script)
                });
                """
    }
    
    /// Returns a long press gesture stencil.
    static func press(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onLongPressGesture(function() {
                    \(script)
                });
                """
    }
    
    /// Returns a drag event stencil.
    static func drag(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onDrag(function() {
                    \(script)
                });
                """
    }
    
    /// Returns a drop event stencil.
    static func drop(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onDrop(function() {
                    \(script)
                });
                """
    }
    
    /// Returns a focus event stencil.
    static func focus(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onFocus(function() {
                    \(script)
                });
                """
    }
    
    /// Returns a submit event stencil.
    static func submit(selector: String, script: String, validation: Bool) -> String {
        
        return  """
                $('#\(selector)').onSubmit(function() {
                    
                    event.preventDefault();
                
                    \(script)
                
                }, \(validation));
                """
    }
}
