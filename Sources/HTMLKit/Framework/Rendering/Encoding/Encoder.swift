import Foundation

/// A type responsible for encoding characters like `<`, `>`, `&` etc. to their safe equivalents
internal struct Encoder {
    
    /// A enumeration of potential encoding mechanism
    internal enum Mechanism {
        
        /// Encodes characters in a attribute
        case attribute
        
        /// Encodes characters in a entity
        case entity
        
        /// The characters to replace based on the mechanism
        var characters: Set<Unicode.Scalar> {
            
            switch self {
            case .attribute:
                return ["&", "'", "\""]
                
            case .entity:
                return ["<", ">"]
            }
        }
    }
    
    /// A mapping table of characters with their corresponding replacements
    private var characterTable: [Unicode.Scalar: String] {
        return [
            "&": "&amp;",
            "<": "&lt;",
            ">": "&gt;",
            "\"": "&quot;",
            "'": "&apos;",
        ]
    }
    
    /// Encodes a string into a safe equivalent
    ///
    /// - Parameters:
    ///   - string: The string to encode
    ///   - mechansim: The mechnism to use
    ///
    /// - Returns: The encoded string
    internal func encode(_ string: String, as mechansim: Mechanism) -> String {
        return replace(set: mechansim.characters, on: string)
    }
    
    /// Replaces occurrences of characters in a string with their corresponding replacements
    ///
    /// - Parameters:
    ///   - set: The set of character to check against
    ///   - string: The string where replacements will be made
    ///
    /// - Returns: The replaced string
    private func replace(set: Set<Unicode.Scalar>, on string: String) -> String {
        
        var result = ""
        
        for scalar in string.unicodeScalars {
            
            if set.contains(scalar) {
                
                if let replacement = characterTable[scalar] {
                    result.append(contentsOf: replacement)
                    
                } else {
                    result.append(contentsOf: String(scalar))
                }
                
            } else {
                result.append(contentsOf: String(scalar))
            }
        }
        
        return result
    }
}
