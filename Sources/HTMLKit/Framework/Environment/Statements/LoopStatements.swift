/*
 Abstract:
 The file contains the loop statements.
 
 Markings:
 - ForEach
 */

/// The statement is for
public struct ForEach<Values> where Values: Sequence {

    internal var isEnumerated: Bool
    
    internal let condition: Conditionable
    
    internal let context: TemplateValue<Values>

    internal let formula: Formula
    
    internal let content: Content
    
    public init(in context: TemplateValue<Values>, @ContentBuilder<Content> content: (TemplateValue<Values.Element>) -> Content) {

        self.isEnumerated = false
        self.condition = true
        self.context = context
        self.formula = Formula()
        
        switch context {
        case .constant(let values):
            
            self.content = values.map { value in
                
                content(.constant(value))
                
            }.map { value in
                
                if let array = value as? [Content] {
                    return array[0]
                    
                } else {
                    return value
                }
            }
            
        case .dynamic(let variable):
            self.content = content(.dynamic(HTMLContext(Values.Element.self, rootId: "\(variable.pathId)-loop")))
        }
    }
    
    public init(in values: Values, @ContentBuilder<Content> content: (TemplateValue<Values.Element>) -> Content) {
        self.init(in: .constant(values), content: content)
    }
    
    public init(in context: TemplateValue<Values?>, @ContentBuilder<Content> content: (TemplateValue<Values.Element>) -> Content) {

        self.isEnumerated = false
        self.condition = context.isDefined
        self.context = context.unsafelyUnwrapped
        self.formula = Formula()
        
        switch context {
        case .constant(let values):
            
            if let values = values {
                
                self.content = values.reduce(into: "") { (result, value) in
                    return result += content(.constant(value))
                }
                
            } else {
                self.content = ""
            }
            
        case .dynamic(let variable):
            self.content = content(.dynamic(HTMLContext(Values.Element.self, rootId: variable.unsafelyUnwrapped.pathId + "-loop")))
        }
    }

    public init(enumerated context: TemplateValue<Values>, @ContentBuilder<Content> content: ((element: TemplateValue<Values.Element>, index: TemplateValue<Int>)) -> Content) {

        self.isEnumerated = true
        self.condition = true
        self.context = context
        self.formula = Formula()
        
        switch context {
        case .constant(let values):
            
            self.content = values.enumerated().reduce(into: "") { (result, value) in
                return result += content((.constant(value.element), .constant(value.offset)))
            }
            
        case .dynamic(let variable):
            self.content = content(
            (
                .dynamic(HTMLContext(Values.Element.self, rootId: "\(variable.pathId)-loop")),
                .dynamic(HTMLContext(Int.self, rootId: "\(variable.pathId)-loop-index"))
            ))
        }
    }
    
    public init(enumerated context: Values, @ContentBuilder<Content> content: ((element: TemplateValue<Values.Element>, index: TemplateValue<Int>)) -> Content) {
        self.init(enumerated: .constant(context), content: content)
    }
}

extension ForEach: Node {
    
    internal func prerender(with formula: Formula) {
        
        if let nodes = self.content as? [Node] {
            
            for node in nodes {
                node.prerender(with: formula)
            }
        }
    }
    
    internal func render<T>(with manager: ContextManager<T>) -> String {
        
        var result = ""
        
        switch self.context {
        case .constant(_):
        
            for ingriedient in self.formula.ingredients {
                
                if let node = ingriedient as? Node {
                    result += node.render(with: manager)
                }
            }
            
        case .dynamic(let variable):
            
            do {
                
                let elements = try manager.value(for: variable)
                
                if isEnumerated {
                    
                    for (index, element) in elements.enumerated() {
                        
                        manager.set(index, for: HTMLContext(Int.self, rootId: variable.pathId + "-loop-index"))
                        
                        manager.set(element, for: HTMLContext(Values.Element.self, rootId: variable.pathId + "-loop"))
                        
                        for ingridient in formula.ingredients {
                            
                            if let node = ingridient as? Node {
                                result += node.render(with: manager)
                            }
                        }
                    }
    
                } else {
                    
                    for element in elements {
                        
                        manager.set(element, for: HTMLContext(Values.Element.self, rootId: variable.pathId + "-loop"))
                        
                        for ingridient in formula.ingredients {
                            
                            if let node = ingridient as? Node {
                                result += node.render(with: manager)
                            }
                        }
                    }
                }
                
            } catch {
                return result
            }
        }
        
        return result
    }
}
