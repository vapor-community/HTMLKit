////
////  Localize.swift
////  HTMLKit
////
////  Created by Mats Mollestad on 16/04/2019.
////
//
//import Lingo
import Foundation
//

public protocol LocalizableNode {
    init(_ localizedKey: String)
    init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B: Encodable
}

extension LocalizableNode {
    public init<T>(_ localizedKey: String, with context: T) where T: Encodable {
        self.init(localizedKey, with: TemplateValue<T>.constant(context))
    }
}

public struct NoData: Encodable {}

public struct Localized<B>: HTML where B: Encodable {

    enum Errors: Error {
        case missingLingoConfig
    }

    let key: String

    let context: TemplateValue<B>?

    public init(key: String, context: TemplateValue<B>) {
        self.key = key
        self.context = context
    }

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(mappable: self)
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        guard let lingo = manager.lingo else {
            throw Errors.missingLingoConfig
        }
        let locale = manager.locale ?? lingo.defaultLocale
        if let value = try context?.value(from: manager) {
            guard let data = try? JSONEncoder().encode(value) else {
                    print("-- ERROR: Not able to encode content when localizing \(key), in \(locale), with content: \(String(describing: context)).")
                return ""
            }
            let dict = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
            return lingo.localize(key, locale: locale, interpolations: dict)
        } else {
            return lingo.localize(key, locale: locale)
        }
    }
}

extension Localized where B == NoData {
    public init(key: String) {
        self.key = key
        self.context = nil
    }
}

public struct EnvironmentModifier: HTML {

    let view: HTML
    let locale: HTML

    let localFormula = HTMLRenderer.Formula()

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        try view.prerender(localFormula)
        formula.add(mappable: self)
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        let prevLocale = manager.locale
        manager.locale = try locale.render(with: manager)
        let rendering = try localFormula.render(with: manager)
        manager.locale = prevLocale
        return rendering
    }
}

extension HTML {
    public func environment(locale: String) -> EnvironmentModifier {
        return EnvironmentModifier(view: self, locale: locale)
    }

    public func environment(locale: TemplateValue<String>) -> EnvironmentModifier {
        return EnvironmentModifier(view: self, locale: locale)
    }
}
