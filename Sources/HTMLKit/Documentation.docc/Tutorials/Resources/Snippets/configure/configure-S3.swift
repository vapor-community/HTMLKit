import HTMLKitVapor
import Vapor

func configure(_ app: Application) throws {

    app.htmlkit.localization.set(source: currentDirectory)

    try routes(app)
}
