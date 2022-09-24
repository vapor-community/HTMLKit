/*
 Abstract:
 The file contains the actions for the components.
 */

public enum Actions {
    
    case show(_ target: String)
    case hide(_ target: String)
    case animate(_ target: String)
    
    public var script: String {
        
        switch self {
        case .show(let target):
            return show(target)
            
        case .hide(let target):
            return hide(target)
            
        case .animate(let target):
            return animate(target)
        }
    }
    
    private func show(_ target: String) -> String {
        
        return "$('#\(target)').show();"
    }
    
    private func hide(_ target: String) -> String {
        
        return "$('#\(target)').hide();"
    }
    
    private func animate(_ target: String) -> String {
        
        return "$('#\(target)').animate();"
    }
}
