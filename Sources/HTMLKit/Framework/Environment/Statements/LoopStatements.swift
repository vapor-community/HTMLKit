/*
 Abstract:
 The file contains the loop statements.
 
 Markings:
 - ForEach
 */

/// The statement is for
public struct ForEach<Values>: GlobalElement where Values: Sequence {

    internal var isEnumerated: Bool
    
    internal let condition: Conditionable
    
    internal let context: TemplateValue<Values>

    internal let formula: Formula
    
    internal let content: AnyContent
    
    public init(in context: TemplateValue<Values>, @ContentBuilder<AnyContent> content: (TemplateValue<Values.Element>) -> AnyContent) {

        self.isEnumerated = false
        self.condition = true
        self.context = context
        self.formula = Formula()
        
        switch context {
        case .constant(let values):
            
            self.content = values.reduce(into: "") { (result, value) in
                return result += content(.constant(value))
            }
            
        case .dynamic(let variable):
            self.content = content(.dynamic(HTMLContext(Values.Element.self, rootId: "\(variable.pathId)-loop")))
        }
    }
    
    public init(in values: Values, @ContentBuilder<AnyContent> content: (TemplateValue<Values.Element>) -> AnyContent) {
        self.init(in: .constant(values), content: content)
    }

    public init(in context: TemplateValue<Values?>, @ContentBuilder<AnyContent> content: (TemplateValue<Values.Element>) -> AnyContent) {

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

    public init(enumerated context: TemplateValue<Values>, @ContentBuilder<AnyContent> content: ((element: TemplateValue<Values.Element>, index: TemplateValue<Int>)) -> AnyContent) {

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
    
    public init(enumerated context: Values, @ContentBuilder<AnyContent> content: ((element: TemplateValue<Values.Element>, index: TemplateValue<Int>)) -> AnyContent) {
        self.init(enumerated: .constant(context), content: content)
    }
}

extension ForEach: AnyContent {}
