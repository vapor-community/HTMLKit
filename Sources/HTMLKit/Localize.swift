//
//  Localize.swift
//  HTMLKit
//
//  Created by Mats Mollestad on 16/04/2019.
//

import Lingo
import Foundation

/// A compiled template that returnes a localized string
struct Localize<T: ContextualTemplate, C: Encodable>: CompiledTemplate {

    enum Errors: LocalizedError {
        case missingLocalePath

        var errorDescription: String? {
            return "LocalizedTemplate.localePath is not set, and can therefore not determine the locale."
        }

        var recoverySuggestion: String? {
            return "Remember to add LocalizedTemplate.localePath variable to set some locale."
        }
    }

    /// The key/text to localize
    let key: String

    /// The path to the content needed to render the string, if needed
    let contentReferance: ContextReferance<T.Context, C>?

    /// A alteernative to `contentReferance` where a dict with keys is used instead of a Encodable Context
    let templateContent: [String : CompiledTemplate]?

    // View `CompiledTempalte`
    func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {

        guard let locale = manager.locale else {
            throw Errors.missingLocalePath
        }

        if let contentReferance = contentReferance {

            var optionalContent: C?
            switch contentReferance {
            case .keyPath(let keyPath): optionalContent = try manager.value(at: keyPath)
            case .root(let type): optionalContent = try manager.value(for: type) as? C
            }

            guard let content = optionalContent,
                let data = try? JSONEncoder().encode(content) else {
                    print("-- ERROR: Not able to encode content when localizing \(key), in \(locale), with content: \(String(describing: optionalContent)).")
                return ""
            }
            let dict = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
            return manager.lingo?.localize(key, locale: locale, interpolations: dict) ?? ""
        } else if let content = templateContent {
            let dict: [String : Any] = try content.mapValues { value in
                if value.renderWhenLocalizing {
                    return try value.render(with: manager)
                } else {
                    return value
                }
            }
            return manager.lingo?.localize(key, locale: locale, interpolations: dict) ?? ""
        } else {
            return manager.lingo?.localize(key, locale: locale) ?? ""
        }
    }

    // View `Brewable`
    func brew<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(mappable: self)
    }
}
