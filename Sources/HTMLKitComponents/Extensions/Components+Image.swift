import HTMLKit

extension HTMLKit.Image {

    public func source(_ value: DynamicType) -> HTMLKit.Image {

        switch value {
        case .string(let string):
            return self.source(string)

        case .value(let value):
            return self.source(value)
        }
    }
}
