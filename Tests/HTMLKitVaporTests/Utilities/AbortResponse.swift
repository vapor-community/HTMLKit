import Vapor

struct AbortResponse: Vapor.Content {
    
    var reason: String
}
