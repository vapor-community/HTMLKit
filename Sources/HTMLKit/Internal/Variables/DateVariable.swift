import Foundation

/// A struct that renders a data in a specified format
///
///
struct DateVariable: Content {

    enum Errors: LocalizedError {
        case unableToCopyFormatter

        var errorDescription: String? {
            return "Unable to copy the DateFormatter when rendering a date with a locale"
        }
    }

    enum Reference {
        case solid(TemplateValue<Date>)
        case optional(TemplateValue<Date?>)
    }

    enum Format {
        case style(Style)
        case literal(String)

        struct Style {
            let dateStyle: DateFormatter.Style
            let timeStyle: DateFormatter.Style
        }
    }

    let dateReference: Reference

    var format: Format

    func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {

        var optionalDate: Date?
        switch dateReference {
        case .solid(let path): optionalDate = try path.value(from: manager)
        case .optional(let path): optionalDate = try path.value(from: manager)
        }

        guard let date = optionalDate else { return "" }

        let formatter = DateFormatter()

        if let locale = manager.locale {
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

    func prerender(_ formula: Renderer.Formula) throws {
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
    public func style(date: DateFormatter.Style = .short, time: DateFormatter.Style = .short) -> Content {
        return DateVariable(dateReference: .solid(self), format: .style(.init(dateStyle: date, timeStyle: time)))
    }

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - format: The formate to render the date with
    /// - Returns: A `CompiledTemplate`
    public func formatted(string format: String) -> Content {
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
    public func style(date: DateFormatter.Style = .short, time: DateFormatter.Style = .short) -> Content {
        return DateVariable(dateReference: .optional(self), format: .style(.init(dateStyle: date, timeStyle: time)))
    }

    /// Render a date in a formate
    ///
    /// - Parameters:
    ///   - datePath: The path to the date
    ///   - format: The formate to render the date with
    /// - Returns: A `CompiledTemplate`
    public func formatted(string format: String) -> Content {
        return DateVariable(dateReference: .optional(self), format: .literal(format))
    }
}
