//
//  TemplateForEach.swift
//  HTMLKit
//
//  Created by Mats Mollestad on 02/03/2019.
//

public struct ForEachContext<C> {
    public let index: Int
    public let context: C
}

/// A struct making it possible to have a for each loop in the template
///
///     forEach(\.collection, render: CollectionView.self)
public class TemplateForEach<Root: ContextualTemplate, Value: ContextualTemplate> {

    /// The view type to render
    public let view: Value

    /// The path to the collection to loop
    let referance: ContextReferance<Root.Context, [Value.Context]>

    /// A local formula, in order to increase the performance
    var localFormula: HTMLRenderer.Formula<ForEachContext<Value.Context>>

    init(view: Value, referance: ContextReferance<Root.Context, [Value.Context]>) {
        let contextPath = [String(reflecting: Value.Context.self) : \ForEachContext<Value.Context>.context]
        self.view = view
        self.referance = referance
        self.localFormula = HTMLRenderer.Formula(view: ForEachContext<Value.Context>.self, calendar: .current, timeZone: .current, contextPaths: contextPath)
    }
}
