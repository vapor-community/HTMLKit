import Foundation

/// A type that represents an encoder.
/// 
/// The encoder is responsible for encoding characters to their safe equivalents.
/// 
/// > Note: The encoder does not utilize unicode encoding for some languages, such as JS and CSS. 
/// > It primarily aims to preserve the code integrity and to protect against code injection within an 
/// > HTML context.
internal struct Encoder {
    
    /// An enumeration of potential encoding mechanism
    internal enum Mechanism {

        /// The context the mechanism should be based on
        internal enum Context {
            
            /// Mechanism to use on an attribute value
            case attribute
            
            /// Mechanism to use on the element body
            case element
        }
        
        /// Use a HTML encoding mechanism
        case html(Context)
        
        /// Use a CSS encoding mechanism
        case css(Context)
        
        /// Use a JS encoding mechanism
        case js(Context)
        
        /// The characters to replace based on the mechanism and context
        var characters: Set<Unicode.Scalar> {
            
            switch self {
            case .html(let context):
                
                switch context {
                case .attribute:
                    return ["&", "<", "'", "\""]
                    
                case .element:
                    return ["&", "<", ">"]
                }
                
            case .css(let context):
                
                switch context {
                case .attribute:
                    return ["&", "<", ">", "\""]
                    
                case .element:
                    return ["<", ">"]
                }
                
            case .js(let context):
                
                switch context {
                case .attribute:
                    return ["&", "<", ">", "\""]
                    
                case .element:
                    return ["<", ">"]
                }
            }
        }
        
        /// The characters to replace with based on the mechanism
        var replacements: [Unicode.Scalar: String] {
            return ["&": "&amp;", "<": "&lt;", ">": "&gt;", "\"": "&quot;", "'": "&apos;"]
        }
    }
    
    /// Encodes a string into a safe equivalent
    ///
    /// - Parameters:
    ///   - string: The string to encode
    ///   - mechansim: The mechnism to use
    ///
    /// - Returns: The encoded string
    internal func encode(_ string: String, as mechansim: Mechanism) -> String {
        
        switch mechansim {
        case .css(let context), .js(let context):
            
            switch context {
            case .attribute:
                return self.replace(mechansim.characters, with: mechansim.replacements, on: string)
                
            case .element:
                return self.replace(mechansim.characters, with: mechansim.replacements, within: ["\"", "'"], on: string)
            }
            
        case .html:
            return self.replace(mechansim.characters, with: mechansim.replacements, on: string)
        }
    }
    
    /// Replaces occurrences of characters within a substring with their corresponding replacements.
    /// 
    /// - Parameters:
    ///   - set: The set of character to check against
    ///   - table: The table of replacements to use
    ///   - delimiters: The substrings to look for
    ///   - string: The string in which the replacement should be made
    ///   
    /// - Returns: The replaced string
    private func replace(_ set: Set<Unicode.Scalar>, with table: [Unicode.Scalar: String], within delimiters: Set<Unicode.Scalar>, on string: String) -> String {
        
        var result = ""
        
        var isLiteral = false
        
        for scalar in string.unicodeScalars {
            
            if delimiters.contains(scalar) {
            
                if isLiteral == true {
                    
                    result.append(String(scalar))
                    
                    isLiteral = false
                    
                } else {
                    
                    result.append(String(scalar))
                    
                    isLiteral = true
                }
                
            } else {
                
                if isLiteral == true {

                    if set.contains(scalar) {
                        
                        if let replacement = table[scalar] {
                            result.append(replacement)
                            
                        } else {
                            result.append(String(scalar))
                        }
                        
                    } else {
                        result.append(String(scalar))
                    }
                    
                } else {
                    result.append(String(scalar))
                }
            }
        }
        
        return result
    }
    
    /// Replaces occurrences of characters within a string with their corresponding replacements.
    /// 
    /// - Parameters:
    ///   - set: The set of characters to check against
    ///   - table: The table of replacements to use
    ///   - string: The string in which the replacement should be made
    /// 
    /// - Returns: The replaced string
    private func replace(_ set: Set<Unicode.Scalar>, with table: [Unicode.Scalar: String], on string: String) -> String {
        
        var result = ""
        
        for scalar in string.unicodeScalars {
            
            if set.contains(scalar) {
                
                if let replacement = table[scalar] {
                    result.append(replacement)
                    
                } else {
                    result.append(String(scalar))
                }
                
            } else {
                result.append(String(scalar))
            }
        }
        
        return result
    }
}
