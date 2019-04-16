//
//  Localize.swift
//  HTMLKit
//
//  Created by Mats Mollestad on 16/04/2019.
//

#if canImport(LingoVapor)
import Foundation

struct Localize<T: ContextualTemplate, C: Encodable>: CompiledTemplate {

    let key: String
    let localePath: KeyPath<T.Context, String>
    let contentPath: KeyPath<T.Context, C>?

    func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {

        let locale = try manager.value(at: localePath)

        if let contentPath = contentPath {
            let content = try manager.value(at: contentPath)
            guard let data = try? JSONEncoder().encode(content) else {
                print("-- ERROR: Not able to encode content when localizing \(key), in \(locale), with content: \(content).")
                return ""
            }
            let dict = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
            return manager.lingo.localize(key, locale: locale, interpolations: dict)
        } else {
            return manager.lingo.localize(key, locale: locale)
        }
    }

    func brew<T>(_ formula: HTMLRenderer.Formula<T>) throws where T : ContextualTemplate {
        formula.add(mappable: self)
    }
}

extension ContextualTemplate {

    /// Localize a key to a locale
    ///
    /// - Parameters:
    ///   - key: The key describing the text
    ///   - locale: A key path to the local the text should be in
    /// - Returns: A text with the localized string
    /// - Throws: If some part of the localization went wrong
    public func localize(_ key: String, in locale: KeyPath<Context, String>) throws -> CompiledTemplate {
        return Localize<Self, NoContext>(key: key, localePath: locale, contentPath: nil)
    }

    /// Localize a key to a locale
    ///
    /// - Parameters:
    ///   - key: The key describing the text
    ///   - locale: A key path to the local the text should be in
    /// - Returns: A text with the localized string
    /// - Throws: If some part of the localization went wrong
    public func localize<C: Encodable>(_ key: String, in locale: KeyPath<Context, String>, contentPath: KeyPath<Context, C>) throws -> CompiledTemplate {
        return Localize<Self, C>(key: key, localePath: locale, contentPath: contentPath)
    }
}
#endif
