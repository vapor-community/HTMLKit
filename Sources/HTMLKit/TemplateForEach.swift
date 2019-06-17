//
//  TemplateForEach.swift
//  HTMLKit
//
//  Created by Mats Mollestad on 02/03/2019.
//


///// A struct making it possible to have a for each loop in the template
//public struct ForEach<Value> {
//
//    public let context: ContextVariable<[Value]>
//
//    public let content: View
//
//    let localFormula: HTMLRenderer.Formula<Value>
//
//    public init(in context: ContextVariable<[Value]>, @HTMLBuilder content: (ContextVariable<Value>) -> View) {
//        self.context = context
//        self.content = content(.root(Value.self, rootId: context.pathId + "-loop"))
//        localFormula = .init(context: Value.self)
//    }
//}
//
//extension ForEach: View {
//
//    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
//        formula.add(mappable: self)
//        try content.prerender(localFormula)
//    }
//
//    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
//        let arrayCount = try manager.value(for: context).count
//        var rendering = ""
//        for index in 0..<arrayCount {
//            manager.prepend(context[index], for: context.pathId + "-loop")
//            rendering += try localFormula.render(with: manager)
//        }
//        return rendering
//    }
//}
