import Foundation

public enum DateStyle: String {
    case none
    case short
    case medium
    case long
    case full

    var dateFormatterStyle: DateFormatter.Style {
        switch self {
        case .none: return .none
        case .short: return .short
        case .medium: return .medium
        case .long: return .long
        case .full: return .full
        }
    }
}

public enum DateFormatStyle: ExpressibleByStringLiteral {

    case styled(date: DateStyle, time: DateStyle)
    case format(String)

    public init(stringLiteral value: String) {
        self = .format(value)
    }
}

public protocol DateFormattable {
    func format(date: Date, with env: CompiledTemplateEnviroment) -> String
}

extension DateFormatter: DateFormattable {
    public func format(date: Date, with env: CompiledTemplateEnviroment) -> String {
        self.locale = Locale(identifier: env.locale)
        return self.string(from: date)
    }
}


public struct DateVariable: HTML {
    public typealias Content = AnyHTML

    let variable: TemplateRuntimeValue
    let format: DateFormatStyle

    public var html: AnyHTML<Scopes.Body> {
        return .init(node: .date(variable, format))
    }
}


extension HTMLContext where Value == Date {

    public func formatted(date: DateStyle, time: DateStyle) -> DateVariable {
        DateVariable(
            variable: runtimeValue,
            format: .styled(date: date, time: time)
        )
    }

    public func formatted(with string: String) -> DateVariable {
        DateVariable(
            variable: runtimeValue,
            format: .format(string)
        )
    }
}
