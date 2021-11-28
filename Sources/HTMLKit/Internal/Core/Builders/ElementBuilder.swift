/// The builder is for
///
///
@resultBuilder public class ElementBuilder<T> {

    public static func buildBlock(_ elements: T...) -> [T] {
        return elements
    }
}

extension ElementBuilder where T: DefinitionElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ElementBuilder where T: FigureElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ElementBuilder where T: FormElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ElementBuilder where T: BasicElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ElementBuilder where T: HeadElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ElementBuilder where T: InputElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ElementBuilder where T: ListElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ElementBuilder where T: MapElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ElementBuilder where T: MediaElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ElementBuilder where T: ObjectElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ElementBuilder where T: RubyElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ElementBuilder where T: TableElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}
