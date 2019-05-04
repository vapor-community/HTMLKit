//
//  DateVariable.swift
//  HTMLKit
//
//  Created by Mats Mollestad on 02/05/2019.
//

import Foundation

/// A struct that renders a data in a specified formate
struct DateVariable<T: ContextualTemplate>: CompiledTemplate {

    enum Referance {
        case optional(KeyPath<T.Context, Date?>)
        case solid(KeyPath<T.Context, Date>)
    }

    enum Errors: LocalizedError {
        case unableToCopyFormatter

        var errorDescription: String? {
            return "Unable to copy the DateFormatter when rendering a date with a locale"
        }
    }

    /// The formatter to use when rendering a date
    let formatter: DateFormatter

    /// The key path to the date to render
    let dateReferance: Referance


    // View `CompiledTemplate`
    func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {

        var optionalDate: Date?
        switch dateReferance {
        case .optional(let keyPath): optionalDate = try manager.value(at: keyPath)
        case .solid(let keyPath): optionalDate = try manager.value(at: keyPath)
        }

        guard let date = optionalDate else {
            return ""
        }

        if let locale = manager.locale {

            // Copying in order to make the formatter personal for the rendering
            // If not, the locale may not be set correctly
            guard let formatterCopy = formatter.copy() as? DateFormatter else {
                throw Errors.unableToCopyFormatter
            }
            formatterCopy.locale = .init(identifier: locale)
            return formatterCopy.string(from: date)
        } else {
            return formatter.string(from: date)
        }
    }

    // View `CompiledTemplate`
    func brew<T>(_ formula: HTMLRenderer.Formula<T>) throws where T : ContextualTemplate {
        formatter.calendar = formula.calendar
        formatter.timeZone = formula.timeZone
        formula.add(mappable: self)
    }
}

extension ContextualTemplate {

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - dateStyle: The style to use to render the date
    ///   - timeStyle: The style to use to render the time
    /// - Returns: A `CompiledTemplate`
    public func date(_ datePath: KeyPath<Context, Date>, dateStyle: DateFormatter.Style = .short, timeStyle: DateFormatter.Style = .short) -> CompiledTemplate {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return DateVariable<Self>(formatter: formatter, dateReferance: .solid(datePath))
    }

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - formatter: The DateFormatter to use when rendering the string
    /// - Returns: A `CompiledTemplate`
    public func date(_ datePath: KeyPath<Context, Date>, formatter: DateFormatter) -> CompiledTemplate {
        return DateVariable<Self>(formatter: formatter, dateReferance: .solid(datePath))
    }

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - format: The formate to render the date with
    /// - Returns: A `CompiledTemplate`
    public func date(_ datePath: KeyPath<Context, Date>, format: String) -> CompiledTemplate {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return DateVariable<Self>(formatter: formatter, dateReferance: .solid(datePath))
    }

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - dateStyle: The style to use to render the date
    ///   - timeStyle: The style to use to render the time
    /// - Returns: A `CompiledTemplate`
    public func date(_ datePath: KeyPath<Context, Date?>, dateStyle: DateFormatter.Style = .short, timeStyle: DateFormatter.Style = .short) -> CompiledTemplate {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return DateVariable<Self>(formatter: formatter, dateReferance: .optional(datePath))
    }

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - format: The formate to render the date with
    /// - Returns: A `CompiledTemplate`
    public func date(_ datePath: KeyPath<Context, Date?>, format: String) -> CompiledTemplate {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return DateVariable<Self>(formatter: formatter, dateReferance: .optional(datePath))
    }

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - formatter: The DateFormatter to use when rendering the string
    /// - Returns: A `CompiledTemplate`
    public func date(_ datePath: KeyPath<Context, Date?>, formatter: DateFormatter) -> CompiledTemplate {
        return DateVariable<Self>(formatter: formatter, dateReferance: .optional(datePath))
    }
}
