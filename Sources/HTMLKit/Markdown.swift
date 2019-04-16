//
//  Markdown.swift
//  HTMLKit
//
//  Created by Mats Mollestad on 16/04/2019.
//

import SwiftMarkdown

/// A compiled template that converts markdown to html
struct Markdown: CompiledTemplate {

    /// The markdown to convert
    let markdown: CompiledTemplate

    /// The rendering options
    let options: MarkdownOptions

    // View `Brewable`
    func brew<T>(_ formula: HTMLRenderer.Formula<T>) throws where T : ContextualTemplate {
        formula.add(mappable: self)
    }

    // View `CompiledTemplate`
    func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return try markdownToHTML(markdown.render(with: manager), options: options)
    }
}

extension ContextualTemplate {

    /// Convert markdown to HTML
    ///
    /// - Parameters:
    ///   - content: The content to convert to markdown
    ///   - options: The options when rendering the markdown. Default = [.safe]
    /// - Returns: A compiled tamplate of the markdown
    public func markdown(_ content: CompiledTemplate..., options: MarkdownOptions = [.safe, .normalize]) -> CompiledTemplate {
        return Markdown(markdown: content, options: options)
    }
}

