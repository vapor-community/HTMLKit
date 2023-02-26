/*
 Abstract:
 The file contains the action stencils for the components.
 */

import Foundation

/// A collection of actions, that can be triggered by events.
public enum Actions {
    
    /// Shows the target.
    case show(_ target: String)
    
    /// Hides the target.
    case hide(_ target: String)
    
    /// Animates the target.
    case animate(_ target: String)
    
    /// Opens the target.
    case open(_ target: String)
    
    /// Closes the target.
    case close(_ target: String)
    
    /// Validates the form.
    case valdiate(_ target: String, _ rules: [Validator])
    
    public var description: String {
        
        switch self {
        case .valdiate(_, _):
            return "validate"
        default:
            return "default"
        }
    }
    
    /// The script for the action.
    public var script: String {
        
        switch self {
        case .show(let target):
            return show(target)
            
        case .hide(let target):
            return hide(target)
            
        case .animate(let target):
            return animate(target)
            
        case .open(let target):
            return open(target)
            
        case .close(let target):
            return close(target)
            
        case .valdiate(let target, let rules):
            return validate(target, rules)
        }
    }
    
    /// Returns a show action stencil.
    private func show(_ target: String) -> String {
        return "$('#\(target)').show();"
    }
    
    /// Returns a hide action stencil.
    private func hide(_ target: String) -> String {
        return "$('#\(target)').hide();"
    }
    
    /// Returns a animate action stencil.
    private func animate(_ target: String) -> String {
        return "$('#\(target)').animate();"
    }
    
    /// Returns a open action stencil.
    private func open(_ target: String) -> String {
        return "$('#\(target)').open();"
    }
    
    /// Returns a close action stencil.
    private func close(_ target: String) -> String {
        return "$('#\(target)').close();"
    }
    
    /// Returns a close action stencil.
    private func validate(_ target: String, _ validators: [Validator]) -> String {
        
        if let data = try? JSONEncoder().encode(validators) {
            
            if let result = String(data: data, encoding: .utf8) {
                return "$('#\(target)').validate('\(result)');"
            }
        }
        
        return "$('#\(target)').validate('[]');"
    }
}
