import Vapor
import HTMLKit

// [/simple]
final class SimpleController {
    
    // [/index]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        let context = IndexContext(title: "Index")
        
        return IndexView().render(with: context, for: request)
    }
}
