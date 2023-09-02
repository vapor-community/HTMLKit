import Foundation

public protocol SubmitAction {
    
    /// Validates the form.
    func validate(_ target: String, _ validators: [Validator]) -> String
}

extension SubmitAction {
    
    public func validate(_ target: String, _ validators: [Validator]) -> String {
        
        if let data = try? JSONEncoder().encode(validators) {
            
            if let result = String(data: data, encoding: .utf8) {
                return "$('#\(target.escape())').validate('\(result)');"
            }
        }
        
        return "$('#\(target.escape())').validate('[]');"
    }
}
