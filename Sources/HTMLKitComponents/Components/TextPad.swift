import HTMLKit

/// A view that represents a text pad.
///
/// Use `TextPad` to edit and format text content.
///
/// ```swift
/// TextPad(name: "lorem", prompt: "Lorem ipsum") {
///     "Lorem ipsum..."
/// }
/// ```
public struct TextPad: View, Modifiable, Identifiable {
    
    /// The identifier of the textpad.
    internal var id: String?
    
    /// The name of the textpad.
    internal let name: String
    
    /// The placeholder for the field value.
    internal let prompt: PromptType?
    
    /// The number of lines.
    internal var rows: Int = 3
    
    /// The content of the textpad.
    internal var content: [String]
    
    /// The classes of the textpad.
    internal var classes: [String]
    
    /// Create a textpad.
    ///
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - prompt: The prompt to guide the user.
    ///   - content: The text content to edit within the field.
    @_disfavoredOverload
    public init(name: String, prompt: String? = nil, @ContentBuilder<String> content: () -> [String]) {
        
        self.name = name
        self.prompt = prompt.map(PromptType.string(_:))
        self.content = content()
        self.classes = ["textpad"]
    }
    
    /// Create a textpad.
    ///
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - prompt: The key of the localized string to guide the user.
    ///   - content: The text content to edit within the field.
    public init(name: String, prompt: LocalizedStringKey? = nil, @ContentBuilder<String> content: () -> [String]) {
        
        self.name = name
        self.prompt = prompt.map(PromptType.value(_:))
        self.content = content()
        self.classes = ["textpad"]
    }
    
    public var body: Content {
        Division {
            Division {
                Details {
                    Summary {
                        Vector {
                            Path {
                                Title {
                                    "More options"
                                }
                            }
                            .draw("M15.5,6.5C16.328,6.5 17,7.172 17,8C17,8.828 16.328,9.5 15.5,9.5C14.672,9.5 14,8.828 14,8C14,7.172 14.672,6.5 15.5,6.5ZM10,6.5C10.828,6.5 11.5,7.172 11.5,8C11.5,8.828 10.828,9.5 10,9.5C9.172,9.5 8.5,8.828 8.5,8C8.5,7.172 9.172,6.5 10,6.5ZM4.5,6.5C5.328,6.5 6,7.172 6,8C6,8.828 5.328,9.5 4.5,9.5C3.672,9.5 3,8.828 3,8C3,7.172 3.672,6.5 4.5,6.5Z")
                        }
                        .namespace("http://www.w3.org/2000/svg")
                        .viewBox("0 0 20 16")
                    }
                    UnorderedList {
                        ListItem {
                            HTMLKit.Button {
                                Vector {
                                    Path {
                                        Title {
                                            "Bold"
                                        }
                                    }
                                    .draw("M4.25,14.25L4.25,1.75C4.25,1.336 4.586,1 5,1L10.769,1C12.646,1 14.212,2.659 14.212,4.75C14.212,5.686 13.898,6.785 13.383,7.438C14.746,7.929 15.75,9.576 15.75,11.25C15.75,13.341 14.184,15 12.308,15L5,15C4.586,15 4.25,14.664 4.25,14.25ZM10.769,2.5L5.75,2.5C5.75,2.5 5.75,7.25 5.75,7.25L10.769,7.25C11.865,7.25 12.712,5.971 12.712,4.75C12.712,3.529 11.865,2.5 10.769,2.5ZM14.25,11.25C14.25,10.029 13.403,8.75 12.308,8.75L5.75,8.75C5.75,8.75 5.75,13.5 5.75,13.5L12.308,13.5C13.403,13.5 14.25,12.471 14.25,11.25Z")
                                }
                                .namespace("http://www.w3.org/2000/svg")
                                .viewBox("0 0 20 16")
                            }
                            .type(.button)
                            .class("toolbar-tool")
                            .custom(key: "data-command", value: "bold")
                            Span {
                                "Bold"
                            }
                            .class("tooltip")
                        }
                        ListItem {
                            HTMLKit.Button {
                                Vector {
                                    Path {
                                        Title {
                                            "Italic"
                                        }
                                    }
                                    .draw("M8.989,15L4,15C3.586,15 3.25,14.664 3.25,14.25C3.25,13.836 3.586,13.5 4,13.5L8.36,13.5L10.12,2.5L6,2.5C5.586,2.5 5.25,2.164 5.25,1.75C5.25,1.336 5.586,1 6,1C6,1 11.003,1 11.011,1L16,1C16.414,1 16.75,1.336 16.75,1.75C16.75,2.164 16.414,2.5 16,2.5L11.64,2.5L9.88,13.5L14,13.5C14.414,13.5 14.75,13.836 14.75,14.25C14.75,14.664 14.414,15 14,15C14,15 8.997,15 8.989,15Z")
                                }
                                .namespace("http://www.w3.org/2000/svg")
                                .viewBox("0 0 20 16")
                            }
                            .type(.button)
                            .class("toolbar-tool")
                            .custom(key: "data-command", value: "italic")
                            Span {
                                "Italic"
                            }
                            .class("tooltip")
                        }
                        ListItem {
                            HTMLKit.Button {
                                Vector {
                                    Path {
                                        Title {
                                            "Strikethrough"
                                        }
                                    }
                                    .draw("M6.068,7C5.894,6.829 5.745,6.646 5.621,6.45C5.305,5.95 5.148,5.39 5.148,4.771C5.148,4.09 5.341,3.454 5.727,2.862C6.113,2.27 6.678,1.821 7.42,1.514C8.162,1.208 8.987,1.054 9.894,1.054C10.894,1.054 11.775,1.215 12.539,1.537C13.302,1.859 13.89,2.333 14.301,2.959C14.711,3.584 14.932,4.292 14.963,5.083L13.252,5.212C13.16,4.36 12.849,3.716 12.318,3.28C11.788,2.845 11.004,2.627 9.968,2.627C8.888,2.627 8.102,2.825 7.608,3.221C7.115,3.616 6.868,4.093 6.868,4.651C6.868,5.136 7.043,5.534 7.392,5.847C7.736,6.16 8.632,6.48 10.083,6.808C10.373,6.874 10.644,6.938 10.898,7L6.068,7ZM14.776,9C14.787,9.014 14.797,9.029 14.806,9.044C15.181,9.599 15.368,10.238 15.368,10.962C15.368,11.679 15.162,12.355 14.751,12.99C14.34,13.625 13.75,14.118 12.98,14.471C12.211,14.824 11.345,15 10.382,15C9.161,15 8.139,14.822 7.314,14.466C6.489,14.111 5.842,13.576 5.373,12.861C4.904,12.147 4.657,11.339 4.632,10.437L6.316,10.29C6.396,10.965 6.581,11.518 6.872,11.951C7.164,12.383 7.616,12.732 8.229,12.999C8.842,13.266 9.532,13.399 10.299,13.399C10.98,13.399 11.581,13.298 12.102,13.096C12.623,12.893 13.011,12.616 13.266,12.263C13.52,11.911 13.647,11.526 13.647,11.109C13.647,10.686 13.525,10.316 13.279,10C13.034,9.685 12.629,9.419 12.065,9.205C11.922,9.149 11.709,9.081 11.428,9L14.776,9ZM17,7.277L17,8.777L3,8.777L3,7.277L17,7.277Z")
                                }
                                .namespace("http://www.w3.org/2000/svg")
                                .viewBox("0 0 20 16")
                            }
                            .type(.button)
                            .class("toolbar-tool")
                            .custom(key: "data-command", value: "strikethrough")
                            Span {
                                "Strikethrough"
                            }
                            .class("tooltip")
                        }
                        ListItem {
                            HTMLKit.Button {
                                Vector {
                                    Path {
                                        Title {
                                            "Link"
                                        }
                                    }
                                    .draw("M10.025,11.51C9.368,11.335 8.747,10.99 8.232,10.475L7.525,9.768C5.964,8.207 5.964,5.672 7.525,4.111L10.354,1.282C11.915,-0.279 14.449,-0.279 16.01,1.282L16.718,1.99C18.279,3.551 18.279,6.085 16.718,7.646L13.933,10.431C14.165,9.703 14.207,8.928 14.06,8.183L15.303,6.939C16.474,5.769 16.474,3.867 15.303,2.697C14.133,1.526 12.231,1.526 11.061,2.697L8.939,4.818C7.769,5.989 7.769,7.89 8.939,9.061C9.581,9.703 10.443,9.993 11.283,9.931C11.162,10.258 10.97,10.565 10.707,10.828L10.025,11.51ZM9.975,4.49C10.632,4.665 11.253,5.01 11.768,5.525L12.475,6.232C14.036,7.793 14.036,10.328 12.475,11.889L9.646,14.718C8.085,16.279 5.551,16.279 3.99,14.718L3.282,14.01C1.721,12.449 1.721,9.915 3.282,8.354L6.067,5.569C5.835,6.297 5.793,7.072 5.94,7.817L4.697,9.061C3.526,10.231 3.526,12.133 4.697,13.303C5.867,14.474 7.769,14.474 8.939,13.303L11.061,11.182C12.231,10.011 12.231,8.11 11.061,6.939C10.419,6.297 9.557,6.007 8.717,6.069C8.838,5.742 9.03,5.435 9.293,5.172L9.975,4.49Z")
                                }
                                .namespace("http://www.w3.org/2000/svg")
                                .viewBox("0 0 20 16")
                            }
                            .type(.button)
                            .class("toolbar-tool")
                            .custom(key: "data-command", value: "link")
                            Span {
                                "Link"
                            }
                            .class("tooltip")
                        }
                        ListItem {
                            HTMLKit.Button {
                                Vector {
                                    Path {
                                        Title {
                                            "Code"
                                        }
                                    }
                                    .draw("M11.829,2.171C11.57,1.848 11.623,1.376 11.946,1.117C12.269,0.859 12.741,0.911 13,1.234L17.546,7.532C17.765,7.805 17.765,8.195 17.546,8.469L13.171,14.883C12.913,15.206 12.44,15.259 12.117,15C11.794,14.741 11.741,14.269 12,13.946C12,13.946 16,8 16,8L11.829,2.171ZM8.288,13.946C8.547,14.269 8.495,14.741 8.171,15C7.848,15.259 7.376,15.206 7.117,14.883L2.454,8.469C2.235,8.195 2.235,7.805 2.454,7.532L6.946,1.351C7.204,1.028 7.677,0.976 8,1.234C8.323,1.493 8.376,1.965 8.117,2.288C8.117,2.288 4,8 4,8L8.288,13.946Z")
                                }
                                .namespace("http://www.w3.org/2000/svg")
                                .viewBox("0 0 20 16")
                            }
                            .type(.button)
                            .class("toolbar-tool")
                            .custom(key: "data-command", value: "code")
                            Span {
                                "Code"
                            }
                            .class("tooltip")
                        }
                    }
                }
                .class("toolbar-context")
                Menu {
                    ListItem {
                        HTMLKit.Button {
                            Vector {
                                Path {
                                    Title {
                                        "Bold"
                                    }
                                }
                                .draw("M4.25,14.25L4.25,1.75C4.25,1.336 4.586,1 5,1L10.769,1C12.646,1 14.212,2.659 14.212,4.75C14.212,5.686 13.898,6.785 13.383,7.438C14.746,7.929 15.75,9.576 15.75,11.25C15.75,13.341 14.184,15 12.308,15L5,15C4.586,15 4.25,14.664 4.25,14.25ZM10.769,2.5L5.75,2.5C5.75,2.5 5.75,7.25 5.75,7.25L10.769,7.25C11.865,7.25 12.712,5.971 12.712,4.75C12.712,3.529 11.865,2.5 10.769,2.5ZM14.25,11.25C14.25,10.029 13.403,8.75 12.308,8.75L5.75,8.75C5.75,8.75 5.75,13.5 5.75,13.5L12.308,13.5C13.403,13.5 14.25,12.471 14.25,11.25Z")
                            }
                            .namespace("http://www.w3.org/2000/svg")
                            .viewBox("0 0 20 16")
                        }
                        .type(.button)
                        .class("toolbar-tool")
                        .custom(key: "data-command", value: "bold")
                        Span {
                            "Bold"
                        }
                        .class("tooltip")
                    }
                    ListItem {
                        HTMLKit.Button {
                            Vector {
                                Path {
                                    Title {
                                        "Italic"
                                    }
                                }
                                .draw("M8.989,15L4,15C3.586,15 3.25,14.664 3.25,14.25C3.25,13.836 3.586,13.5 4,13.5L8.36,13.5L10.12,2.5L6,2.5C5.586,2.5 5.25,2.164 5.25,1.75C5.25,1.336 5.586,1 6,1C6,1 11.003,1 11.011,1L16,1C16.414,1 16.75,1.336 16.75,1.75C16.75,2.164 16.414,2.5 16,2.5L11.64,2.5L9.88,13.5L14,13.5C14.414,13.5 14.75,13.836 14.75,14.25C14.75,14.664 14.414,15 14,15C14,15 8.997,15 8.989,15Z")
                            }
                            .namespace("http://www.w3.org/2000/svg")
                            .viewBox("0 0 20 16")
                        }
                        .type(.button)
                        .class("toolbar-tool")
                        .custom(key: "data-command", value: "italic")
                        Span {
                            "Italic"
                        }
                        .class("tooltip")
                    }
                    ListItem {
                        HTMLKit.Button {
                            Vector {
                                Path {
                                    Title {
                                        "Strikethrough"
                                    }
                                }
                                .draw("M6.068,7C5.894,6.829 5.745,6.646 5.621,6.45C5.305,5.95 5.148,5.39 5.148,4.771C5.148,4.09 5.341,3.454 5.727,2.862C6.113,2.27 6.678,1.821 7.42,1.514C8.162,1.208 8.987,1.054 9.894,1.054C10.894,1.054 11.775,1.215 12.539,1.537C13.302,1.859 13.89,2.333 14.301,2.959C14.711,3.584 14.932,4.292 14.963,5.083L13.252,5.212C13.16,4.36 12.849,3.716 12.318,3.28C11.788,2.845 11.004,2.627 9.968,2.627C8.888,2.627 8.102,2.825 7.608,3.221C7.115,3.616 6.868,4.093 6.868,4.651C6.868,5.136 7.043,5.534 7.392,5.847C7.736,6.16 8.632,6.48 10.083,6.808C10.373,6.874 10.644,6.938 10.898,7L6.068,7ZM14.776,9C14.787,9.014 14.797,9.029 14.806,9.044C15.181,9.599 15.368,10.238 15.368,10.962C15.368,11.679 15.162,12.355 14.751,12.99C14.34,13.625 13.75,14.118 12.98,14.471C12.211,14.824 11.345,15 10.382,15C9.161,15 8.139,14.822 7.314,14.466C6.489,14.111 5.842,13.576 5.373,12.861C4.904,12.147 4.657,11.339 4.632,10.437L6.316,10.29C6.396,10.965 6.581,11.518 6.872,11.951C7.164,12.383 7.616,12.732 8.229,12.999C8.842,13.266 9.532,13.399 10.299,13.399C10.98,13.399 11.581,13.298 12.102,13.096C12.623,12.893 13.011,12.616 13.266,12.263C13.52,11.911 13.647,11.526 13.647,11.109C13.647,10.686 13.525,10.316 13.279,10C13.034,9.685 12.629,9.419 12.065,9.205C11.922,9.149 11.709,9.081 11.428,9L14.776,9ZM17,7.277L17,8.777L3,8.777L3,7.277L17,7.277Z")
                            }
                            .namespace("http://www.w3.org/2000/svg")
                            .viewBox("0 0 20 16")
                        }
                        .type(.button)
                        .class("toolbar-tool")
                        .custom(key: "data-command", value: "strikethrough")
                        Span {
                            "Strikethrough"
                        }
                        .class("tooltip")
                    }
                    ListItem {
                        HTMLKit.Button {
                            Vector {
                                Path {
                                    Title {
                                        "Link"
                                    }
                                }
                                .draw("M10.025,11.51C9.368,11.335 8.747,10.99 8.232,10.475L7.525,9.768C5.964,8.207 5.964,5.672 7.525,4.111L10.354,1.282C11.915,-0.279 14.449,-0.279 16.01,1.282L16.718,1.99C18.279,3.551 18.279,6.085 16.718,7.646L13.933,10.431C14.165,9.703 14.207,8.928 14.06,8.183L15.303,6.939C16.474,5.769 16.474,3.867 15.303,2.697C14.133,1.526 12.231,1.526 11.061,2.697L8.939,4.818C7.769,5.989 7.769,7.89 8.939,9.061C9.581,9.703 10.443,9.993 11.283,9.931C11.162,10.258 10.97,10.565 10.707,10.828L10.025,11.51ZM9.975,4.49C10.632,4.665 11.253,5.01 11.768,5.525L12.475,6.232C14.036,7.793 14.036,10.328 12.475,11.889L9.646,14.718C8.085,16.279 5.551,16.279 3.99,14.718L3.282,14.01C1.721,12.449 1.721,9.915 3.282,8.354L6.067,5.569C5.835,6.297 5.793,7.072 5.94,7.817L4.697,9.061C3.526,10.231 3.526,12.133 4.697,13.303C5.867,14.474 7.769,14.474 8.939,13.303L11.061,11.182C12.231,10.011 12.231,8.11 11.061,6.939C10.419,6.297 9.557,6.007 8.717,6.069C8.838,5.742 9.03,5.435 9.293,5.172L9.975,4.49Z")
                            }
                            .namespace("http://www.w3.org/2000/svg")
                            .viewBox("0 0 20 16")
                        }
                        .type(.button)
                        .class("toolbar-tool")
                        .custom(key: "data-command", value: "link")
                        Span {
                            "Link"
                        }
                        .class("tooltip")
                    }
                    ListItem {
                        HTMLKit.Button {
                            Vector {
                                Path {
                                    Title {
                                        "Code"
                                    }
                                }
                                .draw("M11.829,2.171C11.57,1.848 11.623,1.376 11.946,1.117C12.269,0.859 12.741,0.911 13,1.234L17.546,7.532C17.765,7.805 17.765,8.195 17.546,8.469L13.171,14.883C12.913,15.206 12.44,15.259 12.117,15C11.794,14.741 11.741,14.269 12,13.946C12,13.946 16,8 16,8L11.829,2.171ZM8.288,13.946C8.547,14.269 8.495,14.741 8.171,15C7.848,15.259 7.376,15.206 7.117,14.883L2.454,8.469C2.235,8.195 2.235,7.805 2.454,7.532L6.946,1.351C7.204,1.028 7.677,0.976 8,1.234C8.323,1.493 8.376,1.965 8.117,2.288C8.117,2.288 4,8 4,8L8.288,13.946Z")
                            }
                            .namespace("http://www.w3.org/2000/svg")
                            .viewBox("0 0 20 16")
                        }
                        .type(.button)
                        .class("toolbar-tool")
                        .custom(key: "data-command", value: "code")
                        Span {
                            "Code"
                        }
                        .class("tooltip")
                    }
                }
                .class("textpad-action")
                Menu {
                    ListItem {
                        HTMLKit.Button {
                            Vector {
                                Path {
                                    Title {
                                        "Undo"
                                    }
                                }
                                .draw("M5.825,6.444L9.783,9.009C10.13,9.234 10.23,9.699 10.004,10.046C9.779,10.394 9.314,10.493 8.967,10.268L2.967,6.379C2.755,6.242 2.627,6.007 2.625,5.755C2.623,5.502 2.749,5.266 2.959,5.126L8.959,1.126C9.303,0.896 9.769,0.99 9.999,1.334C10.229,1.678 10.135,2.144 9.791,2.374L5.936,4.944L12.375,4.944C15.135,4.944 17.375,7.185 17.375,9.944C17.375,12.704 15.135,14.944 12.375,14.944L10.142,14.944C9.939,14.944 9.743,14.863 9.6,14.719C9.456,14.576 9.375,14.38 9.375,14.177C9.375,13.982 9.452,13.796 9.589,13.659C9.727,13.521 9.913,13.444 10.107,13.444L12.375,13.444C14.307,13.444 15.875,11.876 15.875,9.944C15.875,8.012 14.307,6.444 12.375,6.444L5.825,6.444Z")
                            }
                            .namespace("http://www.w3.org/2000/svg")
                            .viewBox("0 0 20 16")
                        }
                        .type(.button)
                        .class("toolbar-tool state:disabled")
                        .custom(key: "data-command", value: "undo")
                        Span {
                            "Undo"
                        }
                        .class("tooltip")
                    }
                    ListItem {
                        HTMLKit.Button {
                            Vector {
                                Path {
                                    Title {
                                        "Redo"
                                    }
                                }
                                .draw("M14.175,6.444L10.217,9.009C9.87,9.234 9.77,9.699 9.996,10.046C10.221,10.394 10.686,10.493 11.033,10.268L17.033,6.379C17.245,6.242 17.373,6.007 17.375,5.755C17.377,5.502 17.251,5.266 17.041,5.126L11.041,1.126C10.697,0.896 10.231,0.99 10.001,1.334C9.771,1.678 9.865,2.144 10.209,2.374L14.064,4.944L7.625,4.944C4.865,4.944 2.625,7.185 2.625,9.944C2.625,12.704 4.865,14.944 7.625,14.944L9.858,14.944C10.061,14.944 10.257,14.863 10.4,14.719C10.544,14.576 10.625,14.38 10.625,14.177C10.625,13.982 10.548,13.796 10.411,13.659C10.273,13.521 10.087,13.444 9.893,13.444L7.625,13.444C5.693,13.444 4.125,11.876 4.125,9.944C4.125,8.012 5.693,6.444 7.625,6.444L14.175,6.444Z")
                            }
                            .namespace("http://www.w3.org/2000/svg")
                            .viewBox("0 0 20 16")
                        }
                        .type(.button)
                        .class("toolbar-tool state:disabled")
                        .custom(key: "data-command", value: "redo")
                        Span {
                            "Redo"
                        }
                        .class("tooltip")
                    }
                }
                .class("textpad-revision")
            }
            .class("textpad-toolbar")
            TextArea {
                content
            }
            .name(name)
            .rows(rows)
            .class("textpad-content")
            .modify(unwrap: prompt) {
                $0.placeholder($1)
            }
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    /// Sets the limit of the maximum lines.
    public func lineLimit(_ value: Int) -> TextPad {

        var newSelf = self
        newSelf.rows = value
        
        return newSelf
    }
    
    public func tag(_ value: String) -> TextPad {
        return self.mutate(id: value)
    }
}

extension TextPad: InputModifier {
    
    public func disabled(_ condition: Bool) -> TextPad {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> TextPad {
        return self.mutate(focuscolor: color.value)
    }
}

extension TextPad: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> TextPad {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> TextPad {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> TextPad {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> TextPad {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> TextPad {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> TextPad {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> TextPad {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> TextPad {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> TextPad {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> TextPad {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> TextPad {
        return self.mutate(margin: length.value, insets: insets)
    }
}
