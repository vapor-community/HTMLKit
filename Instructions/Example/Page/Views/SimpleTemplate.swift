import HTMLKit

public enum SimpleTemplate {
    
    public struct IndexView: View {
        
        public var context: TemplateValue<IndexContext>
        
        public var body: AnyContent {
            SimplePage {
                Heading1 {
                    context.title
                }
            }
        }
    }
    
    public struct CreateView: View {
        
        public var context: TemplateValue<CreateContext>
        
        public var body: AnyContent {
            SimplePage {
                Heading1 {
                    context.title
                }
            }
        }
    }
}
