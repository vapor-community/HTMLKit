import HTMLKit
import Vapor

public class VaporRenderer {
    
    private var renderer: HTMLKit.Renderer {
        return .init()
    }
    
    public var eventLoop: EventLoop
    
    public var cache: VaporCache
    
    public init(eventLoop: EventLoop, cache: VaporCache) {
        self.eventLoop = eventLoop
        self.cache = cache
    }
    
    public func retrieve(name: String) -> EventLoopFuture<HTMLKit.Renderer.Formula?> {
        
        if let formula = self.cache.get(name: name) {
            return self.eventLoop.makeSucceededFuture(formula)
        }
        
        return self.eventLoop.makeSucceededFuture(nil)
    }
    
    public func render(name: String) -> EventLoopFuture<ByteBuffer> {
        
        return self.retrieve(name: name).map { formula in
            
            var buffer = ByteBufferAllocator().buffer(capacity: 4096)
            
            if let formula = formula {
                
                for ingredient in formula.ingredient {
                    
                    if let string = ingredient as? String {
                        buffer.writeString(string)
                    }
                }
            }
            
            return buffer
        }
    }
    
    public func add<T: HTMLKit.Page>(page: T) {
        
        let formula = HTMLKit.Renderer.Formula()
        
        try? page.prerender(formula)
        
        self.cache.upsert(name: String(describing: type(of: page)), formula: formula)
    }
    
    public func add<T: HTMLKit.View>(view: T) {
        
        let formula = HTMLKit.Renderer.Formula()
        
        try? view.prerender(formula)
        
        self.cache.upsert(name: String(describing: type(of: view)), formula: formula)
    }
}

extension VaporRenderer: ViewRenderer {
    
    public func `for`(_ request: Request) -> ViewRenderer {
        return request.htmlkit
    }
    
    public func render<E:Encodable>(_ name: String, _ context: E) -> EventLoopFuture<Vapor.View> {
        return self.render(name: name).map { buffer in
            return View(data: buffer)
        }
    }
}
