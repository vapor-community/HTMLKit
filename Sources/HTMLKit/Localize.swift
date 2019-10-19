////
////  Localize.swift
////  HTMLKit
////
////  Created by Mats Mollestad on 16/04/2019.
////
//
//import Lingo
//import Foundation
//

public struct NoData: Encodable {}

public struct Localized<A, B>: View where B: Encodable {

    let key: String

    let context: TemplateValue<A, B>?

    public init(key: String, context: TemplateValue<A, B>) {
        self.key = key
        self.context = context
    }

    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(mappable: self)
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        if let value = try context?.value(from: manager) {
            return "localized: \(key), value: \(value)"
        } else {
            return "localized: \(key)"
        }
    }
}

extension Localized where A == NoData, B == NoData {
    public init(key: String) {
        self.key = key
        self.context = nil
    }
}

///// A compiled template that returnes a localized string
//struct Localize<T: ContextualTemplate, C: Encodable>: View {
//
//    enum Errors: LocalizedError {
//        case missingLocalePath
//
//        var errorDescription: String? {
//            return "LocalizedTemplate.localePath is not set, and can therefore not determine the locale."
//        }
//
//        var recoverySuggestion: String? {
//            return "Remember to add LocalizedTemplate.localePath variable to set some locale."
//        }
//    }
//
//    /// The key/text to localize
//    let key: String
//
//    /// The path to the content needed to render the string, if needed
//    let contentReference: ContextReference<T, C>?
//
//    /// A alteernative to `contentReference` where a dict with keys is used instead of a Encodable Context
//    let templateContent: [String: View]?
//
//    // View `CompiledTempalte`
//    func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
//
//        guard let locale = manager.locale else {
//            throw Errors.missingLocalePath
//        }
//
//        if let contentReference = contentReference {
//
//            var optionalContent: C?
//            switch contentReference {
//            case .keyPath(let keyPath): optionalContent = try manager.value(at: keyPath)
//            case .root(let type): optionalContent = try manager.value(for: type) as? C
//            }
//
//            guard let content = optionalContent,
//                let data = try? JSONEncoder().encode(content) else {
//                    print("-- ERROR: Not able to encode content when localizing \(key), in \(locale), with content: \(String(describing: optionalContent)).")
//                return ""
//            }
//            let dict = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
//            return manager.lingo?.localize(key, locale: locale, interpolations: dict) ?? ""
//        } else if let content = templateContent {
//            let dict: [String: Any] = try content.mapValues { value in
//                if value.renderWhenLocalizing {
//                    return try value.render(with: manager)
//                } else {
//                    return value
//                }
//            }
//            return manager.lingo?.localize(key, locale: locale, interpolations: dict) ?? ""
//        } else {
//            return manager.lingo?.localize(key, locale: locale) ?? ""
//        }
//    }
//
//    // View `Brewable`
//    func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws where T: ContextualTemplate {
//        formula.add(mappable: self)
//    }
//}
