@_documentation(visibility: internal)
public typealias GlobalAriaAttributes = AriaAtomicAttribute & AriaBusyAttribute & AriaControlsAttribute & AriaCurrentAttribute & AriaDescribedAttribute & AriaDetailsAttribute & AriaDisabledAttribute & AriaErrorMessageAttribute & FlowAccessibilityAttribute & AriaPopupAttribute & AriaHiddenAttribute & AriaInvalidAttribute & AriaShortcutsAttribute & LabelAccessibilityAttribute & AriaLabeledAttribute & AriaLiveAttribute & AriaOwnsAttribute & AriaRelevantAttribute & AriaRoleDescriptionAttribute

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaActiveDescendantAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-activedescendant'.
    ///
    /// ```html
    /// <tag aria-activedescendant="" />
    /// ```
    func aria(activeDescendant value: String) -> Self
}

extension AriaActiveDescendantAttribute where Self: ContentNode {
    
    internal func mutate(ariaactivedescendant value: AttributeData) -> Self {
        return self.mutate(key: "aria-activedescendant", value: value)
    }
}

extension AriaActiveDescendantAttribute where Self: EmptyNode {
    
    internal func mutate(ariaactivedescendant value: AttributeData) -> Self {
        return self.mutate(key: "aria-activedescendant", value: value)
    }
}


/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaAtomicAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-atomic'.
    ///
    /// ```html
    /// <tag aria-atomic="" />
    /// ```
    func aria(atomic value: Bool) -> Self
}

extension AriaAtomicAttribute where Self: ContentNode {
    
    internal func mutate(ariaatomic value: AttributeData) -> Self {
        return self.mutate(key: "aria-atomic", value: value)
    }
}

extension AriaAtomicAttribute where Self: EmptyNode {
    
    internal func mutate(ariaatomic value: AttributeData) -> Self {
        return self.mutate(key: "aria-atomic", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaAutoCompleteAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-autocomplete'.
    ///
    /// ```html
    /// <tag aria-autocomplete="" />
    /// ```
    func aria(autoComplete value: Values.Accessibility.Complete) -> Self
}

extension AriaAutoCompleteAttribute where Self: ContentNode {
    
    internal func mutate(ariaautocomplete value: AttributeData) -> Self {
        return self.mutate(key: "aria-autocomplete", value: value)
    }
}

extension AriaAutoCompleteAttribute where Self: EmptyNode {
    
    internal func mutate(ariaautocomplete value: AttributeData) -> Self {
        return self.mutate(key: "aria-autocomplete", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaBusyAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-busy'.
    ///
    /// ```html
    /// <tag aria-busy="" />
    /// ```
    func aria(busy value: Bool) -> Self
}

extension AriaBusyAttribute where Self: ContentNode {
    
    internal func mutate(ariabusy value: AttributeData) -> Self {
        return self.mutate(key: "aria-busy", value: value)
    }
}

extension AriaBusyAttribute where Self: EmptyNode {
    
    internal func mutate(ariabusy value: AttributeData) -> Self {
        return self.mutate(key: "aria-busy", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaCheckedAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-checked'.
    ///
    /// ```html
    /// <tag aria-checked="" />
    /// ```
    func aria(checked value: Values.Accessibility.Check) -> Self
}

extension AriaCheckedAttribute where Self: ContentNode {
    
    internal func mutate(ariachecked value: AttributeData) -> Self {
        return self.mutate(key: "aria-checked", value: value)
    }
}

extension AriaCheckedAttribute where Self: EmptyNode {
    
    internal func mutate(ariachecked value: AttributeData) -> Self {
        return self.mutate(key: "aria-checked", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaColumnCountAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-colcount'.
    ///
    /// ```html
    /// <tag aria-colcount="" />
    /// ```
    func aria(columnCount value: Int) -> Self
}

extension AriaColumnCountAttribute where Self: ContentNode {
    
    internal func mutate(ariacolcount value: AttributeData) -> Self {
        return self.mutate(key: "aria-colcount", value: value)
    }
}

extension AriaColumnCountAttribute where Self: EmptyNode {
    
    internal func mutate(ariacolcount value: AttributeData) -> Self {
        return self.mutate(key: "aria-colcount", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaColumnIndexAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-colindex'.
    ///
    /// ```html
    /// <tag aria-colindex="" />
    /// ```
    func aria(columnIndex value: Int) -> Self
}

extension AriaColumnIndexAttribute where Self: ContentNode {
    
    internal func mutate(ariacolindex value: AttributeData) -> Self {
        return self.mutate(key: "aria-colindex", value: value)
    }
}

extension AriaColumnIndexAttribute where Self: EmptyNode {
    
    internal func mutate(ariacolindex value: AttributeData) -> Self {
        return self.mutate(key: "aria-colindex", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaColumnSpanAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-colspan'.
    ///
    /// ```html
    /// <tag aria-colspan="" />
    /// ```
    func aria(columnSpan value: Int) -> Self
}

extension AriaColumnSpanAttribute where Self: ContentNode {
    
    internal func mutate(ariacolspan value: AttributeData) -> Self {
        return self.mutate(key: "aria-colspan", value: value)
    }
}

extension AriaColumnSpanAttribute where Self: EmptyNode {
    
    internal func mutate(ariacolspan value: AttributeData) -> Self {
        return self.mutate(key: "aria-colspan", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaControlsAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-controls'.
    ///
    /// ```html
    /// <tag aria-controls="" />
    /// ```
    func aria(controls value: String) -> Self
}

extension AriaControlsAttribute where Self: ContentNode {
    
    internal func mutate(ariacontrols value: AttributeData) -> Self {
        return self.mutate(key: "aria-controls", value: value)
    }
}

extension AriaControlsAttribute where Self: EmptyNode {
    
    internal func mutate(ariacontrols value: AttributeData) -> Self {
        return self.mutate(key: "aria-controls", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaCurrentAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-current'.
    ///
    /// ```html
    /// <tag aria-current="" />
    /// ```
    func aria(current value: Values.Accessibility.Current) -> Self
}

extension AriaCurrentAttribute where Self: ContentNode {
    
    internal func mutate(ariacurrent value: AttributeData) -> Self {
        return self.mutate(key: "aria-current", value: value)
    }
}

extension AriaCurrentAttribute where Self: EmptyNode {
    
    internal func mutate(ariacurrent value: AttributeData) -> Self {
        return self.mutate(key: "aria-current", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaDescribedAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-describedby'.
    ///
    /// ```html
    /// <tag aria-describedby="" />
    /// ```
    func aria(describedBy value: String) -> Self
}

extension AriaDescribedAttribute where Self: ContentNode {
    
    internal func mutate(ariadescribedby value: AttributeData) -> Self {
        return self.mutate(key: "aria-describedby", value: value)
    }
}

extension AriaDescribedAttribute where Self: EmptyNode {
    
    internal func mutate(ariadescribedby value: AttributeData) -> Self {
        return self.mutate(key: "aria-describedby", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaDetailsAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-details'.
    ///
    /// ```html
    /// <tag aria-details="" />
    /// ```
    func aria(details value: String) -> Self
}

extension AriaDetailsAttribute where Self: ContentNode {
    
    internal func mutate(ariadetails value: AttributeData) -> Self {
        return self.mutate(key: "aria-details", value: value)
    }
}

extension AriaDetailsAttribute where Self: EmptyNode {
    
    internal func mutate(ariadetails value: AttributeData) -> Self {
        return self.mutate(key: "aria-details", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaDisabledAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-disabled'.
    ///
    /// ```html
    /// <tag aria-disabled="" />
    /// ```
    func aria(disabled value: Bool) -> Self
}

extension AriaDisabledAttribute where Self: ContentNode {
    
    internal func mutate(ariadisabled value: AttributeData) -> Self {
        return self.mutate(key: "aria-disabled", value: value)
    }
}

extension AriaDisabledAttribute where Self: EmptyNode {
    
    internal func mutate(ariadisabled value: AttributeData) -> Self {
        return self.mutate(key: "aria-disabled", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaErrorMessageAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-errormessage'.
    ///
    /// ```html
    /// <tag aria-errormessage="" />
    /// ```
    func aria(errorMessage value: String) -> Self
}

extension AriaErrorMessageAttribute where Self: ContentNode {
    
    internal func mutate(ariaerrormessage value: AttributeData) -> Self {
        return self.mutate(key: "aria-errormessage", value: value)
    }
}

extension AriaErrorMessageAttribute where Self: EmptyNode {
    
    internal func mutate(ariaerrormessage value: AttributeData) -> Self {
        return self.mutate(key: "aria-errormessage", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaExpandedAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-expanded'.
    ///
    /// ```html
    /// <tag aria-expanded="" />
    /// ```
    func aria(expanded value: Bool) -> Self
}

extension AriaExpandedAttribute where Self: ContentNode {
    
    internal func mutate(ariaexpanded value: AttributeData) -> Self {
        return self.mutate(key: "aria-expanded", value: value)
    }
}

extension AriaExpandedAttribute where Self: EmptyNode {
    
    internal func mutate(ariaexpanded value: AttributeData) -> Self {
        return self.mutate(key: "aria-expanded", value: value)
    }
}

/// A type that provides the `accessibilityFlowTo` modifier.
@_documentation(visibility: internal)
public protocol FlowAccessibilityAttribute: Attribute {
    
    /// Suggest an alternate reading order.
    ///
    /// ```swift
    /// Heading1 {
    ///    "Lorem ipsum"
    /// }
    /// .accessibilityFlowTo(["id", "id"])
    /// Article {
    ///     "Lorem ipsum..."
    /// }
    /// .id("id")
    /// ```
    ///
    /// - Parameter ids: The identifiers...
    ///
    /// - Returns: The element
    func accessibilityFlowTo(_ ids: [String]) -> Self
    
    /// Suggest an alternate reading order.
    ///
    /// ```swift
    /// Heading1 {
    ///    "Lorem ipsum"
    /// }
    /// .accessibilityFlowTo("id", "id")
    /// Article {
    ///     "Lorem ipsum..."
    /// }
    /// .id("id")
    /// ```
    ///
    /// - Parameter ids: The identifiers...
    ///
    /// - Returns: The element
    func accessibilityFlowTo(_ ids: String...) -> Self
}

extension FlowAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariaflowto value: AttributeData) -> Self {
        return self.mutate(key: "aria-flowto", value: value)
    }
}

extension FlowAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariaflowto value: AttributeData) -> Self {
        return self.mutate(key: "aria-flowto", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaPopupAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-haspopup'.
    ///
    /// ```html
    /// <tag aria-haspopup="" />
    /// ```
    func aria(hasPopup value: Values.Accessibility.Popup) -> Self
}

extension AriaPopupAttribute where Self: ContentNode {
    
    internal func mutate(ariahaspopup value: AttributeData) -> Self {
        return self.mutate(key: "aria-haspopup", value: value)
    }
}

extension AriaPopupAttribute where Self: EmptyNode {
    
    internal func mutate(ariahaspopup value: AttributeData) -> Self {
        return self.mutate(key: "aria-haspopup", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaHiddenAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-hidden'.
    ///
    /// ```html
    /// <tag aria-hidden="" />
    /// ```
    func aria(hidden value: Bool) -> Self
}

extension AriaHiddenAttribute where Self: ContentNode {
    
    internal func mutate(ariahidden value: AttributeData) -> Self {
        return self.mutate(key: "aria-hidden", value: value)
    }
}

extension AriaHiddenAttribute where Self: EmptyNode {
    
    internal func mutate(ariahidden value: AttributeData) -> Self {
        return self.mutate(key: "aria-hidden", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaInvalidAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-invalid'.
    ///
    /// ```html
    /// <tag aria-invalid="" />
    /// ```
    func aria(invalid value: Values.Accessibility.Invalid) -> Self
}

extension AriaInvalidAttribute where Self: ContentNode {
    
    internal func mutate(ariainvalid value: AttributeData) -> Self {
        return self.mutate(key:  "aria-invalid", value: value)
    }
}

extension AriaInvalidAttribute where Self: EmptyNode {
    
    internal func mutate(ariainvalid value: AttributeData) -> Self {
        return self.mutate(key:  "aria-invalid", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaShortcutsAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-keyshortcuts'.
    ///
    /// ```html
    /// <tag aria-keyshortcuts="" />
    /// ```
    func aria(keyShortcuts value: String) -> Self
}

extension AriaShortcutsAttribute where Self: ContentNode {
    
    internal func mutate(ariakeyshortcuts value: AttributeData) -> Self {
        return self.mutate(key: "aria-keyshortcuts", value: value)
    }
}

extension AriaShortcutsAttribute where Self: EmptyNode {
    
    internal func mutate(ariakeyshortcuts value: AttributeData) -> Self {
        return self.mutate(key: "aria-keyshortcuts", value: value)
    }
}

/// A type that provides the `accessibilityLabel` modifier.
@_documentation(visibility: internal)
public protocol LabelAccessibilityAttribute: Attribute {
    
    /// Indicate a label for the current element.
    ///
    /// ```swift
    /// Button {
    ///     Vector {
    ///        Path {
    ///        }
    ///        .draw("M...")
    ///     }
    /// }
    /// .accessibilityLabel("Lorem ipsum")
    /// ```
    /// - Parameter value: The label to describe the element.
    ///
    /// - Returns: The element
    func accessibilityLabel(_ value: String) -> Self
    
    /// Indicate a localized label for the current element.
    ///
    /// ```swift
    /// Button {
    ///     Vector {
    ///        Path {
    ///        }
    ///        .draw("M...")
    ///     }
    /// }
    /// .accessibilityLabel("Lorem ipsum")
    /// ```
    /// - Parameter value: The label to describe the element.
    ///
    /// - Returns: The element
    func accessibilityLabel(_ localized: LocalizedStringKey, tableName: String?) -> Self
    
    /// Indicate a label for the current element.
    ///
    /// ```swift
    /// Button {
    ///     Vector {
    ///        Path {
    ///        }
    ///        .draw("M...")
    ///     }
    /// }
    /// .accessibilityLabel(verbatim: "Lorem ipsum")
    /// ```
    /// - Parameter value: The label to describe the element.
    ///
    /// - Returns: The element
    func accessibilityLabel(verbatim value: String) -> Self
}

extension LabelAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(arialabel value: AttributeData) -> Self {
        return self.mutate(key: "aria-label", value: value)
    }
}

extension LabelAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(arialabel value: AttributeData) -> Self {
        return self.mutate(key: "aria-label", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaLabeledAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-labeledby'.
    ///
    /// ```html
    /// <tag aria-labeledby="" />
    /// ```
    func aria(labeledBy value: String) -> Self
}

extension AriaLabeledAttribute where Self: ContentNode {
    
    internal func mutate(arialabeledby value: AttributeData) -> Self {
        return self.mutate(key: "aria-labeledby", value: value)
    }
}

extension AriaLabeledAttribute where Self: EmptyNode {
    
    internal func mutate(arialabeledby value: AttributeData) -> Self {
        return self.mutate(key: "aria-labeledby", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaLevelAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-level'.
    ///
    /// ```html
    /// <tag aria-level="" />
    /// ```
    func aria(level value: Int) -> Self
}

extension AriaLevelAttribute where Self: ContentNode {
    
    internal func mutate(arialevel value: AttributeData) -> Self {
        return self.mutate(key: "aria-level", value: value)
    }
}

extension AriaLevelAttribute where Self: EmptyNode {
    
    internal func mutate(arialevel value: AttributeData) -> Self {
        return self.mutate(key: "aria-level", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaLiveAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-live'.
    ///
    /// ```html
    /// <tag aria-live="" />
    /// ```
    func aria(live value: Values.Accessibility.Live) -> Self
}

extension AriaLiveAttribute where Self: ContentNode {
    
    internal func mutate(arialive value: AttributeData) -> Self {
        return self.mutate(key: "aria-live", value: value)
    }
}

extension AriaLiveAttribute where Self: EmptyNode {
    
    internal func mutate(arialive value: AttributeData) -> Self {
        return self.mutate(key: "aria-live", value: value)
    }
}

/// A type that provides the `accessibilityModal` modifier.
@_documentation(visibility: internal)
public protocol ModalAccessibilityAttribute: Attribute {
    
    /// Indicate whether an element is modal when displayed.
    /// 
    /// ```swift
    /// Divsion {
    /// }
    /// .role(.dialog)
    /// .accessibilityModal(true)
    /// ```
    /// - Parameter value: Whether the element is a modal.
    ///
    /// - Returns: The element
    func accessibilityModal(_ value: Bool) -> Self
}

extension ModalAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariamodal value: AttributeData) -> Self {
        return self.mutate(key: "aria-modal", value: value)
    }
}

extension ModalAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariamodal value: AttributeData) -> Self {
        return self.mutate(key: "aria-modal", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaMultilineAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-multiline'.
    ///
    /// ```html
    /// <tag aria-multiline="" />
    /// ```
    func aria(multiline value: Bool) -> Self
}

extension AriaMultilineAttribute where Self: ContentNode {
    
    internal func mutate(ariamultiline value: AttributeData) -> Self {
        return self.mutate(key: "aria-multiline", value: value)
    }
}

extension AriaMultilineAttribute where Self: EmptyNode {
    
    internal func mutate(ariamultiline value: AttributeData) -> Self {
        return self.mutate(key: "aria-multiline", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaMultiselectAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-multiselectable'.
    ///
    /// ```html
    /// <tag aria-multiselectable="" />
    /// ```
    func aria(multiselectable value: Bool) -> Self
}

extension AriaMultiselectAttribute where Self: ContentNode {
    
    internal func mutate(ariamultiselectable value: AttributeData) -> Self {
        return self.mutate(key: "aria-multiselectable", value: value)
    }
}

extension AriaMultiselectAttribute where Self: EmptyNode {
    
    internal func mutate(ariamultiselectable value: AttributeData) -> Self {
        return self.mutate(key: "aria-multiselectable", value: value)
    }
}

/// A type that provides the `accessibilityOrientation` modifier.
@_documentation(visibility: internal)
public protocol OrientationAccessibilityAttribute: Attribute {
    
    /// Indicate the orientation of the element.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .role(.scrollbar)
    /// .accessibilityOrientation(.horizontal)
    /// ```
    /// - Parameter value: The orientation the element is in.
    ///
    /// - Returns: The element
    func accessibilityOrientation(_ value: Values.Accessibility.Orientation) -> Self
}

extension OrientationAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariaorientation value: AttributeData) -> Self {
        return self.mutate(key: "aria-orientation", value: value)
    }
}

extension OrientationAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariaorientation value: AttributeData) -> Self {
        return self.mutate(key: "aria-orientation", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaOwnsAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-owns'.
    ///
    /// ```html
    /// <tag aria-owns="" />
    /// ```
    func aria(owns value: String) -> Self
}

extension AriaOwnsAttribute where Self: ContentNode {
    
    internal func mutate(ariaowns value: AttributeData) -> Self {
        return self.mutate(key: "aria-owns", value: value)
    }
}

extension AriaOwnsAttribute where Self: EmptyNode {
    
    internal func mutate(ariaowns value: AttributeData) -> Self {
        return self.mutate(key: "aria-owns", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaPlaceholderAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-placeholder'.
    ///
    /// ```html
    /// <tag aria-placeholder="" />
    /// ```
    func aria(placeholder value: String) -> Self
}

extension AriaPlaceholderAttribute where Self: ContentNode {
    
    internal func mutate(ariaplaceholder value: AttributeData) -> Self {
        return self.mutate(key: "aria-placeholder", value: value)
    }
}

extension AriaPlaceholderAttribute where Self: EmptyNode {
    
    internal func mutate(ariaplaceholder value: AttributeData) -> Self {
        return self.mutate(key: "aria-placeholder", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaPositionInsetAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-posinset'.
    ///
    /// ```html
    /// <tag aria-posinset="" />
    /// ```
    func aria(positionInset_ value: Int) -> Self
}

extension AriaPositionInsetAttribute where Self: ContentNode {
    
    internal func mutate(ariaposinset value: AttributeData) -> Self {
        return self.mutate(key: "aria-posinset", value: value)
    }
}

extension AriaPositionInsetAttribute where Self: EmptyNode {
    
    internal func mutate(ariaposinset value: AttributeData) -> Self {
        return self.mutate(key: "aria-posinset", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaPressedAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-pressed'.
    ///
    /// ```html
    /// <tag aria-pressed="" />
    /// ```
    func aria(presssed value: Values.Accessibility.Pressed) -> Self
}

extension AriaPressedAttribute where Self: ContentNode {
    
    internal func mutate(ariapressed value: AttributeData) -> Self {
        return self.mutate(key: "aria-pressed", value: value)
    }
}

extension AriaPressedAttribute where Self: EmptyNode {
    
    internal func mutate(ariapressed value: AttributeData) -> Self {
        return self.mutate(key: "aria-pressed", value: value)
    }
}

/// A type that provides the `accessibilityReadonly` modifier.
@_documentation(visibility: internal)
public protocol ReadOnlyAccessibilityAttribute: Attribute {
    
    /// Indicate the element as read only.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .role(.checkbox)
    /// .accessibilityReadonly(true)
    /// ```
    ///
    /// - Parameter value: Whether the element should be read only.
    ///
    /// - Returns: The element
    func accessibilityReadonly(_ value: Bool) -> Self
}

extension ReadOnlyAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariareadonly value: AttributeData) -> Self {
        return self.mutate(key: "aria-readonly", value: value)
    }
}

extension ReadOnlyAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariareadonly value: AttributeData) -> Self {
        return self.mutate(key: "aria-readonly", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaRelevantAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-relevant'.
    ///
    /// ```html
    /// <tag aria-relevant="" />
    /// ```
    func aria(relevant value: Values.Accessibility.Relevant) -> Self
}

extension AriaRelevantAttribute where Self: ContentNode {
    
    internal func mutate(ariarelevant value: AttributeData) -> Self {
        return self.mutate(key: "aria-relevant", value: value)
    }
}

extension AriaRelevantAttribute where Self: EmptyNode {
    
    internal func mutate(ariarelevant value: AttributeData) -> Self {
        return self.mutate(key: "aria-relevant", value: value)
    }
}

/// A type that provides the `accessibilityRequired` modifier.
@_documentation(visibility: internal)
public protocol RequiredAccessibilityAttribute: Attribute {
    
    /// Indicate that input is required on the element.
    ///
    /// ```swift
    /// UnorderedList {
    ///    ListItem {
    ///       "Lorem ipsum"
    ///    }
    ///    .role(radio)
    /// }
    /// .role(.radiogroup)
    /// .accessibilityRequired(true)
    /// ```
    ///
    /// - Parameter condition: TODO
    ///
    /// - Returns: The element
    func accessibilityRequired(_ value: Bool) -> Self
}

extension RequiredAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariarequired value: AttributeData) -> Self {
        return self.mutate(key: "aria-required", value: value)
    }
}

extension RequiredAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariarequired value: AttributeData) -> Self {
        return self.mutate(key: "aria-required", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaRoleDescriptionAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-roledescription'.
    ///
    /// ```html
    /// <tag aria-roledescription="" />
    /// ```
    func aria(roleDescription value: String) -> Self
}

extension AriaRoleDescriptionAttribute where Self: ContentNode {
    
    internal func mutate(ariaroledescription value: AttributeData) -> Self {
        return self.mutate(key: "aria-roledescription", value: value)
    }
}

extension AriaRoleDescriptionAttribute where Self: EmptyNode {
    
    internal func mutate(ariaroledescription value: AttributeData) -> Self {
        return self.mutate(key: "aria-roledescription", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaRowCountAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-rowcount'.
    ///
    /// ```html
    /// <tag aria-rowcount="" />
    /// ```
    func aria(rowCount value: Int) -> Self
}

extension AriaRowCountAttribute where Self: ContentNode {
    
    internal func mutate(ariarowcount value: AttributeData) -> Self {
        return self.mutate(key: "aria-rowcount", value: value)
    }
}

extension AriaRowCountAttribute where Self: EmptyNode {
    
    internal func mutate(ariarowcount value: AttributeData) -> Self {
        return self.mutate(key: "aria-rowcount", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaRowIndexAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-rowindex'.
    ///
    /// ```html
    /// <tag aria-rowindex="" />
    /// ```
    func aria(rowIndex value: Int) -> Self
}

extension AriaRowIndexAttribute where Self: ContentNode {
    
    internal func mutate(ariarowindex value: AttributeData) -> Self {
        return self.mutate(key: "aria-rowindex", value: value)
    }
}

extension AriaRowIndexAttribute where Self: EmptyNode {
    
    internal func mutate(ariarowindex value: AttributeData) -> Self {
        return self.mutate(key: "aria-rowindex", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaRowSpanAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-rowspan'.
    ///
    /// ```html
    /// <tag aria-rowspan="" />
    /// ```
    func aria(rowSpan value: Int) -> Self
}

extension AriaRowSpanAttribute where Self: ContentNode {
    
    internal func mutate(ariarowspan value: AttributeData) -> Self {
        return self.mutate(key: "aria-rowspan", value: value)
    }
}

extension AriaRowSpanAttribute where Self: EmptyNode {
    
    internal func mutate(ariarowspan value: AttributeData) -> Self {
        return self.mutate(key: "aria-rowspan", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaSelectedAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-selected'.
    ///
    /// ```html
    /// <tag aria-selected="" />
    /// ```
    func aria(selected value: Values.Accessibility.Selected) -> Self
}

extension AriaSelectedAttribute where Self: ContentNode {
    
    internal func mutate(ariaselected value: AttributeData) -> Self {
        return self.mutate(key: "aria-selected", value: value)
    }
}

extension AriaSelectedAttribute where Self: EmptyNode {
    
    internal func mutate(ariaselected value: AttributeData) -> Self {
        return self.mutate(key: "aria-selected", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaSetSizeAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-setsize'.
    ///
    /// ```html
    /// <tag aria-setsize="" />
    /// ```
    func aria(setSize value: Int) -> Self
}

extension AriaSetSizeAttribute where Self: ContentNode {
    
    internal func mutate(ariasetsize value: AttributeData) -> Self {
        return self.mutate(key: "aria-setsize", value: value)
    }
}

extension AriaSetSizeAttribute where Self: EmptyNode {
    
    internal func mutate(ariasetsize value: AttributeData) -> Self {
        return self.mutate(key: "aria-setsize", value: value)
    }
}

/// A type that provides the `accessibilitySort` modifier.
@_documentation(visibility: internal)
public protocol SortAccessibilityAttribute: Attribute {
    
    /// Indicate the direction of a sort order.
    ///
    /// ```swift
    /// Table {
    ///    TableRow {
    ///       HeaderCell {
    ///          "Lorem ipsum"
    ///       }
    ///       .accessibilitySort(.ascending)
    ///    }
    /// }
    /// ```
    ///
    /// - Parameter value: The direction it is sort.
    ///
    /// - Returns: The element
    func accessibilitySort(_ value: Values.Accessibility.Sort) -> Self
}

extension SortAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariasort value: AttributeData) -> Self {
        return self.mutate(key: "aria-sort", value: value)
    }
}

extension SortAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariasort value: AttributeData) -> Self {
        return self.mutate(key: "aria-sort", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaValueMaximumAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-valuemax'.
    ///
    /// ```html
    /// <tag aria-valuemax="" />
    /// ```
    func aria(valueMaximum value: Float) -> Self
}

extension AriaValueMaximumAttribute where Self: ContentNode {
    
    internal func mutate(ariavaluemax value: AttributeData) -> Self {
        return self.mutate(key: "aria-valuemax", value: value)
    }
}

extension AriaValueMaximumAttribute where Self: EmptyNode {
    
    internal func mutate(ariavaluemax value: AttributeData) -> Self {
        return self.mutate(key: "aria-valuemax", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaValueMininumAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-valuemin'.
    ///
    /// ```html
    /// <tag aria-valuemin="" />
    /// ```
    func aria(valueMinimum value: Float) -> Self
}

extension AriaValueMininumAttribute where Self: ContentNode {
    
    internal func mutate(ariavaluemin value: AttributeData) -> Self {
        return self.mutate(key: "aria-valuemin", value: value)
    }
}

extension AriaValueMininumAttribute where Self: EmptyNode {
    
    internal func mutate(ariavaluemin value: AttributeData) -> Self {
        return self.mutate(key: "aria-valuemin", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaValueNowAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-valuenow"'.
    ///
    /// ```html
    /// <tag aria-valuenow="" />
    /// ```
    func aria(valueNow value: Float) -> Self
}

extension AriaValueNowAttribute where Self: ContentNode {
    
    internal func mutate(ariavaluenow value: AttributeData) -> Self {
        return self.mutate(key: "aria-valuenow", value: value)
    }
}

extension AriaValueNowAttribute where Self: EmptyNode {
    
    internal func mutate(ariavaluenow value: AttributeData) -> Self {
        return self.mutate(key: "aria-valuenow", value: value)
    }
}

/// The protocol provides the element with accessibility handler.
@_documentation(visibility: internal)
public protocol AriaValueTextAttribute: Attribute {
    
    /// The function represents the html-attribute 'aria-valuetext'.
    ///
    /// ```html
    /// <tag aria-valuetext="" />
    /// ```
    func aria(valueText value: String) -> Self
}

extension AriaValueTextAttribute where Self: ContentNode {
    
    internal func mutate(ariavaluetext value: AttributeData) -> Self {
        return self.mutate(key: "aria-valuetext", value: value)
    }
}

extension AriaValueTextAttribute where Self: EmptyNode {
    
    internal func mutate(ariavaluetext value: AttributeData) -> Self {
        return self.mutate(key: "aria-valuetext", value: value)
    }
}
