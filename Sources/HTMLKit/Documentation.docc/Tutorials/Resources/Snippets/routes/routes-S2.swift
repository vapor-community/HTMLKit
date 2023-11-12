import Vapor

func routes(_ app: Application) throws {
    
    try app.register(collection: ExampleController())
}
