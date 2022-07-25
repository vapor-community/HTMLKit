extension String {
    
    func substring(from: String) -> String? {
        
        guard let upperbound = range(of: from)?.upperBound else {
            return nil
        }
        
        return String(self[upperbound...])
    }
    
    func substring(to: String) -> String? {
        
        guard let lowerbound = range(of: to)?.lowerBound else {
            return nil
        }
        
        return String(self[..<lowerbound])
    }
    
    func substring(from: String, to: String) -> String? {
     
        guard let upperbound = range(of: from)?.upperBound, let lowerbound = range(of: to)?.lowerBound else {
            return nil
        }
        
        return String(self[upperbound..<lowerbound])
    }
    
    func substring(from: String, firstOption: String.CompareOptions = .caseInsensitive, to: String, lastOption: String.CompareOptions = .caseInsensitive) -> String? {
     
        guard let upperbound = range(of: from, options: firstOption)?.upperBound, let lowerbound = range(of: to, options: lastOption)?.lowerBound else {
            return nil
        }
        
        return String(self[upperbound..<lowerbound])
    }
    
    func counts(where value: String.Element) -> Int {
        
        return self.lazy.filter { $0 == value }.count
    }
}
