import HTMLKit
import HTMLKitVaporProvider

public enum SimpleTemplate {
    
    public struct IndexView: View {
        
        @TemplateValue(IndexContext.self)
        public var context
        
        public var body: AnyContent {
            SimplePage {
                Heading1 {
                    context.title
                }
            }
        }
    }
    
    public struct CreateView: View {
        
        @TemplateValue(CreateContext.self)
        public var context
        
        public var body: AnyContent {
            SimplePage {
                Heading1 {
                    context.title
                }
            }
        }
    }
}
