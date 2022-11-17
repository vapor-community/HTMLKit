/*
 Abstract:
 The file contains extensions for some data types.
 */

import Foundation

extension Array: AnyContent {
}

extension String: AnyContent {}

extension String: Node {
    
    internal func prerender(with formula: Formula) {
        formula.add(ingridient: self)
    }
    
    
    func render<T>(with manager: ContextManager<T>) -> String {        
        return self
    }
}

extension Int: AnyContent {}

extension Int: Node {
    
    internal func prerender(with formula: Formula) {
        formula.add(ingridient: String(self))
    }
    
    func render<T>(with manager: ContextManager<T>) -> String {
        return String(self)
    }
}

extension Float: AnyContent {}

extension Float: Node {

    internal func prerender(with formula: Formula) {
        formula.add(ingridient: String(self))
    }
    
    func render<T>(with manager: ContextManager<T>) -> String {
        return String(self)
    }
}

extension Double: AnyContent {}

extension Double: Node {

    internal func prerender(with formula: Formula) {
        formula.add(ingridient: String(self))
    }
    
    func render<T>(with manager: ContextManager<T>) -> String {
        return String(self)
    }
}

extension Bool: AnyContent {}

extension Bool: Node {
    
    internal func prerender(with formula: Formula) {
        formula.add(ingridient:  String(self))
    }
    
    func render<T>(with manager: ContextManager<T>) -> String {
        return String(self)
    }
}

extension Bool: Conditionable {
    
    public func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return self
    }
}

extension Sequence {
    
    @available(*, deprecated, message: "The method will be removed entirely.")
    public func htmlForEach(@ContentBuilder<AnyContent> content: (TemplateValue<Element>) -> AnyContent) -> AnyContent {
        ForEach(in: .constant(self), content: content)
    }
}
