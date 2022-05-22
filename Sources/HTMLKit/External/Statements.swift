/*
 Abstract:
 The file contains the statements.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

/// The statement is for
public struct IF: GlobalElement {
    
    public enum IFPrerenderErrors: Error {
        
        case dynamiclyEvaluatedCondition
    }
    
    public class Condition {

        public let condition: Conditionable
        
        public var localFormula: Renderer.Formula
        
        public var view: AnyContent = ""
        
        public init(condition: Conditionable) {
            
            self.condition = condition
            localFormula = Renderer.Formula()
        }
    }

    public let conditions: [Condition]

    public init(_ condition: Conditionable, @ContentBuilder<AnyContent> content: () -> AnyContent) {
        
        let ifCondition = Condition(condition: condition)
        ifCondition.view = content()
        
        self.conditions = [ifCondition]
    }

    public init(conditions: [Condition]) {
        
        self.conditions = conditions
    }
}

extension IF.Condition: Conditionable {

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        return try condition.evaluate(with: manager)
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        return try localFormula.render(with: manager)
    }
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try view.prerender(localFormula)
    }
}

extension IF: AnyContent {

    public var scripts: AnyContent {
        
        IF(conditions: conditions.map { htmlCondition in
            
            let scriptCondition = IF.Condition(condition: htmlCondition.condition)
            scriptCondition.view = htmlCondition.view.scripts
            
            return scriptCondition
        })
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        
        for condition in conditions {
            
            if try condition.evaluate(with: manager) {
                return try condition.render(with: manager)
            }
        }
        
        return ""
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        
        var isStaticallyEvaluated = true
        
        for condition in conditions {
            
            condition.localFormula.calendar = formula.calendar
            
            condition.localFormula.timeZone = formula.timeZone

            do {
                
                guard isStaticallyEvaluated else {
                    throw IFPrerenderErrors.dynamiclyEvaluatedCondition
                }
                
                let testContext = Renderer.ContextManager<Void>(contexts: [:])
                
                if try condition.condition.evaluate(with: testContext) {
                    
                    try condition.view.prerender(formula)
                    
                    return // Returning as the first true condition should be the only one that is rendered
                }
                
            } catch {
                
                isStaticallyEvaluated = false
                
                try condition.prerender(formula)
            }
        }
        
        if isStaticallyEvaluated == false {
            formula.add(mappable: self)
        }
    }

    public func elseIf(_ condition: Conditionable, @ContentBuilder<AnyContent> content: () -> AnyContent) -> IF {
        
        let ifCondition = Condition(condition: condition)
        ifCondition.view = content()
        
        return .init(conditions: conditions + [ifCondition])
    }

    public func elseIf<B>(isNil path: TemplateValue<B?>, @ContentBuilder<AnyContent> content: () -> AnyContent) -> IF {
        
        let condition = Condition(condition: IsNullCondition<B>(path: path))
        condition.view = content()
        
        return .init(conditions: conditions + [condition])
    }

    public func elseIf<Value>(isNotNil path: TemplateValue<Value?>, @ContentBuilder<AnyContent> content: () -> AnyContent) -> IF {
        
        let condition = Condition(condition: NotNullCondition<Value>(path: path))
        condition.view = content()
        
        return .init(conditions: conditions + [condition])
    }

    public func `else`(@ContentBuilder<AnyContent> content: () -> AnyContent) -> AnyContent {
        
        let trueCondition = Condition(condition: AlwaysTrueCondition())
        trueCondition.view = content()
        
        return IF(conditions: conditions + [trueCondition])
    }
}

/// The statement is for
public struct ForEach<Values>: GlobalElement where Values: Sequence {

    public let context: TemplateValue<Values>

    public let content: AnyContent

    public let localFormula: Renderer.Formula

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
            self.content = content(.dynamic(.root(Values.Element.self, rootId: "\(variable.pathId)-loop")))
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
            self.content = content(.dynamic(.root(Values.Element.self, rootId: variable.unsafelyUnwrapped.pathId + "-loop")))
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
                .dynamic(.root(Values.Element.self, rootId: "\(variable.pathId)-loop")),
                .dynamic(.root(Int.self, rootId: "\(variable.pathId)-loop-index"))
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

    public func prerender(_ formula: Renderer.Formula) throws {
        
        formula.add(mappable: self)
        
        try content.prerender(localFormula)
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        
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
                    
                    manager.set(index, for: .root(Int.self, rootId: variable.pathId + "-loop-index"))
                    
                    manager.set(element, for: .root(Values.Element.self, rootId: variable.pathId + "-loop"))
                    
                    rendering += try localFormula.render(with: manager)
                }
                
            } else {
                
                for element in elements {
                    
                    manager.set(element, for: .root(Values.Element.self, rootId: variable.pathId + "-loop"))
                    rendering += try localFormula.render(with: manager)
                }
            }

            return rendering
        }
    }
}

/// The function is for
public struct Unwrap: Component {

    public let content: IF

    public init<A>(_ value: TemplateValue<A?>, @ContentBuilder<AnyContent> content: (TemplateValue<A>) -> AnyContent) {
        
        var ifContent: AnyContent = ""
        
        if value.isMasqueradingOptional {
            
            ifContent = content(value.unsafeCast(to: A.self))
            
        } else {
            
            switch value {
            case .constant(let value):
                
                if value != nil {
                    ifContent = content(.constant(value!))
                }
                
            case .dynamic(let variable):
                
                ifContent = content(.dynamic(variable.unsafelyUnwrapped))
            }
        }
        
        self.content = IF(value.isDefined) {
            ifContent
        }
    }

    public init(content: IF) {
        self.content = content
    }

    public var body: AnyContent {
        content
    }

    public func `else`(@ContentBuilder<AnyContent> content: () -> AnyContent) -> AnyContent {
        self.content.else(content: content)
    }
}
