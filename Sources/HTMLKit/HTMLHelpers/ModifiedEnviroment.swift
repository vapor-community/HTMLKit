import NIO

public struct ModifiedEnviroment<Scope: HTMLScope>: _HTML {
    public typealias HTMLScope = Scope
    public typealias Content = AnyHTML

    let baseNode: TemplateNode
    let modifiers: [EnviromentModifer]

    public var html: AnyHTML<Scopes.Body> {
        AnyHTML(
            node: .enviromentModifier(baseNode, modifiers)
        )
    }

    public func modify(with modifier: EnviromentModifer) -> ModifiedEnviroment<Scope> {
        ModifiedEnviroment(
            baseNode: baseNode,
            modifiers: modifiers + [modifier]
        )
    }
}

public protocol EnviromentModifer {
    func modify(env: CompiledTemplateEnviroment)
    func revert(env: CompiledTemplateEnviroment)
}

struct CompiledModifiedEnviroment: RuntimeEvaluatable {

    let modifiers: [EnviromentModifer]
    let _template: UnsafeByteBuffer

    func compileNextNode(
        template: inout UnsafeByteBuffer,
        into output: inout ByteBuffer,
        env: CompiledTemplateEnviroment
    ) throws {
        for modifier in modifiers {
            modifier.modify(env: env)
        }
        var template = _template
        try CompiledTemplate<Any>.compileNextNode(
            template: &template,
            into: &output,
            env: env
        )
        for modifier in modifiers {
            modifier.revert(env: env)
        }
    }
}


struct LocaleModifier: EnviromentModifer {

    var newLocale: String
    var oldLocale = ""

    func modify(env: CompiledTemplateEnviroment) {
        env.locale = newLocale
    }

    func revert(env: CompiledTemplateEnviroment) {
        env.locale = oldLocale
    }
}

extension _HTML {
    public func enviroment(locale: String) -> ModifiedEnviroment<HTMLScope> {
        modify(with:
            LocaleModifier(newLocale: locale)
        )
    }
}
