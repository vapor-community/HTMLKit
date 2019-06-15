////
////  TemplateForEach.swift
////  HTMLKit
////
////  Created by Mats Mollestad on 02/03/2019.
////
//
///// A struct making it possible to have a for each loop in the template
/////
/////     forEach(\.collection, render: CollectionView.self)
//public class TemplateForEach<Root: ContextualTemplate, Value: ContextualTemplate> {
//
//    /// The view type to render
//    public let view: Value
//
//    /// The path to the collection to loop
//    let referance: ContextReferance<Root, [Value.Context]>
//
//    /// A local formula, in order to increase the performance
//    var localFormula: HTMLRenderer.Formula<Value>
//
//    init(view: Value, referance: ContextReferance<Root, [Value.Context]>) {
//        self.view = view
//        self.referance = referance
//        self.localFormula = HTMLRenderer.Formula(context: Value.self)
//    }
//}
