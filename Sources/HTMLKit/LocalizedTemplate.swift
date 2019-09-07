////
////  LocalizedTemplate.swift
////  HTMLKit
////
////  Created by Mats Mollestad on 02/05/2019.
////
//
//
//public protocol LocalizedTemplate: ContextualTemplate {
//
//    /// A data type containing the different localization string keys
//    associatedtype LocalizationKeys: RawRepresentable
//
//    /// The path to the used locale
//    /// This is a optional in order to inheret a locale from a superview
//    static var localePath: KeyPath<Context, String>? { get }
//}
//
//extension LocalizedTemplate where LocalizationKeys.RawValue == String {
//
//    /// Localize a key to a locale
//    ///
//    /// - Parameters:
//    ///   - key: The key describing the text
//    /// - Returns: A text with the localized string
//    /// - Throws: If some part of the localization went wrong
//    public func localize(_ key: LocalizationKeys) -> View {
//        return localize(key: key.rawValue)
//    }
//
//    /// Localize a key to a locale
//    ///
//    /// - Parameters:
//    ///   - key: The key describing the text
//    ///   - contentPath: The path to the content needed to render the string
//    /// - Returns: A text with the localized string
//    /// - Throws: If some part of the localization went wrong
//    public func localize<C: Encodable>(_ key: LocalizationKeys, with contentPath: KeyPath<Context, C>) -> View {
//        return localize(key: key.rawValue, with: contentPath)
//    }
//
//    /// Localize a key to a locale
//    ///
//    /// - Parameters:
//    ///   - key: The key describing the text
//    ///   - contentPath: The path to the content needed to render the string
//    /// - Returns: A text with the localized string
//    /// - Throws: If some part of the localization went wrong
//    public func localize(_ key: LocalizationKeys, with content: [String: View]) -> View {
//        return localize(key: key.rawValue, with: content)
//    }
//
//    /// Localize a key to a locale
//    ///
//    /// - Parameters:
//    ///   - key: The key describing the text
//    ///   - locale: A key path to the local the text should be in
//    /// - Returns: A text with the localized string
//    /// - Throws: If some part of the localization went wrong
//    public func localize(key: String) -> View {
//        return Localize<Self, NoContext>(key: key, contentReference: nil, templateContent: nil)
//    }
//
//    /// Localize a key to a locale
//    ///
//    /// - Parameters:
//    ///   - key: The key describing the text
//    ///   - contentPath: The path to the content needed to render the string
//    /// - Returns: A text with the localized string
//    /// - Throws: If some part of the localization went wrong
//    public func localize<C: Encodable>(key: String, with contentPath: KeyPath<Context, C>) -> View {
//        return Localize<Self, C>(key: key, contentReference: .keyPath(contentPath), templateContent: nil)
//    }
//
//    /// Localize a key to a locale
//    ///
//    /// - Parameters:
//    ///   - key: The key describing the text
//    ///   - contentPath: The path to the content needed to render the string
//    /// - Returns: A text with the localized string
//    /// - Throws: If some part of the localization went wrong
//    public func localize(key: String, with content: [String: View]) -> View {
//        return Localize<Self, NoContext>(key: key, contentReference: nil, templateContent: content)
//    }
//}

//extension LocalizedTemplate where LocalizationKeys.RawValue == String, Context: Encodable {
//
//    /// Localize a key to a locale
//    ///
//    /// - Parameters:
//    ///   - key: The key describing the text
//    /// - Returns: A text with the localized string
//    /// - Throws: If some part of the localization went wrong
//    public func localizeWithContext(_ key: LocalizationKeys) -> View {
//        return localizeWithContext(key: key.rawValue)
//    }
//
//    /// Localize a key to a locale
//    ///
//    /// - Parameters:
//    ///   - key: The key describing the text
//    /// - Returns: A text with the localized string
//    /// - Throws: If some part of the localization went wrong
//    public func localizeWithContext(key: String) -> View {
//        return Localize<Self, Context>(key: key, contentReference: .root(Self.self), templateContent: nil)
//    }
//}
