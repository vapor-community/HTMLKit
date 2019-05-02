//
//  DateVariable.swift
//  HTMLKit
//
//  Created by Mats Mollestad on 02/05/2019.
//

import Foundation

/// A struct that renders a data in a specified formate
struct DateVariable<T: ContextualTemplate>: CompiledTemplate {

    enum Errors: LocalizedError {
        case unableToCopyFormatter

        var errorDescription: String? {
            return "Unable to find a formula for the given view type"
        }
    }

    /// The formatter to use when rendering a date
    let formatter: DateFormatter

    /// The key path to the date to render
    let datePath: KeyPath<T.Context, Date>


    // View `CompiledTemplate`
    func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {

        let date = try manager.value(at: datePath)

        if let localePath = manager.localePath {

            // Copying in order to make the formatter personal for the rendering
            // If not, the locale may not be set correctly
            guard let formatterCopy = formatter.copy() as? DateFormatter else {
                throw Errors.unableToCopyFormatter
            }
            let locale = try manager.value(at: localePath)
            formatterCopy.locale = .init(identifier: locale)
            return formatterCopy.string(from: date)
        } else {
            return formatter.string(from: date)
        }
    }

    // View `CompiledTemplate`
    func brew<T>(_ formula: HTMLRenderer.Formula<T>) throws where T : ContextualTemplate {
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
    public func date(_ datePath: KeyPath<Context, Date>, dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> CompiledTemplate {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return DateVariable<Self>(formatter: formatter, datePath: datePath)
    }

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - dateFormat: The formate to render the date with
    /// - Returns: A `CompiledTemplate`
    public func date(_ datePath: KeyPath<Context, Date>, format: String) -> CompiledTemplate {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return DateVariable<Self>(formatter: formatter, datePath: datePath)
    }
}
