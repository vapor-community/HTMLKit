import HTMLKitVapor
import Vapor

func configure(_ app: Application) throws {

    app.htmlkit.localization.set(source: currentDirectory)

    app.htmlkit.localization.set(locale: .english)

    try routes(app)
}
