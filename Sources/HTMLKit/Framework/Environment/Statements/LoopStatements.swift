/// The statement is for
public struct ForEach<Values>: GlobalElement where Values: Sequence {

    public let context: TemplateValue<Values>

    public let content: AnyContent

    public let localFormula: Formula

    public let condition: Conditionable
    
    public var isEnumerated: Bool = false

    public init(in context: TemplateValue<Values>, @ContentBuilder<AnyContent> content: (TemplateValue<Values.Element>) -> AnyContent) {

        self.condition = true
        self.context = context
        
        switch context {
        case .constant(let values):
            
            self.content = values.reduce(into: "") {
                $0 += content(.constant($1))
            }
            
        case .dynamic(let variable):
            self.content = content(.dynamic(HTMLContext(Values.Element.self, rootId: "\(variable.pathId)-loop")))
        }
        
        self.localFormula = .init()
    }

    public init(in context: TemplateValue<Values?>, @ContentBuilder<AnyContent> content: (TemplateValue<Values.Element>) -> AnyContent) {

        self.context = context.unsafelyUnwrapped
        
        switch context {
        case .constant(let values):
            
            if let values = values {
                
                self.content = values.reduce(into: "") { $0 += content(.constant($1)) }
                
            } else {
                
                self.content = ""
            }
            
        case .dynamic(let variable):
            self.content = content(.dynamic(HTMLContext(Values.Element.self, rootId: variable.unsafelyUnwrapped.pathId + "-loop")))
        }
        
        self.condition = context.isDefined
        
        self.localFormula = .init()
    }

    public init(enumerated context: TemplateValue<Values>, @ContentBuilder<AnyContent> content: ((element: TemplateValue<Values.Element>, index: TemplateValue<Int>)) -> AnyContent) {

        self.condition = true
        self.context = context
        
        switch context {
        case .constant(let values):
            
            self.content = values.enumerated().reduce(into: "") {
                $0 += content((.constant($1.element), .constant($1.offset)))
            }
            
        case .dynamic(let variable): self.content = content(
            (
                .dynamic(HTMLContext(Values.Element.self, rootId: "\(variable.pathId)-loop")),
                .dynamic(HTMLContext(Int.self, rootId: "\(variable.pathId)-loop-index"))
            ))
        }
        
        self.localFormula = .init()
        
        self.isEnumerated = true
    }
}

extension ForEach {
    
    public init(enumerated context: Values, @ContentBuilder<AnyContent> content: ((element: TemplateValue<Values.Element>, index: TemplateValue<Int>)) -> AnyContent) {
        
        self.init(enumerated: .constant(context), content: content)
    }
    
    public init(in values: Values, @ContentBuilder<AnyContent> content: (TemplateValue<Values.Element>) -> AnyContent) {
        
        self.init(in: .constant(values), content: content)
    }
}

extension ForEach: AnyContent {

    public func prerender(_ formula: Formula) throws {
        
        formula.add(content: self)
        
        try content.prerender(localFormula)
    }

    public func render<T>(with manager: ContextManager<T>) throws -> String {
        
        switch context {
        case .constant(_):
            
            return try localFormula.render(with: manager)
            
        case .dynamic(let variable):
            
            guard try condition.evaluate(with: manager) else {
                return ""
            }
            
            var rendering = ""
            
            let elements = try manager.value(for: variable)
            
            if isEnumerated {
                
                for (index, element) in elements.enumerated() {
                    
                    manager.set(index, for: HTMLContext(Int.self, rootId: variable.pathId + "-loop-index"))
                    
                    manager.set(element, for: HTMLContext(Values.Element.self, rootId: variable.pathId + "-loop"))
                    
                    rendering += try localFormula.render(with: manager)
                }
                
            } else {
                
                for element in elements {
                    
                    manager.set(element, for: HTMLContext(Values.Element.self, rootId: variable.pathId + "-loop"))
                    rendering += try localFormula.render(with: manager)
                }
            }

            return rendering
        }
    }
}
