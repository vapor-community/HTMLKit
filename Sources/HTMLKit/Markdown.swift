//
//  Markdown.swift
//  HTMLKit
//
//  Created by Mats Mollestad on 16/04/2019.
//

import SwiftMarkdown

/// A compiled template that converts markdown to html
public struct Markdown: View {

    /// The markdown to convert
    let markdown: View

    /// The rendering options
    let options: MarkdownOptions

    public init(options: MarkdownOptions = [.safe, .normalize], @HTMLBuilder content: () -> View) {
        self.options = options
        self.markdown = content()
    }

    // View `Brewable`
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(mappable: self)
    }

    // View `CompiledTemplate`
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return try markdownToHTML(markdown.render(with: manager), options: options)
    }
}

//extension ContextualTemplate {
//
//    /// Convert markdown to HTML
//    ///
//    /// - Parameters:
//    ///   - content: The content to convert to markdown
//    ///   - options: The options when rendering the markdown. Default = [.safe]
//    /// - Returns: A compiled tamplate of the markdown
//    public func markdown(_ content: View..., options: MarkdownOptions = [.safe, .normalize]) -> View {
//        return Markdown(markdown: content, options: options)
//    }
//}

