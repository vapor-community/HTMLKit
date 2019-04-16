//
//  Markdown.swift
//  HTMLKit
//
//  Created by Mats Mollestad on 16/04/2019.
//

#if canImport(SwiftMarkdown)
extension ContextualTemplate {

    /// Convert markdown to HTML
    ///
    ///
    public func markdown(_ content: CompiledTemplate..., options: MarkdownOptions = [.safe]) throws -> CompiledTemplate {
        return try content.map {
            if $0 is String {
                return try markdownToHTML($0, options: options)
            } else {
                return $0
            }
        }
    }
}
#endif
