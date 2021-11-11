// MARK: functions

/// A struct making it possible to have a if in the template
///
///     runtimeIf(\.name == "Name", view: ...)
public struct IF {

    /// One condition in the if
    public class Condition {

        /// The condition to evaluate
        let condition: Conditionable

        /// The local formula for optimazation
        var localFormula: HTMLRenderer.Formula

        /// The view to render.
        /// Set to an empty string in order to create a condition on `\.name == ""`
        /// This should probably be re designed a little
        var view: Content = ""

        /// Creates an if condition
        ///
        /// - Parameter condition: The condition to evaluate
        init(condition: Conditionable) {
            self.condition = condition
            localFormula = HTMLRenderer.Formula()
        }
    }

    /// The different conditions that can happen
    let conditions: [Condition]

    public init(_ condition: Conditionable, @ContentBuilder content: () -> Content) {
        let ifCondition = Condition(condition: condition)
        ifCondition.view = content()
        self.conditions = [ifCondition]
    }

    init(conditions: [Condition]) {
        self.conditions = conditions
    }
}

extension IF.Condition: Conditionable {

    // View `Conditionable` documentation
    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        return try condition.evaluate(with: manager)
    }

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return try localFormula.render(with: manager)
    }

    // View `BrewableFormula` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        try view.prerender(localFormula)
    }
}

/// This is a struct that should never exist in a template, and therefore will be used to evaluate if a `Condition`is dynamic or static
struct ConditionPrerenderTest {}

enum IFPrerenderErrors: Error {
    case dynamiclyEvaluatedCondition
}

extension IF: Content {

    public var scripts: Content {
        IF(conditions: conditions.map { htmlCondition in
            let scriptCondition = IF.Condition(condition: htmlCondition.condition)
            scriptCondition.view = htmlCondition.view.scripts
            return scriptCondition
        })
    }

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        for condition in conditions {
            if try condition.evaluate(with: manager) {
                return try condition.render(with: manager)
            }
        }
        return ""
    }

    // View `BrewableFormula` documentation
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        var isStaticallyEvaluated = true
        for condition in conditions {
            condition.localFormula.calendar = formula.calendar
            condition.localFormula.timeZone = formula.timeZone

            do {
                guard isStaticallyEvaluated else {
                    throw IFPrerenderErrors.dynamiclyEvaluatedCondition
                }
                let testContext = HTMLRenderer.ContextManager<Void>(contexts: [:])
                if try condition.condition.evaluate(with: testContext) {
                    try condition.view.prerender(formula)
                    return // Returning as the first true condition should be the only one that is rendered
                }
            } catch {
                // If an error was thrown, then there is some missing context and therefore the whole condition should be evaluated at runtime
                isStaticallyEvaluated = false
                try condition.prerender(formula)
            }
        }
        if isStaticallyEvaluated == false {
            formula.add(mappable: self)
        }
    }

    /// Add an else if condition
    ///
    /// - Parameters:
    ///   - condition: The condition to be evaluated
    ///   - render: The view to render if true
    /// - Returns: returns a modified if statment
    public func elseIf(_ condition: Conditionable, @ContentBuilder render: () -> Content) -> IF {
        let ifCondition = Condition(condition: condition)
        ifCondition.view = render()
        return .init(conditions: conditions + [ifCondition])
    }

    /// Add an else if condition
    ///
    /// - Parameters:
    ///   - path: The path to evaluate
    ///   - render: The view to render if true
    /// - Returns: returns a modified if statment
    public func elseIf<B>(isNil path: TemplateValue<B?>, @ContentBuilder render: () -> Content) -> IF {
        let condition = Condition(condition: IsNullCondition<B>(path: path))
        condition.view = render()
        return .init(conditions: conditions + [condition])
    }

    /// Add an else if condition
    ///
    /// - Parameters:
    ///   - path: The path to evaluate
    ///   - render: The view to render if true
    /// - Returns: returns a modified if statment
    public func elseIf<Value>(isNotNil path: TemplateValue<Value?>, @ContentBuilder render: () -> Content) -> IF {
        let condition = Condition(condition: NotNullCondition<Value>(path: path))
        condition.view = render()
        return .init(conditions: conditions + [condition])
    }

    /// Add an else condition
    ///
    /// - Parameter render: The view to be rendered
    /// - Returns: A mappable object
    public func `else`(@ContentBuilder render: () -> Content) -> Content {
        let trueCondition = Condition(condition: AlwaysTrueCondition())
        trueCondition.view = render()
        return IF(conditions: conditions + [trueCondition])
    }
}

public struct Unwrap: HTMLComponent {

    let content: IF

    public init<A>(_ value: TemplateValue<A?>, @ContentBuilder content: (TemplateValue<A>) -> Content) {
        var ifContent: Content = ""
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

    init(content: IF) {
        self.content = content
    }

    public var body: Content {
        content
    }

    public func `else`(@ContentBuilder content: () -> Content) -> Content {
        self.content.else(render: content)
    }
}

/// A struct making it possible to have a for each loop in the template
public struct ForEach<Values> where Values: Sequence {

    public let context: TemplateValue<Values>

    let content: Content

    let localFormula: HTMLRenderer.Formula

    let condition: Conditionable
    var isEnumerated: Bool = false

    public init(in context: TemplateValue<Values>, @ContentBuilder content: (TemplateValue<Values.Element>) -> Content) {

        self.condition = true
        self.context = context
        switch context {
        case .constant(let values): self.content = values.reduce(into: "") { $0 += content(.constant($1)) }
        case .dynamic(let variable): self.content = content(.dynamic(.root(Values.Element.self, rootId: "\(variable.pathId)-loop")))
        }
        localFormula = .init()
    }

    public init(in context: TemplateValue<Values?>, @ContentBuilder content: (TemplateValue<Values.Element>) -> Content) {

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
        localFormula = .init()
    }

    public init(enumerated context: TemplateValue<Values>, @ContentBuilder content: ((element: TemplateValue<Values.Element>, index: TemplateValue<Int>)) -> Content) {

        self.condition = true
        self.context = context
        switch context {
        case .constant(let values): self.content = values.enumerated().reduce(into: "") { $0 += content((.constant($1.element), .constant($1.offset))) }
        case .dynamic(let variable): self.content = content(
            (
                .dynamic(.root(Values.Element.self, rootId: "\(variable.pathId)-loop")),
                .dynamic(.root(Int.self, rootId: "\(variable.pathId)-loop-index"))
            ))
        }
        localFormula = .init()
        self.isEnumerated = true
    }
}

extension ForEach {
    public init(enumerated context: Values, @ContentBuilder content: ((element: TemplateValue<Values.Element>, index: TemplateValue<Int>)) -> Content) {
        self.init(enumerated: .constant(context), content: content)
    }
}

extension ForEach {
    public init(in values: Values, @ContentBuilder content: (TemplateValue<Values.Element>) -> Content) {
        self.init(in: .constant(values), content: content)
    }
}

extension ForEach: Content {

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(mappable: self)
        try content.prerender(localFormula)
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        switch context {
        case .constant(_):
            return try localFormula.render(with: manager)
        case .dynamic(let variable):
            guard try condition.evaluate(with: manager) else { return "" }
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

extension TemplateValue where Value: Sequence {

    func forEach(@ContentBuilder content: (TemplateValue<Value.Element>) -> Content) -> Content {
        ForEach(in: self, content: content)
    }
}

extension Sequence {
    public func htmlForEach(@ContentBuilder content: (TemplateValue<Element>) -> Content) -> Content {
        ForEach(in: .constant(self), content: content)
    }
}
