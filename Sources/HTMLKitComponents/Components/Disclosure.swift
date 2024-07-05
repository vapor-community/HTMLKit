/*
 Abstract:
 The file contains a disclosure component.
 */

import HTMLKit

/// A component that distinguish content.
public struct Disclosure: View, Modifiable {
    
    internal let label: String
    
    internal let content: [Content]
    
    /// The classes of the content.
    internal var classes: [String]
    
    /// Creates a card.
    public init(_ label: String, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.label = label
        self.content = content()
        self.classes = ["disclosure"]
    }
    
    public var body: Content {
        Division {
            Division {
                Paragraph {
                    label
                }
                .class("disclosure-label")
                Vector {
                    Path {
                        Title {
                            "state indicator"
                        }
                    }
                    .draw("M7.28,2.241C6.987,1.957 6.987,1.497 7.28,1.213C7.573,0.929 8.048,0.929 8.341,1.213L14.811,7.486C15.103,7.77 15.103,8.23 14.811,8.514L8.28,14.787C7.987,15.071 7.512,15.071 7.22,14.787C6.927,14.503 6.927,14.043 7.22,13.759L13.22,8L7.28,2.241Z")
                }
                .viewBox("0 0 20 16")
                .namespace("http://www.w3.org/2000/svg")
                .class("state-indicator")
            }
            .class("disclosure-head")
            Division {
                Division {
                    content
                }
                .class("disclosure-content")
            }
            .class("disclosure-body")
        }
        .class(classes.joined(separator: " "))
    }
}
