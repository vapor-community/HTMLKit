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
            return "Unable to find a formula for the given view type"
        }

        var recoverySuggestion: String? {
            return "Remember to add LocalizedTemplate.localePath variable to set some locale"
        }
    }

    /// The key/text to localize
    let key: String

    /// The path to the content needed to render the string, if needed
    let contentReferance: ContextReferance<T, C>?

    // View `CompiledTempalte`
    func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {

        guard let localePath = manager.localePath else {
            throw Errors.missingLocalePath
        }

        let locale = try manager.value(at: localePath)

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
        } else {
            return manager.lingo?.localize(key, locale: locale) ?? ""
        }
    }

    // View `Brewable`
    func brew<T>(_ formula: HTMLRenderer.Formula<T>) throws where T : ContextualTemplate {
        formula.add(mappable: self)
    }
}
