/*
 Abstract:
 The file contains the script stencils for the js.
 */

public enum Events {
    
    static func hover(selector: String, action: String) -> String {
        
        return  """
                $('#\(selector)').onHover(function() {
                    \(action)
                });
                """
    }
    
    static func change(selector: String, action: String) -> String {
        
        return  """
                $('#\(selector)').onChange(function() {
                    \(action)
                });
                """
    }
    
    static func click(selector: String, action: String) -> String {
        
        return  """
                $('#\(selector)').onClick(function() {
                    \(action)
                });
                """
    }
    
    static func tap(selector: String, action: String) -> String {
        
        return  """
                $('#\(selector)').onTapGesture(function() {
                    \(action)
                });
                """
    }
    
    static func press(selector: String, action: String) -> String {
        
        return  """
                $('#\(selector)').onLongPressGesture(function() {
                    \(action)
                });
                """
    }
    
    static func drag(selector: String, action: String) -> String {
        
        return  """
                $('#\(selector)').onDrag(function() {
                    \(action)
                });
                """
    }
    
    static func drop(selector: String, action: String) -> String {
        
        return  """
                $('#\(selector)').onDrop(function() {
                    \(action)
                });
                """
    }
    
    static func focus(selector: String, action: String) -> String {
        
        return  """
                $('#\(selector)').onFocus(function() {
                    \(action)
                });
                """
    }
    
    static func submit(selector: String, action: String) -> String {
        
        return  """
                $('#\(selector)').onSubmit(function() {
                    \(action)
                })
                """
    }
}
