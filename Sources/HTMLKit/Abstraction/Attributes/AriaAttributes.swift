@_documentation(visibility: internal)
public typealias GlobalAriaAttributes = AtomicAccessibilityAttribute & BusyAccessibilityAttribute & AriaControlsAttribute & AriaCurrentAttribute & AriaDescribedAttribute & AriaDetailsAttribute & DisabledAccessibilityAttribute & FlowAccessibilityAttribute & AriaPopupAttribute & HiddenAccessibilityAttribute & InvalidAccessibilityAttribute & AriaShortcutsAttribute & LabelAccessibilityAttribute & LabelsAccessibilityAttribute & LiveAccessibilityAttribute & OwnsAccessibilityAttribute & RelevantAccessibilityAttribute & AriaRoleDescriptionAttribute

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


/// A type that provides the `accessibilityAtomic` modifier.
@_documentation(visibility: internal)
public protocol AtomicAccessibilityAttribute: Attribute {
    
    /// Indicate whether the entire region should be announced.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .accessibilityAtomic(true)
    /// ```
    ///
    /// - Parameter value: Whether to treat the region as one entity.
    ///
    /// - Returns: The element
    func accessibilityAtomic(_ value: Bool) -> Self
}

extension AtomicAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariaatomic value: AttributeData) -> Self {
        return self.mutate(key: "aria-atomic", value: value)
    }
}

extension AtomicAccessibilityAttribute where Self: EmptyNode {
    
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

/// A type that provides the `accessibilityBusy` modifier.
@_documentation(visibility: internal)
public protocol BusyAccessibilityAttribute: Attribute {
    
    /// Indicate an element is occupied and should be announced after its finished.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .accessibilityBusy(false)
    /// ```
    ///
    /// - Parameter value: Whether the element is occupied.
    ///
    /// - Returns: The element
    func accessibilityBusy(_ value: Bool) -> Self
}

extension BusyAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariabusy value: AttributeData) -> Self {
        return self.mutate(key: "aria-busy", value: value)
    }
}

extension BusyAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariabusy value: AttributeData) -> Self {
        return self.mutate(key: "aria-busy", value: value)
    }
}

/// A type that provides the `accessibilityChecked` modifier.
@_documentation(visibility: internal)
public protocol CheckedAccessibilityAttribute: Attribute {
    
    /// Indicate the current state of a selection control.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .role(.checkbox)
    /// .accessibilityChecked(false)
    /// ```
    ///
    /// - Parameter state: Whether the element is checked.
    ///
    /// - Returns: The element
    func accessibilityChecked(_ value: Bool) -> Self
}

extension CheckedAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariachecked value: AttributeData) -> Self {
        return self.mutate(key: "aria-checked", value: value)
    }
}

extension CheckedAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariachecked value: AttributeData) -> Self {
        return self.mutate(key: "aria-checked", value: value)
    }
}

/// A type that provides the `accessibilityColumnCount` modifier.
@_documentation(visibility: internal)
public protocol ColumnCountAccessibilityAttribute: Attribute {
    
    /// Indicate the total number of columns in a element.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .role(.grid)
    /// .accessibilityColumnCount(941)
    /// ```
    ///
    /// - Parameter value: The total number of columns.
    ///
    /// - Returns: The element
    func accessibilityColumnCount(_ value: Int) -> Self
}

extension ColumnCountAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariacolcount value: AttributeData) -> Self {
        return self.mutate(key: "aria-colcount", value: value)
    }
}

extension ColumnCountAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariacolcount value: AttributeData) -> Self {
        return self.mutate(key: "aria-colcount", value: value)
    }
}

/// A type that provides the `accessibilityColumnIndex` modifier.
@_documentation(visibility: internal)
public protocol ColumnIndexAccessibilityAttribute: Attribute {
    
    /// Indicate the column index of the element.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .role(.row)
    /// .accessibilityColumnIndex(1)
    /// ```
    ///
    /// - Parameter value: The column index the element is in.
    ///
    /// - Returns: The element
    func accessibilityColumnIndex(_ value: Int) -> Self
}

extension ColumnIndexAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariacolindex value: AttributeData) -> Self {
        return self.mutate(key: "aria-colindex", value: value)
    }
}

extension ColumnIndexAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariacolindex value: AttributeData) -> Self {
        return self.mutate(key: "aria-colindex", value: value)
    }
}

/// A type that provides the `accessibilityColumnSpan` modifier.
@_documentation(visibility: internal)
public protocol ColumnSpanAccessibilityAttribute: Attribute {
    
    /// Indicate the number of columns the element spans.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .role(.columnHeader)
    /// .accessibilityColumnSpan(2)
    /// ```
    ///
    /// - Parameter value: The number of columns to span.
    ///
    /// - Returns: The element
    func accessibilityColumnSpan(_ value: Int) -> Self
}

extension ColumnSpanAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariacolspan value: AttributeData) -> Self {
        return self.mutate(key: "aria-colspan", value: value)
    }
}

extension ColumnSpanAccessibilityAttribute where Self: EmptyNode {
    
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

/// A type that provides the `accessibilityDisabled` modifier.
@_documentation(visibility: internal)
public protocol DisabledAccessibilityAttribute: Attribute {
    
    /// Indicate that the element is perceivable but disabled.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .role(.button)
    /// .accessibilityDisabled()
    /// ```
    ///
    /// - Parameter value: Whether the element is disabled.
    ///
    /// - Returns: The element
    func accessibilityDisabled(_ value: Bool) -> Self
}

extension DisabledAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariadisabled value: AttributeData) -> Self {
        return self.mutate(key: "aria-disabled", value: value)
    }
}

extension DisabledAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariadisabled value: AttributeData) -> Self {
        return self.mutate(key: "aria-disabled", value: value)
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

/// A type that provides the `accessibilityFlow` modifier.
@_documentation(visibility: internal)
public protocol FlowAccessibilityAttribute: Attribute {
    
    /// Suggest an alternate reading order.
    ///
    /// ```swift
    /// Heading1 {
    ///    "Lorem ipsum"
    /// }
    /// .accessibilityFlow(["id", "id"])
    /// Article {
    ///     "Lorem ipsum..."
    /// }
    /// .id("id")
    /// ```
    ///
    /// - Parameter ids: The identifiers of the elements to be read in order.
    ///
    /// - Returns: The element
    func accessibilityFlow(_ ids: [String]) -> Self
    
    /// Suggest an alternate reading order.
    ///
    /// ```swift
    /// Heading1 {
    ///    "Lorem ipsum"
    /// }
    /// .accessibilityFlow("id", "id")
    /// Article {
    ///     "Lorem ipsum..."
    /// }
    /// .id("id")
    /// ```
    ///
    /// - Parameter ids: The identifiers of the elements to be read in order.
    ///
    /// - Returns: The element
    func accessibilityFlow(_ ids: String...) -> Self
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
public protocol HiddenAccessibilityAttribute: Attribute {
    
    /// Indicate whether the element should be announced.
    ///
    /// ```swift
    /// Vector {
    ///    Path {
    ///    }
    ///    .draw("M...")
    /// }
    /// .accessibilityHidden()
    /// ```
    ///
    /// - Parameter value: Whether the element should be announced.
    ///
    /// - Returns: The element
    func accessibilityHidden(_ value: Bool) -> Self
}

extension HiddenAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariahidden value: AttributeData) -> Self {
        return self.mutate(key: "aria-hidden", value: value)
    }
}

extension HiddenAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariahidden value: AttributeData) -> Self {
        return self.mutate(key: "aria-hidden", value: value)
    }
}

/// A type that provides the `accessibilityDisabled` modifier.
@_documentation(visibility: internal)
public protocol InvalidAccessibilityAttribute: Attribute {
    
    /// Indicate the entered value does not conform to the expected format.
    /// 
    /// ```swift
    /// Division {
    /// }
    /// .editable()
    /// .accessibilityInvalid(.grammar)
    /// ```
    /// 
    /// - Parameter value: The reason why the entered value is invalid.
    /// 
    /// - Returns: The element
    func accessibilityInvalid(_ value: Values.Accessibility.Invalid) -> Self
    
    /// Indicate the entered value does not conform to the expected format.
    ///  
    /// ```swift
    /// Input()
    ///    .type(.email)
    ///    .accessibilityInvalid(.true, message: "id")
    /// ```
    ///  
    /// - Parameter value: Whether the entered value is invalid.
    /// - Parameter id: The identifier of the element that provides the error message.
    ///  
    /// - Returns: The element
    func accessibilityInvalid(_ value: Bool, message id: String?) -> Self
}

extension InvalidAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariainvalid value: AttributeData) -> Self {
        return self.mutate(key: "aria-invalid", value: value)
    }
    
    internal func mutate(ariaerrormessage value: AttributeData) -> Self {
        return self.mutate(key: "aria-errormessage", value: value)
    }
}

extension InvalidAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariainvalid value: AttributeData) -> Self {
        return self.mutate(key: "aria-invalid", value: value)
    }
    
    internal func mutate(ariaerrormessage value: AttributeData) -> Self {
        return self.mutate(key: "aria-errormessage", value: value)
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

/// A type that provides the `accessibilityLabels` modifier.
@_documentation(visibility: internal)
public protocol LabelsAccessibilityAttribute: Attribute {
    
    /// Identify the elements that labels the element.
    ///
    /// ```swift
    /// Button {
    /// }
    /// .accessibilityLabels(["id", "id"]])
    /// Label {
    ///     "Lorem ipsum..."
    /// }
    /// .id("id")
    /// ```
    /// - Parameter ids: The identifiers of the elements that serve as labels.
    ///
    /// - Returns: The element
    func accessibilityLabels(_ ids: [String]) -> Self
    
    /// Identify the elements that labels the current element.
    ///
    /// ```swift
    /// Button {
    /// }
    /// .accessibilityLabels("id", "id")
    /// Label {
    ///     "Lorem ipsum..."
    /// }
    /// .id("id")
    /// ```
    /// - Parameter ids: The identifiers of the elements that serve as labels.
    ///
    /// - Returns: The element
    func accessibilityLabels(_ ids: String...) -> Self
}

extension LabelsAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(arialabeledby value: AttributeData) -> Self {
        return self.mutate(key: "aria-labelledby", value: value)
    }
}

extension LabelsAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(arialabeledby value: AttributeData) -> Self {
        return self.mutate(key: "aria-labelledby", value: value)
    }
}

/// A type that provides the `accessibilityLevel` modifier.
@_documentation(visibility: internal)
public protocol LevelAccessibilityAttribute: Attribute {
    
    /// Announce the hierarchical level of the element.
    ///
    /// ```swift
    /// Division {
    ///     "Lorem ipsum"
    /// }
    /// .role(.heading)
    /// .accessibilityLevel(2)
    /// ```
    /// - Parameter value: The level the element is at.
    ///
    /// - Returns: The element
    func accessibilityLevel(_ value: Int) -> Self
}

extension LevelAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(arialevel value: AttributeData) -> Self {
        return self.mutate(key: "aria-level", value: value)
    }
}

extension LevelAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(arialevel value: AttributeData) -> Self {
        return self.mutate(key: "aria-level", value: value)
    }
}

/// A type that provides the `accessibilityLive` modifier.
@_documentation(visibility: internal)
public protocol LiveAccessibilityAttribute: Attribute {
    
    /// Indicate that the element will be updated and how.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .accessibilityLive(.polite)
    /// ```
    /// - Parameter value: The manner on how to notify.
    ///
    /// - Returns: The element
    func accessibilityLive(_ value: Values.Accessibility.Live) -> Self
}

extension LiveAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(arialive value: AttributeData) -> Self {
        return self.mutate(key: "aria-live", value: value)
    }
}

extension LiveAccessibilityAttribute where Self: EmptyNode {
    
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

/// A type that provides the `accessibilityMultiline` modifier.
@_documentation(visibility: internal)
public protocol MultilineAccessibilityAttribute: Attribute {
    
    /// Indicate whether a text control accepts multiple lines or a single line.
    /// 
    /// ```swift
    /// Division {
    /// }
    /// .role(.textbox)
    /// .accessibilityMultiline(true)
    /// ```
    /// - Parameter value: Whether the text control accepts multiple lines.
    ///
    /// - Returns: The element
    func accessibilityMultiline(_ value: Bool) -> Self
}

extension MultilineAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariamultiline value: AttributeData) -> Self {
        return self.mutate(key: "aria-multiline", value: value)
    }
}

extension MultilineAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariamultiline value: AttributeData) -> Self {
        return self.mutate(key: "aria-multiline", value: value)
    }
}

/// A type that provides the `accessibilityMultiselect` modifier.
@_documentation(visibility: internal)
public protocol MultiselectAccessibilityAttribute: Attribute {
    
    /// Indicate that the user may select more than one item.
    ///
    /// ```swift
    /// UnorderedList {
    ///    ListItem {
    ///       "Lorem ipsum"
    ///    }
    /// }
    /// .role(.listbox)
    /// .accessibilityMultiselect(true)
    /// ```
    /// - Parameter value: Whether the element is multiselectable.
    ///
    /// - Returns: The element
    func accessibilityMultiselect(_ value: Bool) -> Self
}

extension MultiselectAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariamultiselectable value: AttributeData) -> Self {
        return self.mutate(key: "aria-multiselectable", value: value)
    }
}

extension MultiselectAccessibilityAttribute where Self: EmptyNode {
    
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

/// A type that provides the `accessibilityOwns` modifier.
@_documentation(visibility: internal)
public protocol OwnsAccessibilityAttribute: Attribute {
    
    /// Identifies elements...
    ///
    /// ```swift
    /// Division {
    /// }
    /// .accessibilityOwns(["id", "id"])
    /// ```
    /// - Parameter ids: The identifiers to associate the element with.
    ///
    /// - Returns: The element
    func accessibilityOwns(_ ids: [String]) -> Self
    
    /// Identifies elements...
    ///
    /// ```swift
    /// Division {
    /// }
    /// .accessibilityOwns("id", "id")
    /// ```
    /// - Parameter ids: The identifiers to associate the element with.
    ///
    /// - Returns: The element
    func accessibilityOwns(_ ids: String...) -> Self
}

extension OwnsAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariaowns value: AttributeData) -> Self {
        return self.mutate(key: "aria-owns", value: value)
    }
}

extension OwnsAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariaowns value: AttributeData) -> Self {
        return self.mutate(key: "aria-owns", value: value)
    }
}

/// A type that provides the `accessibilityHint` modifier.
@_documentation(visibility: internal)
public protocol HintAccessibilityAttribute: Attribute {
    
    /// Provide a short hint.
    /// 
    /// ```swift
    /// Division {
    /// }
    /// .role(.textbox)
    /// .accessibilityHint("Lorem ipsum")
    /// ```
    /// - Parameter value: A hint to give more context.
    ///
    /// - Returns: The element
    func accessibilityHint(_ value: String) -> Self
    
    /// Provide a localized short hint.
    /// 
    /// ```swift
    /// Division {
    /// }
    /// .role(.textbox)
    /// .accessibilityHint("Lorem ipsum")
    /// ```
    /// - Parameter localizedKey: The string key to be translated.
    /// - Parameter tableName: The translation table to look in.
    ///
    /// - Returns: The element
    func accessibilityHint(_ localized: LocalizedStringKey, tableName: String?) -> Self
    
    /// Provide a short hint without localization.
    /// 
    /// ```swift
    /// Division {
    /// }
    /// .role(.textbox)
    /// .accessibilityHint(verbatim: "Lorem ipsum")
    /// ```
    /// - Parameter value: A hint to give more context.
    ///
    /// - Returns: The element
    func accessibilityHint(verbatim value: String) -> Self
}

extension HintAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariaplaceholder value: AttributeData) -> Self {
        return self.mutate(key: "aria-placeholder", value: value)
    }
}

extension HintAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariaplaceholder value: AttributeData) -> Self {
        return self.mutate(key: "aria-placeholder", value: value)
    }
}

/// A type that provides the `accessibilityPosition` modifier.
@_documentation(visibility: internal)
public protocol PositionAccessibilityAttribute: Attribute {
    
    /// Indicate the position of the element in a set.
    ///  
    /// ```swift
    /// UnorderedList {
    ///    ListItem {
    ///       "Lorem ipsum"
    ///    }
    ///    .role(.option)
    ///    .accessibilityPosition(5, in: 10)
    /// }
    /// .role(listbox)
    /// ```
    /// 
    /// - Parameter index: The position index the element is in.
    /// - Parameter size: The total number of items in the set.
    /// 
    /// - Returns: The element
    func accessibilityPosition(_ index: Int, in size: Int) -> Self
}

extension PositionAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariaposinset value: AttributeData) -> Self {
        return self.mutate(key: "aria-posinset", value: value)
    }
    
    internal func mutate(ariasetsize value: AttributeData) -> Self {
        return self.mutate(key: "aria-setsize", value: value)
    }
}

extension PositionAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariaposinset value: AttributeData) -> Self {
        return self.mutate(key: "aria-posinset", value: value)
    }
    
    internal func mutate(ariasetsize value: AttributeData) -> Self {
        return self.mutate(key: "aria-setsize", value: value)
    }
}

/// A type that provides the `accessibilityPressed` modifier.
@_documentation(visibility: internal)
public protocol PressedAccessibilityAttribute: Attribute {
    
    /// Indicate the current state of a toggle element.
    ///
    /// ```swift
    /// Button {
    /// }
    /// .accessibilityPressed(true)
    /// ```
    /// - Parameter value: Whether the element is pressed.
    ///
    /// - Returns: The element
    func accessibilityPressed(_ value: Bool) -> Self
}

extension PressedAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariapressed value: AttributeData) -> Self {
        return self.mutate(key: "aria-pressed", value: value)
    }
}

extension PressedAccessibilityAttribute where Self: EmptyNode {
    
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

/// A type that provides the `accessibilityRelevant` modifier.
@_documentation(visibility: internal)
public protocol RelevantAccessibilityAttribute: Attribute {
    
    /// Decide what region changes should be relevant to announce.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .role(.alert)
    /// .accessibilityRelevant([.additions, .text])
    /// ```
    /// - Parameter values: The relevant region changes to announce.
    ///
    /// - Returns: The element
    func accessibilityRelevant(_ values: [Values.Accessibility.Relevant]) -> Self
    
    /// Decide what region changes should be relevant to announce.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .role(.alert)
    /// .accessibilityRelevant(.additions, .text)
    /// ```
    /// - Parameter values: The relevant region changes to announce.
    ///
    /// - Returns: The element
    func accessibilityRelevant(_ values: Values.Accessibility.Relevant...) -> Self
}

extension RelevantAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariarelevant value: AttributeData) -> Self {
        return self.mutate(key: "aria-relevant", value: value)
    }
}

extension RelevantAccessibilityAttribute where Self: EmptyNode {
    
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
    /// - Parameter value: Whether an input is required.
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

/// A type that provides the `accessibilityRowCount` modifier.
@_documentation(visibility: internal)
public protocol RowCountAccessibilityAttribute: Attribute {
    
    /// Indicate the total number of rows in a element.
    /// 
    /// ```swift
    /// Division {
    /// }
    /// .role(.grid)
    /// .accessibilityRowCount(941)
    /// ```
    ///
    /// - Parameter value: The total rows within the element.
    ///
    /// - Returns: The element
    func accessibilityRowCount(_ value: Int) -> Self
}

extension RowCountAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariarowcount value: AttributeData) -> Self {
        return self.mutate(key: "aria-rowcount", value: value)
    }
}

extension RowCountAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariarowcount value: AttributeData) -> Self {
        return self.mutate(key: "aria-rowcount", value: value)
    }
}

/// A type that provides the `accessibilityRowIndex` modifier.
@_documentation(visibility: internal)
public protocol RowIndexAccessibilityAttribute: Attribute {
    
    /// Indicate an element's row index.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .role(.row)
    /// .accessibilityRowIndex(1)
    /// ```
    ///
    /// - Parameter value: The row index the element is in.
    ///
    /// - Returns: The element
    func accessibilityRowIndex(_ value: Int) -> Self
}

extension RowIndexAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariarowindex value: AttributeData) -> Self {
        return self.mutate(key: "aria-rowindex", value: value)
    }
}

extension RowIndexAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariarowindex value: AttributeData) -> Self {
        return self.mutate(key: "aria-rowindex", value: value)
    }
}

/// A type that provides the `accessibilityRowSpan` modifier.
@_documentation(visibility: internal)
public protocol RowSpanAccessibilityAttribute: Attribute {
    
    /// Indicate the number of rows the element spans.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .role(.columnHeader)
    /// .accessibilityRowSpan(2)
    /// ```
    ///
    /// - Parameter value: The number of rows to span.
    ///
    /// - Returns: The element
    func accessibilityRowSpan(_ value: Int) -> Self
}

extension RowSpanAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariarowspan value: AttributeData) -> Self {
        return self.mutate(key: "aria-rowspan", value: value)
    }
}

extension RowSpanAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariarowspan value: AttributeData) -> Self {
        return self.mutate(key: "aria-rowspan", value: value)
    }
}

/// A type that provides the `accessibilitySelected` modifier.
@_documentation(visibility: internal)
public protocol SelectedAccessibilityAttribute: Attribute {
    
    /// Indicate the selected state of the element.
    ///
    /// ```swift
    /// Division {
    ///     Division {
    ///         Paragraph {
    ///             "Lorem ipsum"
    ///         }
    ///     }
    ///     .role(.tab)
    ///     .accessibilitySelected(false)
    ///     Division {
    ///         Paragraph {
    ///             "Lorem ipsum"
    ///         }
    ///     }
    ///     .role(.tab)
    /// }
    /// .role(.tablist)
    /// ```
    ///
    /// - Parameter value: Whether the element got selected.
    ///
    /// - Returns: The element
    func accessibilitySelected(_ value: Bool) -> Self
}

extension SelectedAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariaselected value: AttributeData) -> Self {
        return self.mutate(key: "aria-selected", value: value)
    }
}

extension SelectedAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariaselected value: AttributeData) -> Self {
        return self.mutate(key: "aria-selected", value: value)
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

/// A type that provides the `accessibilityMaximumValue` modifier.
@_documentation(visibility: internal)
public protocol MaximumValueAccessibilityAttribute: Attribute {
    
    /// Indicate the maximum bound for the range.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .role(.meter)
    /// .accessibilityMaximumValue(20.0)
    /// ```
    ///
    /// - Parameter value: The value to consider maximum.
    ///
    /// - Returns: The element
    func accessibilityMaximumValue(_ value: Float) -> Self
}

extension MaximumValueAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariavaluemax value: AttributeData) -> Self {
        return self.mutate(key: "aria-valuemax", value: value)
    }
}

extension MaximumValueAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariavaluemax value: AttributeData) -> Self {
        return self.mutate(key: "aria-valuemax", value: value)
    }
}

/// A type that provides the `accessibilityMinimumValue` modifier.
@_documentation(visibility: internal)
public protocol MinimumValueAccessibilityAttribute: Attribute {
    
    /// Indicate the minimum bound for the range.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .role(.meter)
    /// .accessibilityMinimumValue(20.0)
    /// ```
    ///
    /// - Parameter value: The value to consider minimum.
    ///
    /// - Returns: The element
    func accessibilityMinimumValue(_ value: Float) -> Self
}

extension MinimumValueAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariavaluemin value: AttributeData) -> Self {
        return self.mutate(key: "aria-valuemin", value: value)
    }
}

extension MinimumValueAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariavaluemin value: AttributeData) -> Self {
        return self.mutate(key: "aria-valuemin", value: value)
    }
}

/// A type that provides the `accessibilityValue` modifier.
@_documentation(visibility: internal)
public protocol ValueAccessibilityAttribute: Attribute {
    
    /// Indicate the current value of the range.
    ///  
    /// ```swift
    /// Division {
    /// }
    /// .role(.meter)
    /// .accessibilityValue(20.0, description: "Lorem ipsum")
    /// ```
    ///  
    /// - Parameter value: The current value within the range.
    /// - Parameter text: The alternate text to describe the value.
    ///  
    /// - Returns: The element
    func accessibilityValue(_ value: Float, description text: String?) -> Self
    
    /// Indicate the current value of the range.
    /// 
    /// ```swift
    /// Division {
    /// }
    /// .role(.meter)
    /// .accessibilityValue(20.0, alternate: "Lorem ipsum")
    /// ```
    /// 
    /// - Parameter value: The current value within the range.
    /// - Parameter localizedKey:The localized key to describe the value.
    /// - Parameter tableName: The translation table to look in.
    /// 
    /// - Returns: The element
    func accessibilityValue(_ value: Float, description localizedKey: LocalizedStringKey, tableName: String?) -> Self
}

extension ValueAccessibilityAttribute where Self: ContentNode {
    
    internal func mutate(ariavaluenow value: AttributeData) -> Self {
        return self.mutate(key: "aria-valuenow", value: value)
    }
    
    internal func mutate(ariavaluetext value: AttributeData) -> Self {
        return self.mutate(key: "aria-valuetext", value: value)
    }
}

extension ValueAccessibilityAttribute where Self: EmptyNode {
    
    internal func mutate(ariavaluenow value: AttributeData) -> Self {
        return self.mutate(key: "aria-valuenow", value: value)
    }
    
    internal func mutate(ariavaluetext value: AttributeData) -> Self {
        return self.mutate(key: "aria-valuetext", value: value)
    }
}
