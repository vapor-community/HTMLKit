//
//  DateVariable.swift
//  HTMLKit
//
//  Created by Mats Mollestad on 02/05/2019.
//

import Foundation

/// A struct that renders a data in a specified formate
struct DateVariable<Root>: HTML {

    enum Errors: LocalizedError {
        case unableToCopyFormatter

        var errorDescription: String? {
            return "Unable to copy the DateFormatter when rendering a date with a locale"
        }
    }

    enum Reference {
        case solid(TemplateValue<Root, Date>)
        case optional(TemplateValue<Root, Date?>)
    }

    enum Format {
        case style(Style)
        case literal(String)

        struct Style {
            let dateStyle: DateFormatter.Style
            let timeStyle: DateFormatter.Style
        }
    }

    /// The key path to the date to render
    let dateReference: Reference

    var format: Format

    // View `CompiledTemplate`
    func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {

        var optionalDate: Date?
        switch dateReference {
        case .solid(let path):
            optionalDate = try path.value(from: manager)
        case .optional(let path):
            optionalDate = try path.value(from: manager)
        }

        guard let date = optionalDate else { return "" }

        let formatter = DateFormatter()

        if let locale = manager.locale {
            // settign locale before the format in order to bypass Linux bug
            formatter.locale = .init(identifier: locale)
        }
        switch format {
        case .literal(let format):
            formatter.dateFormat = format
        case .style(let style):
            formatter.dateStyle = style.dateStyle
            formatter.timeStyle = style.timeStyle
        }
        return formatter.string(from: date)
    }

    // View `CompiledTemplate`
    func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
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
    public func style(dateStyle: DateFormatter.Style = .short, timeStyle: DateFormatter.Style = .short) -> HTML {
        return DateVariable(dateReference: .solid(self), format: .style(.init(dateStyle: dateStyle, timeStyle: timeStyle)))
    }

//    /// Render a date in a formate
//    ///
//    /// - Parameters:
//    ///   - datePath: The path to the date
//    ///   - formatter: The DateFormatter to use when rendering the string
//    /// - Returns: A `CompiledTemplate`
//    public func formating(with formatter: DateFormatter) -> HTML {
//        return DateVariable(formatter: formatter, dateReference: .solid(self))
//    }

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - format: The formate to render the date with
    /// - Returns: A `CompiledTemplate`
    public func formating(string format: String) -> HTML {
        return DateVariable(dateReference: .solid(self), format: .literal(format))
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
    public func style(dateStyle: DateFormatter.Style = .short, timeStyle: DateFormatter.Style = .short) -> HTML {
        return DateVariable(dateReference: .optional(self), format: .style(.init(dateStyle: dateStyle, timeStyle: timeStyle)))
    }

//    /// Render a date in a formate
//    ///
//    /// - Parameters:
//    ///   - datePath: The path to the date
//    ///   - formatter: The DateFormatter to use when rendering the string
//    /// - Returns: A `CompiledTemplate`
//    public func formating(with formatter: DateFormatter) -> HTML {
//        return DateVariable(formatter: formatter, dateReference: .optional(self))
//    }

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - format: The formate to render the date with
    /// - Returns: A `CompiledTemplate`
    public func formating(string format: String) -> HTML {
        return DateVariable(dateReference: .optional(self), format: .literal(format))
    }
}
