import Vapor

// [/simple]
final class SimpleController {
    
    // [/index]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        return SimpleTemplate.IndexView()
            .render(with: IndexContext(title: "Index"), for: request)
    }
    
    // [/create]
    func getCreate(_ request: Request) throws -> EventLoopFuture<View> {
        
        return SimpleTemplate.CreateView()
            .render(with: CreateContext(title: "Create"), for: request)
    }
    
    // [/create/:model]
    func postCreate(_ request: Request) throws -> EventLoopFuture<Response> {
        return request.redirect(to: "/simple/index")
    }
}
