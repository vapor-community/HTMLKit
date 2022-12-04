/*
 Abstract:
 The file contains the environment modifier.
 */

/// The modifier
public struct EnvironmentModifier: Content {

    public let view: Content
    
    public let locale: TemplateValue<String>
}
