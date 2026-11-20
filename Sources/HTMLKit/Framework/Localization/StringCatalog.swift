/// A type that represents a string catalog.
internal struct StringCatalog: Codable {
    
    internal enum CodingKeys: String, CodingKey {
         
        case entries = "strings"
    }
    
    /// The entries within the catalog.
    internal let entries: [String: Entry]
}

extension StringCatalog {
    
    /// A type that represents a catalog entry.
    internal struct Entry: Codable {
        
        /// The associated values.
        internal let localizations: [String: Localization]
        
        /// The associated comment.
        internal let comment: String?
    }
    
    /// A type that represents an entry value.
    internal struct Localization: Codable {
        
        internal enum CodingKeys: String, CodingKey {
             
            case singular = "stringUnit"
            case plural = "variations"
        }
        
        /// Whether there is a singular value.
        internal let singular: Unit?
        
        /// Whether there is a plural value.
        internal let plural: Plural?
    }

    /// A type that represents a plural value.
    @dynamicMemberLookup
    internal struct Plural: Codable {
        
        internal enum CodingKeys: String, CodingKey {
            
            case forms = "plural"
        }
        
        /// The associated rules.
        private let forms: Forms
        
        internal subscript<T>(dynamicMember keyPath: KeyPath<Forms, T>) -> T {
            return forms[keyPath: keyPath]
        }
    }

    /// A type that represents the forms for the plural value.
    internal struct Forms: Codable {
        
        /// The associated general form.
        let other: Form
        
        /// The associated empty form.
        let zero: Form?
        
        /// The associated singular form.
        let one: Form?
        
        /// The associated dual form.
        let two: Form?
        
        /// The associated paucal form.
        let few: Form?
        
        /// The associated plural form.
        let many: Form?
    }
    
    @dynamicMemberLookup
    internal struct Form: Codable {
        
        internal enum CodingKeys: String, CodingKey {
            
            case unit = "stringUnit"
        }
        
        private let unit: StringCatalog.Unit
        
        internal subscript<T>(dynamicMember keyPath: KeyPath<Unit, T>) -> T {
            return unit[keyPath: keyPath]
        }
    }
    
    /// A type that represents a value representation.
    internal struct Unit: Codable {
        
        /// The associated representation.
        internal let value: String
    }
}
