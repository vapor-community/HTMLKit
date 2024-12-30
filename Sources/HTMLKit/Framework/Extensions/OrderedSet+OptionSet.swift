import Collections

extension OrderedSet where Element: HTMLKit.OptionSet {
    
    var rawValue: Int {
        
        var rawValue = 0
        
        for (index, element) in Element.allCases.enumerated() {
            
            if self.contains(element) {
                rawValue |= (1 << index)
            }
        }
        
        return rawValue
    }
}
