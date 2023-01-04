/*
 Abstract:
 The file contains the script stencils for the js.
 */

public enum Events {
    
    static func hover(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onHover(function() {
                    \(script)
                });
                """
    }
    
    static func leave(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onLeave(function() {
                    \(script)
                });
                """
    }
    
    static func change(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onChange(function() {
                    \(script)
                });
                """
    }
    
    static func click(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onClick(function() {
                    \(script)
                });
                """
    }
    
    static func tap(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onTapGesture(function() {
                    \(script)
                });
                """
    }
    
    static func press(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onLongPressGesture(function() {
                    \(script)
                });
                """
    }
    
    static func drag(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onDrag(function() {
                    \(script)
                });
                """
    }
    
    static func drop(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onDrop(function() {
                    \(script)
                });
                """
    }
    
    static func focus(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onFocus(function() {
                    \(script)
                });
                """
    }
    
    static func submit(selector: String, script: String) -> String {
        
        return  """
                $('#\(selector)').onSubmit(function() {
                    \(script)
                })
                """
    }
}
