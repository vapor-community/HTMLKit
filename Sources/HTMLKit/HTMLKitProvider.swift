//
//  HTMLTemplateConfig.swift
//  HTMLKit
//
//  Created by Mats Mollestad on 11/03/2019.
//

import Service

extension HTMLRenderer: Service {}

/// A provider for the HTMLKit Library
public final class HTMLKitProvider: Provider {

    public init() {}

    public func register(_ services: inout Services) throws {
        services.register { (container) in
            return try container.make(HTMLRenderer.self)
        }
    }

    public func didBoot(_ container: Container) throws -> EventLoopFuture<Void> {
        return .done(on: container)
    }
}
