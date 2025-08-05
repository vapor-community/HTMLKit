import HTMLKit

/// A view that represents a form container.
///
/// Use `Form` to perform form submission and validation.
///
/// ```swift
/// Form(method: .post) {
///     FieldLabel {
///         "Lorem ipsum"
///     }
///     TextField(name: "Lorem")
///     Button(role: .submit) {
///         "Save"
///     }
/// }
/// ```
public struct Form: View, Actionable {
    
    /// The unique identifier of the form.
    internal var id: String?
    
    /// The form method of the submission.
    internal var method: HTMLKit.Values.Method
    
    /// The encoding strategy for the submission.
    internal var encoding: HTMLKit.Values.Encoding
    
    /// The body content of the form.
    internal var content: [FormElement]
    
    /// The class names for the form.
    internal var classes: [String]
    
    /// The event handlers on the form.
    internal var events: [String]?
    
    /// Create a form.
    ///
    /// - Parameters:
    ///   - method: The method to use for the submission.
    ///   - encoding: The strategy to use for the encoding.
    ///   - content: The form's content.
    public init(method: Values.Method, encoding: Values.Encoding = .urlEncoded, @ContentBuilder<FormElement> content: () -> [FormElement]) {
        
        self.method = method
        self.encoding = encoding
        self.content = content()
        self.classes = ["form"]
    }
    
    public var body: Content {
        HTMLKit.Form {
            content
        }
        .method(method)
        .encoding(encoding)
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
        if let events = self.events {
            Script {
                events
            }
        }
    }
    
    /// Set the identifier for the form.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The form
    public func tag(_ value: String) -> Form {
        return self.mutate(id: value)
    }
}

extension Form: FormEvent {
    
    public func onSubmit(@ActionBuilder action: (SubmitAction) -> [Action]) -> Form {
        return self.mutate(submitevent: action(.init()))
    }
}
