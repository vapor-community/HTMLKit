import HTMLKitVapor
import Vapor

public class ExampleController {
    
    public getIndex(_ req: Request) -> View {
    }
}

extension ExampleController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("example") { routes in
            routes.get("index", use: self.getIndex)
        }
    }
}
