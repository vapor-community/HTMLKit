/*
 Abstract:
 The file contains everything related to form component.
 */

import HTMLKit

/// A component that collects form controls.
public struct Form: View, Actionable {
    
    /// The identifier of the form.
    internal var id: String?
    
    internal var method: HTMLKit.Values.Method
    
    internal var encoding: HTMLKit.Values.Encoding
    
    /// The content of the container.
    internal var content: [FormElement]
    
    /// The classes of the container.
    internal var classes: [String]
    
    /// The events of the container.
    internal var events: [String]?
    
    /// Creates a form.
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
    
    public func tag(_ value: String) -> Form {
        return self.mutate(id: value)
    }
}

extension Form: FormEvent {
    
    public func onSubmit(@ActionBuilder action: (SubmitAction) -> [Action]) -> Form {
        return self.mutate(submitevent: action(.init()))
    }
}
