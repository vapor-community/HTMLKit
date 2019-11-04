@_functionBuilder
public enum TemplateBuilder<Scope: HTMLScope> {
    public static func buildBlock() -> AnyHTML<HTMLScope> {
        return AnyHTML(node: .none)
    }
    
    public static func buildBlock<Content: _HTML>(
        _ content: Content
    ) -> Content where Content.HTMLScope == Scope {
        return content
    }
    
    public static func buildBlock<
        C0: _HTML, C1: _HTML
    >(
        _ c0: C0, _ c1: C1
    ) -> ListContent<Scope> where C0.HTMLScope == Scope, C1.HTMLScope == Scope {
        return ListContent(list: [
            .init(from: c0),
            .init(from: c1),
        ])
    }
    
    public static func buildBlock<
        C0: _HTML, C1: _HTML, C2: _HTML
    >(
        _ c0: C0, _ c1: C1, _ c2: C2
    ) -> ListContent<Scope> where
        C0.HTMLScope == Scope, C1.HTMLScope == Scope,
        C2.HTMLScope == Scope
    {
        return ListContent(list: [
            .init(from: c0),
            .init(from: c1),
            .init(from: c2),
        ])
    }
    
    public static func buildBlock<
        C0: _HTML, C1: _HTML, C2: _HTML, C3: _HTML
    >(
        _ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3
    ) -> ListContent<Scope> where
        C0.HTMLScope == Scope, C1.HTMLScope == Scope,
        C2.HTMLScope == Scope, C3.HTMLScope == Scope
    {
        return ListContent(list: [
            .init(from: c0),
            .init(from: c1),
            .init(from: c2),
            .init(from: c3),
        ])
    }
    
    public static func buildBlock<
        C0: _HTML, C1: _HTML, C2: _HTML, C3: _HTML, C4:_HTML
    >(
        _ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4
    ) -> ListContent<Scope> where
        C0.HTMLScope == Scope, C1.HTMLScope == Scope,
        C2.HTMLScope == Scope, C3.HTMLScope == Scope,
        C4.HTMLScope == Scope
    {
        return ListContent(list: [
            .init(from: c0),
            .init(from: c1),
            .init(from: c2),
            .init(from: c3),
            .init(from: c4),
        ])
    }
    
    public static func buildBlock<
        C0: _HTML, C1: _HTML, C2: _HTML, C3: _HTML, C4:_HTML, C5:_HTML
    >(
        _ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5
    ) -> ListContent<Scope> where
        C0.HTMLScope == Scope, C1.HTMLScope == Scope,
        C2.HTMLScope == Scope, C3.HTMLScope == Scope,
        C4.HTMLScope == Scope, C5.HTMLScope == Scope
    {
        return ListContent(list: [
            .init(from: c0),
            .init(from: c1),
            .init(from: c2),
            .init(from: c3),
            .init(from: c4),
            .init(from: c5),
        ])
    }
    
    public static func buildIf<Content: _HTML>(_ content: Content?) -> Content? where Content.HTMLScope == Scope { content }
    
    public static func buildEither<
        True: _HTML,
        False: _HTML
    >(first: True) -> ConditionalHTML<True, False> where ConditionalHTML<True, False>.HTMLScope == Scope {
        return ConditionalHTML<True, False>(condition: .trueCase(first))
    }
    
    public static func buildEither<
        True: _HTML,
        False: _HTML
    >(second: False) -> ConditionalHTML<True, False> where ConditionalHTML<True, False>.HTMLScope == Scope {
        return ConditionalHTML<True, False>(condition: .falseCase(second))
    }
}


//import SuperTextKit
//
//extension Localized: HTML {
//    public var html: some HTML {
//        return .
//    }
//}
