import Foundation

/// The struct ist for
///
///
public struct NoData: Encodable {}

/// The struct ist for
///
///
public struct Localized<B>: AnyContent where B: Encodable {

    enum Errors: Error {
        case missingLingoConfig
    }

    let key: String

    let context: TemplateValue<B>?

    public init(key: String, context: TemplateValue<B>) {
        self.key = key
        self.context = context
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(mappable: self)
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        guard let lingo = manager.lingo else {
            throw Errors.missingLingoConfig
        }
        let locale = manager.locale ?? lingo.defaultLocale
        if let value = try context?.value(from: manager) {
            guard let data = try? JSONEncoder().encode(value) else {
                    print("-- ERROR: Not able to encode content when localizing \(key), in \(locale), with content: \(String(describing: context)).")
                return ""
            }
            let dict = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
            return lingo.localize(key, locale: locale, interpolations: dict)
        } else {
            return lingo.localize(key, locale: locale)
        }
    }
}

extension Localized where B == NoData {
    public init(key: String) {
        self.key = key
        self.context = nil
    }
}
