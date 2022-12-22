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
}

extension AriaActiveDescendantAttribute {
    
    internal var key: String { "aria-activedescendant" }
}

extension AriaActiveDescendantAttribute where Self: ContentNode {
    
    internal func mutate(ariaactivedescendant value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaActiveDescendantAttribute where Self: EmptyNode {
    
    internal func mutate(ariaactivedescendant value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaAtomicAttribute {
    
    internal var key: String { "aria-atomic" }
}

extension AriaAtomicAttribute where Self: ContentNode {
    
    internal func mutate(ariaatomic value: Bool) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaAtomicAttribute where Self: EmptyNode {
    
    internal func mutate(ariaatomic value: Bool) -> Self {
        return self.mutate(key: key, value: value)
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

extension AriaAutoCompleteAttribute {
    
    internal var key: String { "aria-autocomplete" }
}

extension AriaAutoCompleteAttribute where Self: ContentNode {
    
    internal func mutate(ariaautocomplete value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaAutoCompleteAttribute where Self: EmptyNode {
    
    internal func mutate(ariaautocomplete value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaBusyAttribute {
    
    internal var key: String { "aria-busy" }
}

extension AriaBusyAttribute where Self: ContentNode {
    
    internal func mutate(ariabusy value: Bool) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaBusyAttribute where Self: EmptyNode {
    
    internal func mutate(ariabusy value: Bool) -> Self {
        return self.mutate(key: key, value: value)
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

extension AriaCheckedAttribute {
    
    internal var key: String { "aria-checked" }
}

extension AriaCheckedAttribute where Self: ContentNode {
    
    internal func mutate(ariachecked value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaCheckedAttribute where Self: EmptyNode {
    
    internal func mutate(ariachecked value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaColumnCountAttribute {
    
    internal var key: String { "aria-colcount" }
}

extension AriaColumnCountAttribute where Self: ContentNode {
    
    internal func mutate(ariacolcount value: Int) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaColumnCountAttribute where Self: EmptyNode {
    
    internal func mutate(ariacolcount value: Int) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaColumnIndexAttribute {
    
    internal var key: String { "aria-colindex" }
}

extension AriaColumnIndexAttribute where Self: ContentNode {
    
    internal func mutate(ariacolindex value: Int) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaColumnIndexAttribute where Self: EmptyNode {
    
    internal func mutate(ariacolindex value: Int) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaColumnSpanAttribute {
    
    internal var key: String { "aria-colspan" }
}

extension AriaColumnSpanAttribute where Self: ContentNode {
    
    internal func mutate(ariacolspan value: Int) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaColumnSpanAttribute where Self: EmptyNode {
    
    internal func mutate(ariacolspan value: Int) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaControlsAttribute {
    
    internal var key: String { "aria-controls" }
}

extension AriaControlsAttribute where Self: ContentNode {
    
    internal func mutate(ariacontrols value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaControlsAttribute where Self: EmptyNode {
    
    internal func mutate(ariacontrols value: String) -> Self {
        return self.mutate(key: key, value: value)
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

extension AriaCurrentAttribute {
    
    internal var key: String { "aria-current" }
}

extension AriaCurrentAttribute where Self: ContentNode {
    
    internal func mutate(ariacurrent value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaCurrentAttribute where Self: EmptyNode {
    
    internal func mutate(ariacurrent value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaDescribedAttribute {
    
    internal var key: String { "aria-describedby" }
}

extension AriaDescribedAttribute where Self: ContentNode {
    
    internal func mutate(ariadescribedby value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaDescribedAttribute where Self: EmptyNode {
    
    internal func mutate(ariadescribedby value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaDetailsAttribute {
    
    internal var key: String { "aria-details" }
}

extension AriaDetailsAttribute where Self: ContentNode {
    
    internal func mutate(ariadetails value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaDetailsAttribute where Self: EmptyNode {
    
    internal func mutate(ariadetails value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaDisabledAttribute {
    
    internal var key: String { "aria-disabled" }
}

extension AriaDisabledAttribute where Self: ContentNode {
    
    internal func mutate(ariadisabled value: Bool) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaDisabledAttribute where Self: EmptyNode {
    
    internal func mutate(ariadisabled value: Bool) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaErrorMessageAttribute {
    
    internal var key: String { "aria-errormessage" }
}

extension AriaErrorMessageAttribute where Self: ContentNode {
    
    internal func mutate(ariaerrormessage value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaErrorMessageAttribute where Self: EmptyNode {
    
    internal func mutate(ariaerrormessage value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaExpandedAttribute {
    
    internal var key: String { "aria-expanded" }
}

extension AriaExpandedAttribute where Self: ContentNode {
    
    internal func mutate(ariaexpanded value: Bool) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaExpandedAttribute where Self: EmptyNode {
    
    internal func mutate(ariaexpanded value: Bool) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaFlowToAttribute {
    
    internal var key: String { "aria-flowto" }
}

extension AriaFlowToAttribute where Self: ContentNode {
    
    internal func mutate(ariaflowto value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaFlowToAttribute where Self: EmptyNode {
    
    internal func mutate(ariaflowto value: String) -> Self {
        return self.mutate(key: key, value: value)
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

extension AriaPopupAttribute {
    
    internal var key: String { "aria-haspopup" }
}

extension AriaPopupAttribute where Self: ContentNode {
    
    internal func mutate(ariahaspopup value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaPopupAttribute where Self: EmptyNode {
    
    internal func mutate(ariahaspopup value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaHiddenAttribute {
    
    internal var key: String { "aria-hidden" }
}

extension AriaHiddenAttribute where Self: ContentNode {
    
    internal func mutate(ariahidden value: Bool) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaHiddenAttribute where Self: EmptyNode {
    
    internal func mutate(ariahidden value: Bool) -> Self {
        return self.mutate(key: key, value: value)
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

extension AriaInvalidAttribute {
    
    internal var key: String { "aria-invalid" }
}

extension AriaInvalidAttribute where Self: ContentNode {
    
    internal func mutate(ariainvalid value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaInvalidAttribute where Self: EmptyNode {
    
    internal func mutate(ariainvalid value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaShortcutsAttribute {
    
    internal var key: String { "aria-keyshortcuts" }
}

extension AriaShortcutsAttribute where Self: ContentNode {
    
    internal func mutate(ariakeyshortcuts value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaShortcutsAttribute where Self: EmptyNode {
    
    internal func mutate(ariakeyshortcuts value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaLabelAttribute {
    
    internal var key: String { "aria-label" }
}

extension AriaLabelAttribute where Self: ContentNode {
    
    internal func mutate(arialabel value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaLabelAttribute where Self: EmptyNode {
    
    internal func mutate(arialabel value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaLabeledAttribute {
    
    internal var key: String { "aria-labeledby" }
}

extension AriaLabeledAttribute where Self: ContentNode {
    
    internal func mutate(arialabeledby value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaLabeledAttribute where Self: EmptyNode {
    
    internal func mutate(arialabeledby value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaLevelAttribute {
    
    internal var key: String { "aria-level" }
}

extension AriaLevelAttribute where Self: ContentNode {
    
    internal func mutate(arialevel value: Int) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaLevelAttribute where Self: EmptyNode {
    
    internal func mutate(arialevel value: Int) -> Self {
        return self.mutate(key: key, value: value)
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

extension AriaLiveAttribute {
    
    internal var key: String { "aria-live" }
}

extension AriaLiveAttribute where Self: ContentNode {
    
    internal func mutate(arialive value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaLiveAttribute where Self: EmptyNode {
    
    internal func mutate(arialive value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaModalAttribute {
    
    internal var key: String { "aria-modal" }
}

extension AriaModalAttribute where Self: ContentNode {
    
    internal func mutate(ariamodal value: Bool) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaModalAttribute where Self: EmptyNode {
    
    internal func mutate(ariamodal value: Bool) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaMultilineAttribute {
    
    internal var key: String { "aria-multiline" }
}

extension AriaMultilineAttribute where Self: ContentNode {
    
    internal func mutate(ariamultiline value: Bool) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaMultilineAttribute where Self: EmptyNode {
    
    internal func mutate(ariamultiline value: Bool) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaMultiselectAttribute {
    
    internal var key: String { "aria-multiselectable" }
}

extension AriaMultiselectAttribute where Self: ContentNode {
    
    internal func mutate(ariamultiselectable value: Bool) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaMultiselectAttribute where Self: EmptyNode {
    
    internal func mutate(ariamultiselectable value: Bool) -> Self {
        return self.mutate(key: key, value: value)
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

extension AriaOrientationAttribute {
    
    internal var key: String { "aria-orientation" }
}

extension AriaOrientationAttribute where Self: ContentNode {
    
    internal func mutate(ariaorientation value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaOrientationAttribute where Self: EmptyNode {
    
    internal func mutate(ariaorientation value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaOwnsAttribute {
    
    internal var key: String { "aria-owns" }
}

extension AriaOwnsAttribute where Self: ContentNode {
    
    internal func mutate(ariaowns value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaOwnsAttribute where Self: EmptyNode {
    
    internal func mutate(ariaowns value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaPlaceholderAttribute {
    
    internal var key: String { "aria-placeholder" }
}

extension AriaPlaceholderAttribute where Self: ContentNode {
    
    internal func mutate(ariaplaceholder value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaPlaceholderAttribute where Self: EmptyNode {
    
    internal func mutate(ariaplaceholder value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaPositionInsetAttribute {
    
    internal var key: String { "aria-posinset" }
}

extension AriaPositionInsetAttribute where Self: ContentNode {
    
    internal func mutate(ariaposinset value: Int) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaPositionInsetAttribute where Self: EmptyNode {
    
    internal func mutate(ariaposinset value: Int) -> Self {
        return self.mutate(key: key, value: value)
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

extension AriaPressedAttribute {
    
    internal var key: String { "aria-pressed" }
}

extension AriaPressedAttribute where Self: ContentNode {
    
    internal func mutate(ariapressed value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaPressedAttribute where Self: EmptyNode {
    
    internal func mutate(ariapressed value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaReadonlyAttribute {
    
    internal var key: String { "aria-readonly" }
}

extension AriaReadonlyAttribute where Self: ContentNode {
    
    internal func mutate(ariareadonly value: Bool) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaReadonlyAttribute where Self: EmptyNode {
    
    internal func mutate(ariareadonly value: Bool) -> Self {
        return self.mutate(key: key, value: value)
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

extension AriaRelevantAttribute {
    
    internal var key: String { "aria-relevant" }
}

extension AriaRelevantAttribute where Self: ContentNode {
    
    internal func mutate(ariarelevant value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaRelevantAttribute where Self: EmptyNode {
    
    internal func mutate(ariarelevant value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaRequiredAttribute {
    
    internal var key: String { "aria-required" }
}

extension AriaRequiredAttribute where Self: ContentNode {
    
    internal func mutate(ariarequired value: Bool) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaRequiredAttribute where Self: EmptyNode {
    
    internal func mutate(ariarequired value: Bool) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaRoleDescriptionAttribute {
    
    internal var key: String { "aria-roledescription" }
}

extension AriaRoleDescriptionAttribute where Self: ContentNode {
    
    internal func mutate(ariaroledescription value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaRoleDescriptionAttribute where Self: EmptyNode {
    
    internal func mutate(ariaroledescription value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaRowCountAttribute {
    
    internal var key: String { "aria-rowcount" }
}

extension AriaRowCountAttribute where Self: ContentNode {
    
    internal func mutate(ariarowcount value: Int) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaRowCountAttribute where Self: EmptyNode {
    
    internal func mutate(ariarowcount value: Int) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaRowIndexAttribute {
    
    internal var key: String { "aria-rowindex" }
}

extension AriaRowIndexAttribute where Self: ContentNode {
    
    internal func mutate(ariarowindex value: Int) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaRowIndexAttribute where Self: EmptyNode {
    
    internal func mutate(ariarowindex value: Int) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaRowSpanAttribute {
    
    internal var key: String { "aria-rowspan" }
}

extension AriaRowSpanAttribute where Self: ContentNode {
    
    internal func mutate(ariarowspan value: Int) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaRowSpanAttribute where Self: EmptyNode {
    
    internal func mutate(ariarowspan value: Int) -> Self {
        return self.mutate(key: key, value: value)
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

extension AriaSelectedAttribute {
    
    internal var key: String { "aria-selected" }
}

extension AriaSelectedAttribute where Self: ContentNode {
    
    internal func mutate(ariaselected value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaSelectedAttribute where Self: EmptyNode {
    
    internal func mutate(ariaselected value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaSetSizeAttribute {
    
    internal var key: String { "aria-setsize" }
}

extension AriaSetSizeAttribute where Self: ContentNode {
    
    internal func mutate(ariasetsize value: Int) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaSetSizeAttribute where Self: EmptyNode {
    
    internal func mutate(ariasetsize value: Int) -> Self {
        return self.mutate(key: key, value: value)
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

extension AriaSortAttribute {
    
    internal var key: String { "aria-sort" }
}

extension AriaSortAttribute where Self: ContentNode {
    
    internal func mutate(ariasort value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaSortAttribute where Self: EmptyNode {
    
    internal func mutate(ariasort value: String) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaValueMaximumAttribute {
    
    internal var key: String { "aria-valuemax" }
}

extension AriaValueMaximumAttribute where Self: ContentNode {
    
    internal func mutate(ariavaluemax value: Float) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaValueMaximumAttribute where Self: EmptyNode {
    
    internal func mutate(ariavaluemax value: Float) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaValueMininumAttribute {
    
    internal var key: String { "aria-valuemin" }
}

extension AriaValueMininumAttribute where Self: ContentNode {
    
    internal func mutate(ariavaluemin value: Float) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaValueMininumAttribute where Self: EmptyNode {
    
    internal func mutate(ariavaluemin value: Float) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaValueNowAttribute {
    
    internal var key: String { "aria-valuenow" }
}

extension AriaValueNowAttribute where Self: ContentNode {
    
    internal func mutate(ariavaluenow value: Float) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaValueNowAttribute where Self: EmptyNode {
    
    internal func mutate(ariavaluenow value: Float) -> Self {
        return self.mutate(key: key, value: value)
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
}

extension AriaValueTextAttribute {
    
    internal var key: String { "aria-valuetext" }
}

extension AriaValueTextAttribute where Self: ContentNode {
    
    internal func mutate(ariavaluetext value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AriaValueTextAttribute where Self: EmptyNode {
    
    internal func mutate(ariavaluetext value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}
