import Foundation

public struct SubmitAction: Action {
    
    public var actions: [String] = []
    
    public func validate(_ target: String, _ validators: [Validator]) -> SubmitAction {
        
        var newSelf = self
        
        if let data = try? JSONEncoder().encode(validators) {
            
            if let result = String(data: data, encoding: .utf8) {
                
                newSelf.actions.append("$('#\(target.escape())').validate('\(result)');")
                
                return newSelf
            }
            
        }
        
        newSelf.actions.append("$('#\(target.escape())').validate('[]');")
        
        return newSelf
    }
}
