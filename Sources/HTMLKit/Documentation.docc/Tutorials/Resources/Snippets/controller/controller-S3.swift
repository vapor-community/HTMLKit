import HTMLKitVapor
import Vapor

class ExampleController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("example") { routes in
            routes.get("index", use: self.getIndex)
        }
    }
    
    func getIndex(_ req: Request) -> View {
    }
}
