/*
 Abstract:
 The file contains the protocols for the aria html-attributes.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

public typealias GlobalAriaAttributes = AriaAtomicAttribute & AriaBusyAttribute & AriaControlsAttribute & AriaCurrentAttribute & AriaDescribedAttribute & AriaDetailsAttribute & AriaDisabledAttribute & AriaErrorMessageAttribute & AriaFlowToAttribute & AriaPopupAttribute & AriaHiddenAttribute & AriaInvalidAttribute & AriaShortcutsAttribute & AriaLabelAttribute & AriaLabeledAttribute & AriaLiveAttribute & AriaOwnsAttribute & AriaRelevantAttribute & AriaRoleDescriptionAttribute

/// The protocol provides the element with accessibility handler.
public protocol AriaActiveDescendantAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-activedescendant'.
    ///
    /// ```html
    /// <tag aria-activedescendant="" />
    /// ```
    func aria(activeDescendant value: String) -> Self
    
    /// The function represents the html-attribute 'aria-activedescendant'.
    ///
    /// ```html
    /// <tag aria-activedescendant="" />
    /// ```
    func aria(activeDescendant value: Property<String>) -> Self
}

extension AriaActiveDescendantAttribute where Self: ContentElement {
    
    internal func mutate(ariaactivedescendant value: String) -> Self {
        return self.mutate(key: "aria-activedescendant", value: value)
    }
    
    internal func mutate(ariaactivedescendant value: Property<String>) -> Self {
        return self.mutate(key: "aria-activedescendant", value: value)
    }
}

extension AriaActiveDescendantAttribute where Self: EmptyElement {
    
    internal func mutate(ariaactivedescendant value: String) -> Self {
        return self.mutate(key: "aria-activedescendant", value: value)
    }
    
    internal func mutate(ariaactivedescendant value: Property<String>) -> Self {
        return self.mutate(key: "aria-activedescendant", value: value)
    }
}


/// The protocol provides the element with accessibility handler.
public protocol AriaAtomicAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-atomic'.
    ///
    /// ```html
    /// <tag aria-atomic="" />
    /// ```
    func aria(atomic value: Bool) -> Self
    
    /// The function represents the html-attribute 'aria-atomic'.
    ///
    /// ```html
    /// <tag aria-atomic="" />
    /// ```
    func aria(atomic value: Property<Bool>) -> Self
}

extension AriaAtomicAttribute where Self: ContentElement {
    
    internal func mutate(ariaatomic value: Bool) -> Self {
        return self.mutate(key: "aria-atomic", value: value)
    }
    
    internal func mutate(ariaatomic value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-atomic", value: value)
    }
}

extension AriaAtomicAttribute where Self: EmptyElement {
    
    internal func mutate(ariaatomic value: Bool) -> Self {
        return self.mutate(key: "aria-atomic", value: value)
    }
    
    internal func mutate(ariaatomic value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-atomic", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaAutoCompleteAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-autocomplete'.
    ///
    /// ```html
    /// <tag aria-autocomplete="" />
    /// ```
    func aria(autoComplete value: Values.Accessibility.Complete) -> Self
}

extension AriaAutoCompleteAttribute where Self: ContentElement {
    
    internal func mutate(ariaautocomplete value: String) -> Self {
        return self.mutate(key: "aria-autocomplete", value: value)
    }
}

extension AriaAutoCompleteAttribute where Self: EmptyElement {
    
    internal func mutate(ariaautocomplete value: String) -> Self {
        return self.mutate(key: "aria-autocomplete", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaBusyAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-busy'.
    ///
    /// ```html
    /// <tag aria-busy="" />
    /// ```
    func aria(busy value: Bool) -> Self
    
    /// The function represents the html-attribute 'aria-busy'.
    ///
    /// ```html
    /// <tag aria-busy="" />
    /// ```
    func aria(busy value: Property<Bool>) -> Self
}

extension AriaBusyAttribute where Self: ContentElement {
    
    internal func mutate(ariabusy value: Bool) -> Self {
        return self.mutate(key: "aria-busy", value: value)
    }
    
    internal func mutate(ariabusy value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-busy", value: value)
    }
}

extension AriaBusyAttribute where Self: EmptyElement {
    
    internal func mutate(ariabusy value: Bool) -> Self {
        return self.mutate(key: "aria-busy", value: value)
    }
    
    internal func mutate(ariabusy value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-busy", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaCheckedAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-checked'.
    ///
    /// ```html
    /// <tag aria-checked="" />
    /// ```
    func aria(checked value: Values.Accessibility.Check) -> Self
}

extension AriaCheckedAttribute where Self: ContentElement {
    
    internal func mutate(ariachecked value: String) -> Self {
        return self.mutate(key: "aria-checked", value: value)
    }
}

extension AriaCheckedAttribute where Self: EmptyElement {
    
    internal func mutate(ariachecked value: String) -> Self {
        return self.mutate(key: "aria-checked", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaColumnCountAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-colcount'.
    ///
    /// ```html
    /// <tag aria-colcount="" />
    /// ```
    func aria(columnCount value: Int) -> Self
    
    /// The function represents the html-attribute 'aria-colcount'.
    ///
    /// ```html
    /// <tag aria-colcount="" />
    /// ```
    func aria(columnCount value: Property<Int>) -> Self
}

extension AriaColumnCountAttribute where Self: ContentElement {
    
    internal func mutate(ariacolcount value: Int) -> Self {
        return self.mutate(key: "aria-colcount", value: value)
    }
    
    internal func mutate(ariacolcount value: Property<Int>) -> Self {
        return self.mutate(key: "aria-colcount", value: value)
    }
}

extension AriaColumnCountAttribute where Self: EmptyElement {
    
    internal func mutate(ariacolcount value: Int) -> Self {
        return self.mutate(key: "aria-colcount", value: value)
    }
    
    internal func mutate(ariacolcount value: Property<Int>) -> Self {
        return self.mutate(key: "aria-colcount", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaColumnIndexAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-colindex'.
    ///
    /// ```html
    /// <tag aria-colindex="" />
    /// ```
    func aria(columnIndex value: Int) -> Self
    
    /// The function represents the html-attribute 'aria-colindex'.
    ///
    /// ```html
    /// <tag aria-colindex="" />
    /// ```
    func aria(columnIndex value: Property<Int>) -> Self
}

extension AriaColumnIndexAttribute where Self: ContentElement {
    
    internal func mutate(ariacolindex value: Int) -> Self {
        return self.mutate(key: "aria-colindex", value: value)
    }
    
    internal func mutate(ariacolindex value: Property<Int>) -> Self {
        return self.mutate(key: "aria-colindex", value: value)
    }
}

extension AriaColumnIndexAttribute where Self: EmptyElement {
    
    internal func mutate(ariacolindex value: Int) -> Self {
        return self.mutate(key: "aria-colindex", value: value)
    }
    
    internal func mutate(ariacolindex value: Property<Int>) -> Self {
        return self.mutate(key: "aria-colindex", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaColumnSpanAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-colspan'.
    ///
    /// ```html
    /// <tag aria-colspan="" />
    /// ```
    func aria(columnSpan value: Int) -> Self
    
    /// The function represents the html-attribute 'aria-colspan'.
    ///
    /// ```html
    /// <tag aria-colspan="" />
    /// ```
    func aria(columnSpan value: Property<Int>) -> Self
}

extension AriaColumnSpanAttribute where Self: ContentElement {
    
    internal func mutate(ariacolspan value: Int) -> Self {
        return self.mutate(key: "aria-colspan", value: value)
    }
    
    internal func mutate(ariacolspan value: Property<Int>) -> Self {
        return self.mutate(key: "aria-colspan", value: value)
    }
}

extension AriaColumnSpanAttribute where Self: EmptyElement {
    
    internal func mutate(ariacolspan value: Int) -> Self {
        return self.mutate(key: "aria-colspan", value: value)
    }
    
    internal func mutate(ariacolspan value: Property<Int>) -> Self {
        return self.mutate(key: "aria-colspan", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaControlsAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-controls'.
    ///
    /// ```html
    /// <tag aria-controls="" />
    /// ```
    func aria(controls value: String) -> Self
    
    /// The function represents the html-attribute 'aria-controls'.
    ///
    /// ```html
    /// <tag aria-controls="" />
    /// ```
    func aria(controls value: Property<String>) -> Self
}

extension AriaControlsAttribute where Self: ContentElement {
    
    internal func mutate(ariacontrols value: String) -> Self {
        return self.mutate(key: "aria-controls", value: value)
    }
    
    internal func mutate(ariacontrols value: Property<String>) -> Self {
        return self.mutate(key: "aria-controls", value: value)
    }
}

extension AriaControlsAttribute where Self: EmptyElement {
    
    internal func mutate(ariacontrols value: String) -> Self {
        return self.mutate(key: "aria-controls", value: value)
    }
    
    internal func mutate(ariacontrols value: Property<String>) -> Self {
        return self.mutate(key: "aria-controls", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaCurrentAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-current'.
    ///
    /// ```html
    /// <tag aria-current="" />
    /// ```
    func aria(current value: Values.Accessibility.Current) -> Self
}

extension AriaCurrentAttribute where Self: ContentElement {
    
    internal func mutate(ariacurrent value: String) -> Self {
        return self.mutate(key: "aria-current", value: value)
    }
}

extension AriaCurrentAttribute where Self: EmptyElement {
    
    internal func mutate(ariacurrent value: String) -> Self {
        return self.mutate(key: "aria-current", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaDescribedAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-describedby'.
    ///
    /// ```html
    /// <tag aria-describedby="" />
    /// ```
    func aria(describedBy value: String) -> Self
    
    /// The function represents the html-attribute 'aria-describedby'.
    ///
    /// ```html
    /// <tag aria-describedby="" />
    /// ```
    func aria(describedBy value: Property<String>) -> Self
}

extension AriaDescribedAttribute where Self: ContentElement {
    
    internal func mutate(ariadescribedby value: String) -> Self {
        return self.mutate(key: "aria-describedby", value: value)
    }
    
    internal func mutate(ariadescribedby value: Property<String>) -> Self {
        return self.mutate(key: "aria-describedby", value: value)
    }
}

extension AriaDescribedAttribute where Self: EmptyElement {
    
    internal func mutate(ariadescribedby value: String) -> Self {
        return self.mutate(key: "aria-describedby", value: value)
    }
    
    internal func mutate(ariadescribedby value: Property<String>) -> Self {
        return self.mutate(key: "aria-describedby", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaDetailsAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-details'.
    ///
    /// ```html
    /// <tag aria-details="" />
    /// ```
    func aria(details value: String) -> Self
    
    /// The function represents the html-attribute 'aria-details'.
    ///
    /// ```html
    /// <tag aria-details="" />
    /// ```
    func aria(details value: Property<String>) -> Self
}

extension AriaDetailsAttribute where Self: ContentElement {
    
    internal func mutate(ariadetails value: String) -> Self {
        return self.mutate(key: "aria-details", value: value)
    }
    
    internal func mutate(ariadetails value: Property<String>) -> Self {
        return self.mutate(key: "aria-details", value: value)
    }
}

extension AriaDetailsAttribute where Self: EmptyElement {
    
    internal func mutate(ariadetails value: String) -> Self {
        return self.mutate(key: "aria-details", value: value)
    }
    
    internal func mutate(ariadetails value: Property<String>) -> Self {
        return self.mutate(key: "aria-details", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaDisabledAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-disabled'.
    ///
    /// ```html
    /// <tag aria-disabled="" />
    /// ```
    func aria(disabled value: Bool) -> Self
    
    /// The function represents the html-attribute 'aria-disabled'.
    ///
    /// ```html
    /// <tag aria-disabled="" />
    /// ```
    func aria(disabled value: Property<Bool>) -> Self
}

extension AriaDisabledAttribute where Self: ContentElement {
    
    internal func mutate(ariadisabled value: Bool) -> Self {
        return self.mutate(key: "aria-disabled", value: value)
    }
    
    internal func mutate(ariadisabled value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-disabled", value: value)
    }
}

extension AriaDisabledAttribute where Self: EmptyElement {
    
    internal func mutate(ariadisabled value: Bool) -> Self {
        return self.mutate(key: "aria-disabled", value: value)
    }
    
    internal func mutate(ariadisabled value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-disabled", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaErrorMessageAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-errormessage'.
    ///
    /// ```html
    /// <tag aria-errormessage="" />
    /// ```
    func aria(errorMessage value: String) -> Self
    
    /// The function represents the html-attribute 'aria-errormessage'.
    ///
    /// ```html
    /// <tag aria-errormessage="" />
    /// ```
    func aria(errorMessage value: Property<String>) -> Self
}

extension AriaErrorMessageAttribute where Self: ContentElement {
    
    internal func mutate(ariaerrormessage value: String) -> Self {
        return self.mutate(key: "aria-errormessage", value: value)
    }
    
    internal func mutate(ariaerrormessage value: Property<String>) -> Self {
        return self.mutate(key: "aria-errormessage", value: value)
    }
}

extension AriaErrorMessageAttribute where Self: EmptyElement {
    
    internal func mutate(ariaerrormessage value: String) -> Self {
        return self.mutate(key: "aria-errormessage", value: value)
    }
    
    internal func mutate(ariaerrormessage value: Property<String>) -> Self {
        return self.mutate(key: "aria-errormessage", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaExpandedAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-expanded'.
    ///
    /// ```html
    /// <tag aria-expanded="" />
    /// ```
    func aria(expanded value: Bool) -> Self
    
    /// The function represents the html-attribute 'aria-expanded'.
    ///
    /// ```html
    /// <tag aria-expanded="" />
    /// ```
    func aria(expanded value: Property<Bool>) -> Self
}

extension AriaExpandedAttribute where Self: ContentElement {
    
    internal func mutate(ariaexpanded value: Bool) -> Self {
        return self.mutate(key: "aria-expanded", value: value)
    }
    
    internal func mutate(ariaexpanded value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-expanded", value: value)
    }
}

extension AriaExpandedAttribute where Self: EmptyElement {
    
    internal func mutate(ariaexpanded value: Bool) -> Self {
        return self.mutate(key: "aria-expanded", value: value)
    }
    
    internal func mutate(ariaexpanded value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-expanded", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaFlowToAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-flowto'.
    ///
    /// ```html
    /// <tag aria-flowto="" />
    /// ```
    func aria(flowTo value: String) -> Self
    
    /// The function represents the html-attribute 'aria-flowto'.
    ///
    /// ```html
    /// <tag aria-flowto="" />
    /// ```
    func aria(flowTo value: Property<String>) -> Self
}

extension AriaFlowToAttribute where Self: ContentElement {
    
    internal func mutate(ariaflowto value: String) -> Self {
        return self.mutate(key: "aria-flowto", value: value)
    }
    
    internal func mutate(ariaflowto value: Property<String>) -> Self {
        return self.mutate(key: "aria-flowto", value: value)
    }
}

extension AriaFlowToAttribute where Self: EmptyElement {
    
    internal func mutate(ariaflowto value: String) -> Self {
        return self.mutate(key: "aria-flowto", value: value)
    }
    
    internal func mutate(ariaflowto value: Property<String>) -> Self {
        return self.mutate(key: "aria-flowto", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaPopupAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-haspopup'.
    ///
    /// ```html
    /// <tag aria-haspopup="" />
    /// ```
    func aria(hasPopup value: Values.Accessibility.Popup) -> Self
}

extension AriaPopupAttribute where Self: ContentElement {
    
    internal func mutate(ariahaspopup value: String) -> Self {
        return self.mutate(key: "aria-haspopup", value: value)
    }
}

extension AriaPopupAttribute where Self: EmptyElement {
    
    internal func mutate(ariahaspopup value: String) -> Self {
        return self.mutate(key: "aria-haspopup", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaHiddenAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-hidden'.
    ///
    /// ```html
    /// <tag aria-hidden="" />
    /// ```
    func aria(hidden value: Bool) -> Self
    
    /// The function represents the html-attribute 'aria-hidden'.
    ///
    /// ```html
    /// <tag aria-hidden="" />
    /// ```
    func aria(hidden value: Property<Bool>) -> Self
}

extension AriaHiddenAttribute where Self: ContentElement {
    
    internal func mutate(ariahidden value: Bool) -> Self {
        return self.mutate(key: "aria-hidden", value: value)
    }
    
    internal func mutate(ariahidden value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-hidden", value: value)
    }
}

extension AriaHiddenAttribute where Self: EmptyElement {
    
    internal func mutate(ariahidden value: Bool) -> Self {
        return self.mutate(key: "aria-hidden", value: value)
    }
    
    internal func mutate(ariahidden value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-hidden", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaInvalidAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-invalid'.
    ///
    /// ```html
    /// <tag aria-invalid="" />
    /// ```
    func aria(invalid value: Values.Accessibility.Invalid) -> Self
}

extension AriaInvalidAttribute where Self: ContentElement {
    
    internal func mutate(ariainvalid value: String) -> Self {
        return self.mutate(key: "aria-invalid", value: value)
    }
}

extension AriaInvalidAttribute where Self: EmptyElement {
    
    internal func mutate(ariainvalid value: String) -> Self {
        return self.mutate(key: "aria-invalid", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaShortcutsAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-keyshortcuts'.
    ///
    /// ```html
    /// <tag aria-keyshortcuts="" />
    /// ```
    func aria(keyShortcuts value: String) -> Self
    
    /// The function represents the html-attribute 'aria-keyshortcuts'.
    ///
    /// ```html
    /// <tag aria-keyshortcuts="" />
    /// ```
    func aria(keyShortcuts value: Property<String>) -> Self
}

extension AriaShortcutsAttribute where Self: ContentElement {
    
    internal func mutate(ariakeyshortcuts value: String) -> Self {
        return self.mutate(key: "aria-keyshortcuts", value: value)
    }
    
    internal func mutate(ariakeyshortcuts value: Property<String>) -> Self {
        return self.mutate(key: "aria-keyshortcuts", value: value)
    }
}

extension AriaShortcutsAttribute where Self: EmptyElement {
    
    internal func mutate(ariakeyshortcuts value: String) -> Self {
        return self.mutate(key: "aria-keyshortcuts", value: value)
    }
    
    internal func mutate(ariakeyshortcuts value: Property<String>) -> Self {
        return self.mutate(key: "aria-keyshortcuts", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaLabelAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-label'.
    ///
    /// ```html
    /// <tag aria-label="" />
    /// ```
    func aria(label value: String) -> Self
    
    /// The function represents the html-attribute 'aria-label'.
    ///
    /// ```html
    /// <tag aria-label="" />
    /// ```
    func aria(label value: Property<String>) -> Self
}

extension AriaLabelAttribute where Self: ContentElement {
    
    internal func mutate(arialabel value: String) -> Self {
        return self.mutate(key: "aria-label", value: value)
    }
    
    internal func mutate(arialabel value: Property<String>) -> Self {
        return self.mutate(key: "aria-label", value: value)
    }
}

extension AriaLabelAttribute where Self: EmptyElement {
    
    internal func mutate(arialabel value: String) -> Self {
        return self.mutate(key: "aria-label", value: value)
    }
    
    internal func mutate(arialabel value: Property<String>) -> Self {
        return self.mutate(key: "aria-label", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaLabeledAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-labeledby'.
    ///
    /// ```html
    /// <tag aria-labeledby="" />
    /// ```
    func aria(labeledBy value: String) -> Self
    
    /// The function represents the html-attribute 'aria-labeledby'.
    ///
    /// ```html
    /// <tag aria-labeledby="" />
    /// ```
    func aria(labeledBy value: Property<String>) -> Self
}

extension AriaLabeledAttribute where Self: ContentElement {
    
    internal func mutate(arialabeledby value: String) -> Self {
        return self.mutate(key: "aria-labeledby", value: value)
    }
    
    internal func mutate(arialabeledby value: Property<String>) -> Self {
        return self.mutate(key: "aria-labeledby", value: value)
    }
}

extension AriaLabeledAttribute where Self: EmptyElement {
    
    internal func mutate(arialabeledby value: String) -> Self {
        return self.mutate(key: "aria-labeledby", value: value)
    }
    
    internal func mutate(arialabeledby value: Property<String>) -> Self {
        return self.mutate(key: "aria-labeledby", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaLevelAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-level'.
    ///
    /// ```html
    /// <tag aria-level="" />
    /// ```
    func aria(level value: Int) -> Self
    
    /// The function represents the html-attribute 'aria-level'.
    ///
    /// ```html
    /// <tag aria-level="" />
    /// ```
    func aria(level value: Property<Int>) -> Self
}

extension AriaLevelAttribute where Self: ContentElement {
    
    internal func mutate(arialevel value: Int) -> Self {
        return self.mutate(key: "aria-level", value: value)
    }
    
    internal func mutate(arialevel value: Property<Int>) -> Self {
        return self.mutate(key: "aria-level", value: value)
    }
}

extension AriaLevelAttribute where Self: EmptyElement {
    
    internal func mutate(arialevel value: Int) -> Self {
        return self.mutate(key: "aria-level", value: value)
    }
    
    internal func mutate(arialevel value: Property<Int>) -> Self {
        return self.mutate(key: "aria-level", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaLiveAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-live'.
    ///
    /// ```html
    /// <tag aria-live="" />
    /// ```
    func aria(live value: Values.Accessibility.Live) -> Self
}

extension AriaLiveAttribute where Self: ContentElement {
    
    internal func mutate(arialive value: String) -> Self {
        return self.mutate(key: "aria-live", value: value)
    }
}

extension AriaLiveAttribute where Self: EmptyElement {
    
    internal func mutate(arialive value: String) -> Self {
        return self.mutate(key: "aria-live", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaModalAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-modal'.
    ///
    /// ```html
    /// <tag aria-modal="" />
    /// ```
    func aria(modal value: Bool) -> Self
    
    /// The function represents the html-attribute 'aria-modal'.
    ///
    /// ```html
    /// <tag aria-modal="" />
    /// ```
    func aria(modal value: Property<Bool>) -> Self
}

extension AriaModalAttribute where Self: ContentElement {
    
    internal func mutate(ariamodal value: Bool) -> Self {
        return self.mutate(key: "aria-modal", value: value)
    }
    
    internal func mutate(ariamodal value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-modal", value: value)
    }
}

extension AriaModalAttribute where Self: EmptyElement {
    
    internal func mutate(ariamodal value: Bool) -> Self {
        return self.mutate(key: "aria-modal", value: value)
    }
    
    internal func mutate(ariamodal value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-modal", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaMultilineAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-multiline'.
    ///
    /// ```html
    /// <tag aria-multiline="" />
    /// ```
    func aria(multiline value: Bool) -> Self
    
    /// The function represents the html-attribute 'aria-multiline'.
    ///
    /// ```html
    /// <tag aria-multiline="" />
    /// ```
    func aria(multiline value: Property<Bool>) -> Self
}

extension AriaMultilineAttribute where Self: ContentElement {
    
    internal func mutate(ariamultiline value: Bool) -> Self {
        return self.mutate(key: "aria-multiline", value: value)
    }
    
    internal func mutate(ariamultiline value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-multiline", value: value)
    }
}

extension AriaMultilineAttribute where Self: EmptyElement {
    
    internal func mutate(ariamultiline value: Bool) -> Self {
        return self.mutate(key: "aria-multiline", value: value)
    }
    
    internal func mutate(ariamultiline value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-multiline", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaMultiselectAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-multiselectable'.
    ///
    /// ```html
    /// <tag aria-multiselectable="" />
    /// ```
    func aria(multiselectable value: Bool) -> Self
    
    /// The function represents the html-attribute 'aria-multiselectable'.
    ///
    /// ```html
    /// <tag aria-multiselectable="" />
    /// ```
    func aria(multiselectable value: Property<Bool>) -> Self
}

extension AriaMultiselectAttribute where Self: ContentElement {
    
    internal func mutate(ariamultiselectable value: Bool) -> Self {
        return self.mutate(key: "aria-multiselectable", value: value)
    }
    
    internal func mutate(ariamultiselectable value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-multiselectable", value: value)
    }
}

extension AriaMultiselectAttribute where Self: EmptyElement {
    
    internal func mutate(ariamultiselectable value: Bool) -> Self {
        return self.mutate(key: "aria-multiselectable", value: value)
    }
    
    internal func mutate(ariamultiselectable value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-multiselectable", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaOrientationAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-orientation'.
    ///
    /// ```html
    /// <tag aria-orientation="" />
    /// ```
    func aria(orientation value: Values.Accessibility.Orientation) -> Self
}

extension AriaOrientationAttribute where Self: ContentElement {
    
    internal func mutate(ariaorientation value: String) -> Self {
        return self.mutate(key: "aria-orientation", value: value)
    }
}

extension AriaOrientationAttribute where Self: EmptyElement {
    
    internal func mutate(ariaorientation value: String) -> Self {
        return self.mutate(key: "aria-orientation", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaOwnsAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-owns'.
    ///
    /// ```html
    /// <tag aria-owns="" />
    /// ```
    func aria(owns value: String) -> Self
    
    /// The function represents the html-attribute 'aria-owns'.
    ///
    /// ```html
    /// <tag aria-owns="" />
    /// ```
    func aria(owns value: Property<String>) -> Self
}

extension AriaOwnsAttribute where Self: ContentElement {
    
    internal func mutate(ariaowns value: String) -> Self {
        return self.mutate(key: "aria-owns", value: value)
    }
    
    internal func mutate(ariaowns value: Property<String>) -> Self {
        return self.mutate(key: "aria-owns", value: value)
    }
}

extension AriaOwnsAttribute where Self: EmptyElement {
    
    internal func mutate(ariaowns value: String) -> Self {
        return self.mutate(key: "aria-owns", value: value)
    }
    
    internal func mutate(ariaowns value: Property<String>) -> Self {
        return self.mutate(key: "aria-owns", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaPlaceholderAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-placeholder'.
    ///
    /// ```html
    /// <tag aria-placeholder="" />
    /// ```
    func aria(placeholder value: String) -> Self
    
    /// The function represents the html-attribute 'aria-placeholder'.
    ///
    /// ```html
    /// <tag aria-placeholder="" />
    /// ```
    func aria(placeholder value: Property<String>) -> Self
}

extension AriaPlaceholderAttribute where Self: ContentElement {
    
    internal func mutate(ariaplaceholder value: String) -> Self {
        return self.mutate(key: "aria-placeholder", value: value)
    }
    
    internal func mutate(ariaplaceholder value: Property<String>) -> Self {
        return self.mutate(key: "aria-placeholder", value: value)
    }
}

extension AriaPlaceholderAttribute where Self: EmptyElement {
    
    internal func mutate(ariaplaceholder value: String) -> Self {
        return self.mutate(key: "aria-placeholder", value: value)
    }
    
    internal func mutate(ariaplaceholder value: Property<String>) -> Self {
        return self.mutate(key: "aria-placeholder", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaPositionInsetAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-posinset'.
    ///
    /// ```html
    /// <tag aria-posinset="" />
    /// ```
    func aria(positionInset_ value: Int) -> Self
    
    /// The function represents the html-attribute 'aria-posinset'.
    ///
    /// ```html
    /// <tag aria-posinset="" />
    /// ```
    func aria(positionInset_ value: Property<Int>) -> Self
}

extension AriaPositionInsetAttribute where Self: ContentElement {
    
    internal func mutate(ariaposinset value: Int) -> Self {
        return self.mutate(key: "aria-posinset", value: value)
    }
    
    internal func mutate(ariaposinset value: Property<Int>) -> Self {
        return self.mutate(key: "aria-posinset", value: value)
    }
}

extension AriaPositionInsetAttribute where Self: EmptyElement {
    
    internal func mutate(ariaposinset value: Int) -> Self {
        return self.mutate(key: "aria-posinset", value: value)
    }
    
    internal func mutate(ariaposinset value: Property<Int>) -> Self {
        return self.mutate(key: "aria-posinset", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaPressedAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-pressed'.
    ///
    /// ```html
    /// <tag aria-pressed="" />
    /// ```
    func aria(presssed value: Values.Accessibility.Pressed) -> Self
}

extension AriaPressedAttribute where Self: ContentElement {
    
    internal func mutate(ariapressed value: String) -> Self {
        return self.mutate(key: "aria-pressed", value: value)
    }
}

extension AriaPressedAttribute where Self: EmptyElement {
    
    internal func mutate(ariapressed value: String) -> Self {
        return self.mutate(key: "aria-pressed", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaReadonlyAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-readonly'.
    ///
    /// ```html
    /// <tag aria-readonly="" />
    /// ```
    func aria(readonly value: Bool) -> Self
    
    /// The function represents the html-attribute 'aria-readonly'.
    ///
    /// ```html
    /// <tag aria-readonly="" />
    /// ```
    func aria(readonly value: Property<Bool>) -> Self
}

extension AriaReadonlyAttribute where Self: ContentElement {
    
    internal func mutate(ariareadonly value: Bool) -> Self {
        return self.mutate(key: "aria-readonly", value: value)
    }
    
    internal func mutate(ariareadonly value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-readonly", value: value)
    }
}

extension AriaReadonlyAttribute where Self: EmptyElement {
    
    internal func mutate(ariareadonly value: Bool) -> Self {
        return self.mutate(key: "aria-readonly", value: value)
    }
    
    internal func mutate(ariareadonly value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-readonly", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaRelevantAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-relevant'.
    ///
    /// ```html
    /// <tag aria-relevant="" />
    /// ```
    func aria(relevant value: Values.Accessibility.Relevant) -> Self
}

extension AriaRelevantAttribute where Self: ContentElement {
    
    internal func mutate(ariarelevant value: String) -> Self {
        return self.mutate(key: "aria-relevant", value: value)
    }
}

extension AriaRelevantAttribute where Self: EmptyElement {
    
    internal func mutate(ariarelevant value: String) -> Self {
        return self.mutate(key: "aria-relevant", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaRequiredAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-required'.
    ///
    /// ```html
    /// <tag aria-required="" />
    /// ```
    func aria(required value: Bool) -> Self
    
    /// The function represents the html-attribute 'aria-required'.
    ///
    /// ```html
    /// <tag aria-required="" />
    /// ```
    func aria(required value: Property<Bool>) -> Self
}

extension AriaRequiredAttribute where Self: ContentElement {
    
    internal func mutate(ariarequired value: Bool) -> Self {
        return self.mutate(key: "aria-required", value: value)
    }
    
    internal func mutate(ariarequired value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-required", value: value)
    }
}

extension AriaRequiredAttribute where Self: EmptyElement {
    
    internal func mutate(ariarequired value: Bool) -> Self {
        return self.mutate(key: "aria-required", value: value)
    }
    
    internal func mutate(ariarequired value: Property<Bool>) -> Self {
        return self.mutate(key: "aria-required", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaRoleDescriptionAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-roledescription'.
    ///
    /// ```html
    /// <tag aria-roledescription="" />
    /// ```
    func aria(roleDescription value: String) -> Self
    
    /// The function represents the html-attribute 'aria-roledescription'.
    ///
    /// ```html
    /// <tag aria-roledescription="" />
    /// ```
    func aria(roleDescription value: Property<String>) -> Self
}

extension AriaRoleDescriptionAttribute where Self: ContentElement {
    
    internal func mutate(ariaroledescription value: String) -> Self {
        return self.mutate(key: "aria-roledescription", value: value)
    }
    
    internal func mutate(ariaroledescription value: Property<String>) -> Self {
        return self.mutate(key: "aria-roledescription", value: value)
    }
}

extension AriaRoleDescriptionAttribute where Self: EmptyElement {
    
    internal func mutate(ariaroledescription value: String) -> Self {
        return self.mutate(key: "aria-roledescription", value: value)
    }
    
    internal func mutate(ariaroledescription value: Property<String>) -> Self {
        return self.mutate(key: "aria-roledescription", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaRowCountAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-rowcount'.
    ///
    /// ```html
    /// <tag aria-rowcount="" />
    /// ```
    func aria(rowCount value: Int) -> Self
    
    /// The function represents the html-attribute 'aria-rowcount'.
    ///
    /// ```html
    /// <tag aria-rowcount="" />
    /// ```
    func aria(rowCount value: Property<Int>) -> Self
}

extension AriaRowCountAttribute where Self: ContentElement {
    
    internal func mutate(ariarowcount value: Int) -> Self {
        return self.mutate(key: "aria-rowcount", value: value)
    }
    
    internal func mutate(ariarowcount value: Property<Int>) -> Self {
        return self.mutate(key: "aria-rowcount", value: value)
    }
}

extension AriaRowCountAttribute where Self: EmptyElement {
    
    internal func mutate(ariarowcount value: Int) -> Self {
        return self.mutate(key: "aria-rowcount", value: value)
    }
    
    internal func mutate(ariarowcount value: Property<Int>) -> Self {
        return self.mutate(key: "aria-rowcount", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaRowIndexAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-rowindex'.
    ///
    /// ```html
    /// <tag aria-rowindex="" />
    /// ```
    func aria(rowIndex value: Int) -> Self
    
    /// The function represents the html-attribute 'aria-rowindex'.
    ///
    /// ```html
    /// <tag aria-rowindex="" />
    /// ```
    func aria(rowIndex value: Property<Int>) -> Self
}

extension AriaRowIndexAttribute where Self: ContentElement {
    
    internal func mutate(ariarowindex value: Int) -> Self {
        return self.mutate(key: "aria-rowindex", value: value)
    }
    
    internal func mutate(ariarowindex value: Property<Int>) -> Self {
        return self.mutate(key: "aria-rowindex", value: value)
    }
}

extension AriaRowIndexAttribute where Self: EmptyElement {
    
    internal func mutate(ariarowindex value: Int) -> Self {
        return self.mutate(key: "aria-rowindex", value: value)
    }
    
    internal func mutate(ariarowindex value: Property<Int>) -> Self {
        return self.mutate(key: "aria-rowindex", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaRowSpanAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-rowspan'.
    ///
    /// ```html
    /// <tag aria-rowspan="" />
    /// ```
    func aria(rowSpan value: Int) -> Self
    
    /// The function represents the html-attribute 'aria-rowspan'.
    ///
    /// ```html
    /// <tag aria-rowspan="" />
    /// ```
    func aria(rowSpan value: Property<Int>) -> Self
}

extension AriaRowSpanAttribute where Self: ContentElement {
    
    internal func mutate(ariarowspan value: Int) -> Self {
        return self.mutate(key: "aria-rowspan", value: value)
    }
    
    internal func mutate(ariarowspan value: Property<Int>) -> Self {
        return self.mutate(key: "aria-rowspan", value: value)
    }
}

extension AriaRowSpanAttribute where Self: EmptyElement {
    
    internal func mutate(ariarowspan value: Int) -> Self {
        return self.mutate(key: "aria-rowspan", value: value)
    }
    
    internal func mutate(ariarowspan value: Property<Int>) -> Self {
        return self.mutate(key: "aria-rowspan", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaSelectedAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-selected'.
    ///
    /// ```html
    /// <tag aria-selected="" />
    /// ```
    func aria(selected value: Values.Accessibility.Selected) -> Self
}

extension AriaSelectedAttribute where Self: ContentElement {
    
    internal func mutate(ariaselected value: String) -> Self {
        return self.mutate(key: "aria-selected", value: value)
    }
}

extension AriaSelectedAttribute where Self: EmptyElement {
    
    internal func mutate(ariaselected value: String) -> Self {
        return self.mutate(key: "aria-selected", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaSetSizeAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-setsize'.
    ///
    /// ```html
    /// <tag aria-setsize="" />
    /// ```
    func aria(setSize value: Int) -> Self
    
    /// The function represents the html-attribute 'aria-setsize'.
    ///
    /// ```html
    /// <tag aria-setsize="" />
    /// ```
    func aria(setSize value: Property<Int>) -> Self
}

extension AriaSetSizeAttribute where Self: ContentElement {
    
    internal func mutate(ariasetsize value: Int) -> Self {
        return self.mutate(key: "aria-setsize", value: value)
    }
    
    internal func mutate(ariasetsize value: Property<Int>) -> Self {
        return self.mutate(key: "aria-setsize", value: value)
    }
}

extension AriaSetSizeAttribute where Self: EmptyElement {
    
    internal func mutate(ariasetsize value: Int) -> Self {
        return self.mutate(key: "aria-setsize", value: value)
    }
    
    internal func mutate(ariasetsize value: Property<Int>) -> Self {
        return self.mutate(key: "aria-setsize", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaSortAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-sort'.
    ///
    /// ```html
    /// <tag aria-sort="" />
    /// ```
    func aria(sort value: Values.Accessibility.Sort) -> Self
}

extension AriaSortAttribute where Self: ContentElement {
    
    internal func mutate(ariasort value: String) -> Self {
        return self.mutate(key: "aria-sort", value: value)
    }
}

extension AriaSortAttribute where Self: EmptyElement {
    
    internal func mutate(ariasort value: String) -> Self {
        return self.mutate(key: "aria-sort", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaValueMaximumAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-valuemax'.
    ///
    /// ```html
    /// <tag aria-valuemax="" />
    /// ```
    func aria(valueMaximum value: Float) -> Self
    
    /// The function represents the html-attribute 'aria-valuemax'.
    ///
    /// ```html
    /// <tag aria-valuemax="" />
    /// ```
    func aria(valueMaximum value: Property<Float>) -> Self
}

extension AriaValueMaximumAttribute where Self: ContentElement {
    
    internal func mutate(ariavaluemax value: Float) -> Self {
        return self.mutate(key: "aria-valuemax", value: value)
    }
    
    internal func mutate(ariavaluemax value: Property<Float>) -> Self {
        return self.mutate(key: "aria-valuemax", value: value)
    }
}

extension AriaValueMaximumAttribute where Self: EmptyElement {
    
    internal func mutate(ariavaluemax value: Float) -> Self {
        return self.mutate(key: "aria-valuemax", value: value)
    }
    
    internal func mutate(ariavaluemax value: Property<Float>) -> Self {
        return self.mutate(key: "aria-valuemax", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaValueMininumAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-valuemin'.
    ///
    /// ```html
    /// <tag aria-valuemin="" />
    /// ```
    func aria(valueMinimum value: Float) -> Self
    
    /// The function represents the html-attribute 'aria-valuemin'.
    ///
    /// ```html
    /// <tag aria-valuemin="" />
    /// ```
    func aria(valueMinimum value: Property<Float>) -> Self
}

extension AriaValueMininumAttribute where Self: ContentElement {
    
    internal func mutate(ariavaluemin value: Float) -> Self {
        return self.mutate(key: "aria-valuemin", value: value)
    }
    
    internal func mutate(ariavaluemin value: Property<Float>) -> Self {
        return self.mutate(key: "aria-valuemin", value: value)
    }
}

extension AriaValueMininumAttribute where Self: EmptyElement {
    
    internal func mutate(ariavaluemin value: Float) -> Self {
        return self.mutate(key: "aria-valuemin", value: value)
    }
    
    internal func mutate(ariavaluemin value: Property<Float>) -> Self {
        return self.mutate(key: "aria-valuemin", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaValueNowAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-valuenow"'.
    ///
    /// ```html
    /// <tag aria-valuenow="" />
    /// ```
    func aria(valueNow value: Float) -> Self
    
    /// The function represents the html-attribute 'aria-valuenow"'.
    ///
    /// ```html
    /// <tag aria-valuenow="" />
    /// ```
    func aria(valueNow value: Property<Float>) -> Self
}

extension AriaValueNowAttribute where Self: ContentElement {
    
    internal func mutate(ariavaluenow value: Float) -> Self {
        return self.mutate(key: "aria-valuenow", value: value)
    }
    
    internal func mutate(ariavaluenow value: Property<Float>) -> Self {
        return self.mutate(key: "aria-valuenow", value: value)
    }
}

extension AriaValueNowAttribute where Self: EmptyElement {
    
    internal func mutate(ariavaluenow value: Float) -> Self {
        return self.mutate(key: "aria-valuenow", value: value)
    }
    
    internal func mutate(ariavaluenow value: Property<Float>) -> Self {
        return self.mutate(key: "aria-valuenow", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
public protocol AriaValueTextAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-valuetext'.
    ///
    /// ```html
    /// <tag aria-valuetext="" />
    /// ```
    func aria(valueText value: String) -> Self
    
    /// The function represents the html-attribute 'aria-valuetext'.
    ///
    /// ```html
    /// <tag aria-valuetext="" />
    /// ```
    func aria(valueText value: Property<String>) -> Self
}

extension AriaValueTextAttribute where Self: ContentElement {
    
    internal func mutate(ariavaluetext value: String) -> Self {
        return self.mutate(key: "aria-valuetext", value: value)
    }
    
    internal func mutate(ariavaluetext value: Property<String>) -> Self {
        return self.mutate(key: "aria-valuetext", value: value)
    }
}

extension AriaValueTextAttribute where Self: EmptyElement {
    
    internal func mutate(ariavaluetext value: String) -> Self {
        return self.mutate(key: "aria-valuetext", value: value)
    }
    
    internal func mutate(ariavaluetext value: Property<String>) -> Self {
        return self.mutate(key: "aria-valuetext", value: value)
    }
}
