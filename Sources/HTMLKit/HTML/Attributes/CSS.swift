extension AttributedHTML where BaseTag.HTMLScope: Scopes.Body {
    public func id(_ ids: AnyStyle...) -> Modified<BaseTag> {
        modify(
            with: Modifier(
                modifier: .style(
                    type: .id,
                    value: ids
                )
            )
        )
    }
    
    public func `class`(_ classes: AnyStyle...) -> Modified<BaseTag> {
        modify(
            with: Modifier(
                modifier: .style(
                    type: .class,
                    value: classes
                )
            )
        )
    }
}

import NIO
final class StyleRegistery {
    private var style: ByteBuffer
    
    init() {
        style = ByteBufferAllocator().buffer(capacity: 4_096)
    }
    
    func generate() -> ByteBuffer {
        return style
    }
}

public struct AnyStyle: ExpressibleByStringLiteral {
    public let styleName: String
    internal var register: ((StyleRegistery) -> ())?
    
    internal init(styleName: String, register: @escaping (StyleRegistery) -> ()) {
        self.styleName = styleName
        self.register = register
    }
    
    public init(stringLiteral value: String) {
        self.styleName = value
        self.register = nil
    }
}

protocol Style {
    
}

public struct CSS {
    internal init() {}
}
