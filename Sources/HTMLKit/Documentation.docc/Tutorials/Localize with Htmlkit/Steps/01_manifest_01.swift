import HTMLKitVapor
import Vapor

public func configure(_ app: Application) throws {

    app.htmlkit.localization.set(source: currentDirectory)

    try routes(app)
}
