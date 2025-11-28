import HTMLKit

/// A view that represents a date picker.
///
/// Use `DatePicker` to pick a date from a calendar.
///
/// ```swift
/// DatePicker(name: "lorem", prompt: "Lorem ipsum", value: "Lorem ipsum")
/// ```
public struct DatePicker: View, Modifiable, Identifiable {
    
    /// The unique identifier of the picker.
    internal var id: String?
    
    /// The name of the picker.
    internal let name: String
    
    /// The content hint for the field.
    internal let prompt: PromptType?
    
    /// The content of the picker.
    internal let value: String?
    
    /// The class names for the picker.
    internal var classes: [String]
    
    /// The event handlers of the picker.
    internal var events: [String]?
    
    /// Create a date picker.
    /// 
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - prompt: The prompt to guide the user.
    ///   - value: The date to edit within the field.
    @_disfavoredOverload
    public init(name: String, prompt: String? = nil, value: String? = nil) {
        
        self.name = name
        self.prompt = prompt.map(PromptType.string(_:))
        self.value = value
        self.classes = ["datepicker"]
    }
    
    /// Create a date picker.
    /// 
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - prompt: The prompt to guide the user.
    ///   - value: The date to edit within the field.
    public init(name: String, prompt: LocalizedStringKey? = nil, value: String? = nil) {
        
        self.name = name
        self.prompt = prompt.map(PromptType.value(_:))
        self.value = value
        self.classes = ["datepicker"]
    }
    
    public var body: Content {
        Division {
            Input()
                .type(.text)
                .class("datepicker-datefield")
                .name(name)
                .modify(unwrap: value) {
                    $0.value($1)
                }
                .modify(unwrap: prompt) {
                    $0.placeholder($1)
                }
            self.calendar
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public var calendar: Content {
        Division {
            UnorderedList {
                ListItem {
                    HTMLKit.Button {
                        Vector {
                            Polyline {
                            }
                            .points("10 2 4 8 10 14")
                        }
                        .viewBox(x: 0, y: 0, width: 16, height: 16)
                        .namespace("http://www.w3.org/2000/svg")
                        .fill("currentColor")
                        .strokeWidth(2)
                        .strokeLineCap(.round)
                        .strokeLineJoin(.round)
                    }
                    .type(.button)
                    .value(verbatim: "previous")
                }
                ListItem {
                    Bold {
                    }
                    .class("calendar-detail")
                }
                ListItem {
                    HTMLKit.Button {
                        Vector {
                            Polyline {
                            }
                            .points("6 2 12 8 6 14")
                        }
                        .viewBox(x: 0, y: 0, width: 16, height: 16)
                        .namespace("http://www.w3.org/2000/svg")
                        .fill("currentColor")
                        .strokeWidth(2)
                        .strokeLineCap(.round)
                        .strokeLineJoin(.round)
                    }
                    .type(.button)
                    .value(verbatim: "next")
                }
            }
            .class("calendar-navigation")
            UnorderedList {
                ListItem {
                    "Sun"
                }
                ListItem {
                    "Mon"
                }
                ListItem {
                    "Tue"
                }
                ListItem {
                    "Wed"
                }
                ListItem {
                    "Thu"
                }
                ListItem {
                    "Fri"
                }
                ListItem {
                    "Sat"
                }
            }
            .class("calendar-week")
            UnorderedList {
            }
            .class("calendar-days")
        }
        .class("datepicker-calendar")
    }
}

extension DatePicker: InputModifier {
    
    public func disabled(_ condition: Bool = true) -> DatePicker {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> DatePicker {
        return self.mutate(focuscolor: color.value)
    }
}

extension DatePicker: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> DatePicker {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> DatePicker {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden(_ condition: Bool = true) -> DatePicker {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> DatePicker {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> DatePicker {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> DatePicker {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> DatePicker {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> DatePicker {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> DatePicker {
        return self.mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> DatePicker {
        return self.mutate(margin: length.value, insets: insets)
    }
}
