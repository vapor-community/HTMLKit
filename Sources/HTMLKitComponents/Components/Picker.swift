import HTMLKit

public struct Picker: View, Modifiable, Identifiable {
    
    internal var id: String?

    internal let name: String
    
    internal let selection: String?
    
    internal let content: [Selectable]
    
    internal var classes: [String]
    
    public init(name: String, selection: String? = nil, @ContentBuilder<CheckField> content: () -> [CheckField]) {
        
        self.name = name
        self.selection = selection
        self.content = content()
        self.classes = ["picker"]
    }
    
    public init(name: String, selection: String? = nil, @ContentBuilder<RadioSelect> content: () -> [RadioSelect]) {
        
        self.name = name
        self.selection = selection
        self.content = content()
        self.classes = ["picker"]
    }
    
    public var body: Content {
        Division {
            for item in content {
                item.selected(item.value == selection)
                    .tag(name)
            }
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func tag(_ value: String) -> Picker {
        return self.mutate(id: value)
    }
}
