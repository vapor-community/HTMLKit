/// # Description:
/// The file contains the basic attribute handlers.
///
/// # Note:
/// If you about to add something to the file, stick to the official documentation to keep the code consistent.
///
/// # Authors:
/// Mats Moll: https://github.com/matsmoll
/// Mattes Mohr: https://github.com/mattesmohr

/// # Description:
/// The builder builds up a result value from a sequence of the content.
///
/// # References:
///
@resultBuilder public class ContentBuilder<T> {
    
    public static func buildBlock() -> [T] {
        return []
    }

    public static func buildBlock(_ elements: T...) -> [T] {
        return elements
    }
    
    public static func buildBlock(_ elements: [T]...) -> [T] {
        return elements.flatMap( { $0 } )
    }
}

extension ContentBuilder where T: AnyContent {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ContentBuilder where T == String {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ContentBuilder where T: HtmlElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ContentBuilder where T: BodyElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ContentBuilder where T: DescriptionElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ContentBuilder where T: FigureElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ContentBuilder where T: FormElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ContentBuilder where T: BasicElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ContentBuilder where T: HeadElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ContentBuilder where T: InputElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ContentBuilder where T: ListElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ContentBuilder where T: MapElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ContentBuilder where T: MediaElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ContentBuilder where T: ObjectElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ContentBuilder where T: RubyElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}

extension ContentBuilder where T: TableElement {
    
    public static func buildBlock(_ content: T...) -> [T] {
        return content
    }
}
