////
////  TemplateVariable.swift
////  HTMLKit
////
////  Created by Mats Mollestad on 02/03/2019.
////
//
//
///// A variable making it possible to lazily insert variables
/////
/////     div(children: variable(\.name))     // May leed to "<div>Mats</div>", deepending in the context given
//public struct TemplateVariable<Root, Value> where Root : ContextualTemplate, Value : View {
//
//    /// The key-path to the variable to render
//    let reference: ContextReference<Root, Value>
//
//    /// The escaping option
//    public let escaping: EscapingOption
//}
