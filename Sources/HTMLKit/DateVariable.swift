//
//  DateVariable.swift
//  HTMLKit
//
//  Created by Mats Mollestad on 02/05/2019.
//

import Foundation

/// A struct that renders a data in a specified formate
struct DateVariable: View {

    enum Errors: LocalizedError {
        case unableToCopyFormatter

        var errorDescription: String? {
            return "Unable to copy the DateFormatter when rendering a date with a locale"
        }
    }


    enum Referance {
        case solid(TemplateValue<Date>)
        case optional(TemplateValue<Date?>)
    }

    /// The formatter to use when rendering a date
    let formatter: DateFormatter

    /// The key path to the date to render
    let dateReferance: Referance

    /// A bool indicating if the date format is used
    /// This is used to bypass a Linux bug
    var isUsingDateStyle: Bool = false

    // View `CompiledTemplate`
    func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {

        var optionalDate: Date?
        switch dateReferance {
        case .solid(let path):
            switch path {
            case .value(let date): optionalDate = date
            case .variable(let variable): optionalDate = try manager.value(for: variable)
            }
        case .optional(let path):
            switch path {
            case .value(let date): optionalDate = date
            case .variable(let variable): optionalDate = try manager.value(for: variable)
            }
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
            if isUsingDateStyle {
                // Used to bypass a Linux bug
                formatterCopy.dateStyle = formatter.dateStyle
                formatterCopy.timeStyle = formatter.timeStyle
            }
            return formatterCopy.string(from: date)
        } else {
            return formatter.string(from: date)
        }
    }

    // View `CompiledTemplate`
    func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formatter.calendar = formula.calendar
        formatter.timeZone = formula.timeZone
        formula.add(mappable: self)
    }
}

extension TemplateValue where Value == Date {

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - dateStyle: The style to use to render the date
    ///   - timeStyle: The style to use to render the time
    /// - Returns: A `CompiledTemplate`
    public func style(dateStyle: DateFormatter.Style = .short, timeStyle: DateFormatter.Style = .short) -> View {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return DateVariable(formatter: formatter, dateReferance: .solid(self), isUsingDateStyle: true)
    }

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - formatter: The DateFormatter to use when rendering the string
    /// - Returns: A `CompiledTemplate`
    public func formating(with formatter: DateFormatter) -> View {
        return DateVariable(formatter: formatter, dateReferance: .solid(self))
    }

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - format: The formate to render the date with
    /// - Returns: A `CompiledTemplate`
    public func formating(string format: String) -> View {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return DateVariable(formatter: formatter, dateReferance: .solid(self))
    }
}

extension TemplateValue where Value == Date? {

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - dateStyle: The style to use to render the date
    ///   - timeStyle: The style to use to render the time
    /// - Returns: A `CompiledTemplate`
    public func style(dateStyle: DateFormatter.Style = .short, timeStyle: DateFormatter.Style = .short) -> View {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return DateVariable(formatter: formatter, dateReferance: .optional(self), isUsingDateStyle: true)
    }

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - formatter: The DateFormatter to use when rendering the string
    /// - Returns: A `CompiledTemplate`
    public func formating(with formatter: DateFormatter) -> View {
        return DateVariable(formatter: formatter, dateReferance: .optional(self))
    }

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - format: The formate to render the date with
    /// - Returns: A `CompiledTemplate`
    public func formating(string format: String) -> View {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return DateVariable(formatter: formatter, dateReferance: .optional(self))
    }
}
