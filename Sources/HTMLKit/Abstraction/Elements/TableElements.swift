/*
 Abstract:
 The file contains the table elements. The html-element 'table' only allows these elements to be its descendants.

 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias for the element ColumnGroup.
///
/// Colgroup is the official tag and can be used instead of ColumnGroup.
///
/// ```html
/// <colgroup></colgroup>
/// ```
public typealias Colgroup = ColumnGroup

/// The alias for the element Column.
///
/// Col is the official tag and can be used instead of Column.
///
/// ```html
/// <col></col>
/// ```
public typealias Col = Column

/// The alias for the element TableBody.
///
/// Tbody is the official tag and can be used instead of TableBody.
///
/// ```html
/// <tbody></tbody>
/// ```
public typealias Tbody = TableBody

/// The alias for the element TableHead.
///
/// Thead is the official tag and can be used instead of TableHead.
///
/// ```html
/// <thead></thead>
/// ```
public typealias Thead = TableHead

/// The alias for the element TableFoot.
///
/// Tfoot is the official tag and can be used instead of TableFoot.
///
/// ```html
/// <tfoot></tfoot>
/// ```
public typealias Tfoot = TableFoot

/// The alias for the element TableRow.
///
/// Tr is the official tag and can be used instead of TableRow.
///
/// ```html
/// <tr></tr>
/// ```
public typealias Tr = TableRow

/// The alias for the element DataCell.
///
/// Td is the official tag and can be used instead of DataCell.
///
/// ```html
/// <td></td>
/// ```
public typealias Td = DataCell

/// The alias for the element HeaderCell.
///
/// Th is the official tag and can be used instead of HeaderCell.
///
/// ```html
/// <th></th>
/// ```
public typealias Th = HeaderCell

/// The element represents the title of the table.
///
/// ```html
/// <caption></caption>
/// ```
public struct Caption: ContentNode, TableElement {

    internal var name: String { "caption" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Caption) -> Caption) -> Caption {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Caption, T) -> Caption) -> Caption {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Caption: GlobalAriaAttributes {
        
    public func aria(atomic value: Bool) -> Caption {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Caption {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Caption {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Caption {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Caption {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Caption {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Caption {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Caption {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Caption {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Caption {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Caption {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Caption {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Caption {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Caption {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Caption {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Caption {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Caption {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Caption {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Caption {
        return mutate(ariaroledescription: value)
    }
}

/// The element specifies a group of one or more columns.
///
/// ```html
/// <colgroup></colgroup>
/// ```
public struct ColumnGroup: ContentNode, TableElement {

    internal var name: String { "colgroup" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (ColumnGroup) -> ColumnGroup) -> ColumnGroup {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (ColumnGroup, T) -> ColumnGroup) -> ColumnGroup {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension ColumnGroup: SpanAttribute {

    public func span(_ size: Int) -> ColumnGroup {
        return mutate(span: size)
    }
}

/// The element represents a column in a table.
///
/// ```html
/// <col></col>
/// ```
public struct Column: ContentNode, TableElement {

    internal var name: String { "col" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Column) -> Column) -> Column {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Column, T) -> Column) -> Column {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Column: SpanAttribute {
    
    public func span(_ size: Int) -> Column {
        return mutate(span: size)
    }
}

/// The element represents a block of rows in a table.
///
/// ```html
/// <tbody></tbody>
/// ```
public struct TableBody: ContentNode, TableElement {

    internal var name: String { "tbody" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TableBody) -> TableBody) -> TableBody {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (TableBody, T) -> TableBody) -> TableBody {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension TableBody: GlobalAriaAttributes, WidthAttribute, HeightAttribute {
    
    public func width(_ size: Int) -> TableBody {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> TableBody {
        return mutate(height: size)
    }
    
    public func aria(atomic value: Bool) -> TableBody {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> TableBody {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> TableBody {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> TableBody {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> TableBody {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> TableBody {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> TableBody {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> TableBody {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> TableBody {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> TableBody {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> TableBody {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> TableBody {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> TableBody {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> TableBody {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> TableBody {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> TableBody {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> TableBody {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> TableBody {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> TableBody {
        return mutate(ariaroledescription: value)
    }
}

/// The element represents the block of rows that consist of the column labels.
///
/// ```html
/// <thead></thead>
/// ```
public struct TableHead: ContentNode, TableElement {

    internal var name: String { "thead" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TableHead) -> TableHead) -> TableHead {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (TableHead, T) -> TableHead) -> TableHead {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension TableHead: GlobalAriaAttributes, WidthAttribute, HeightAttribute {

    public func width(_ size: Int) -> TableHead {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> TableHead {
        return mutate(height: size)
    }
    
    public func aria(atomic value: Bool) -> TableHead {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> TableHead {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> TableHead {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> TableHead {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> TableHead {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> TableHead {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> TableHead {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> TableHead {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> TableHead {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> TableHead {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> TableHead {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> TableHead {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> TableHead {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> TableHead {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> TableHead {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> TableHead {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> TableHead {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> TableHead {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> TableHead {
        return mutate(ariaroledescription: value)
    }
}

/// The element represents the block of rows that consist of the column summaries.
///
/// ```html
/// <tfoot></tfoot>
/// ```
public struct TableFoot: ContentNode, TableElement {

    internal var name: String { "tfoot" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TableFoot) -> TableFoot) -> TableFoot {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (TableFoot, T) -> TableFoot) -> TableFoot {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension TableFoot: GlobalAriaAttributes {
    
    public func aria(atomic value: Bool) -> TableFoot {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> TableFoot {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> TableFoot {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> TableFoot {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> TableFoot {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> TableFoot {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> TableFoot {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> TableFoot {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> TableFoot {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> TableFoot {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> TableFoot {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> TableFoot {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> TableFoot {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> TableFoot {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> TableFoot {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> TableFoot {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> TableFoot {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> TableFoot {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> TableFoot {
        return mutate(ariaroledescription: value)
    }
}

/// The element represents a row of cells in a table.
///
/// ```html
/// <tr></tr>
/// ```
public struct TableRow: ContentNode, TableElement {

    internal var name: String { "tr" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TableRow) -> TableRow) -> TableRow {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (TableRow, T) -> TableRow) -> TableRow {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension TableRow: GlobalAriaAttributes, WidthAttribute, HeightAttribute {

    public func width(_ size: Int) -> TableRow {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> TableRow {
        return mutate(height: size)
    }
    
    public func aria(atomic value: Bool) -> TableRow {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> TableRow {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> TableRow {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> TableRow {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> TableRow {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> TableRow {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> TableRow {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> TableRow {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> TableRow {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> TableRow {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> TableRow {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> TableRow {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> TableRow {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> TableRow {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> TableRow {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> TableRow {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> TableRow {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> TableRow {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> TableRow {
        return mutate(ariaroledescription: value)
    }
}

/// The element represents a data cell in a table.
///
/// ```html
/// <td></td>
/// ```
public struct DataCell: ContentNode, TableElement {

    internal var name: String { "td" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (DataCell) -> DataCell) -> DataCell {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (DataCell, T) -> DataCell) -> DataCell {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension DataCell: GlobalAriaAttributes, ColumnSpanAttribute, RowSpanAttribute, HeaderAttribute {

    public func columnSpan(_ size: Int) -> DataCell {
        return mutate(colspan: size)
    }
    
    public func rowSpan(_ size: Int) -> DataCell {
        return mutate(rowspan: size)
    }
    
    public func headers(_ value: String) -> DataCell {
        return mutate(headers: value)
    }
    
    public func aria(atomic value: Bool) -> DataCell {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> DataCell {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> DataCell {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> DataCell {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> DataCell {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> DataCell {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> DataCell {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> DataCell {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> DataCell {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> DataCell {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> DataCell {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> DataCell {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> DataCell {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> DataCell {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> DataCell {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> DataCell {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> DataCell {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> DataCell {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> DataCell {
        return mutate(ariaroledescription: value)
    }
}

/// The element represents a header cell in a table.
///
/// ```html
/// <th></th>
/// ```
public struct HeaderCell: ContentNode, TableElement {

    internal var name: String { "th" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal  var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (HeaderCell) -> HeaderCell) -> HeaderCell {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (HeaderCell, T) -> HeaderCell) -> HeaderCell {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension HeaderCell: GlobalAriaAttributes, ColumnSpanAttribute, RowSpanAttribute, HeaderAttribute, ScopeAttribute {

    public func columnSpan(_ size: Int) -> HeaderCell {
        return mutate(colspan: size)
    }
    
    public func rowSpan(_ size: Int) -> HeaderCell {
        return mutate(rowspan: size)
    }
    
    public func headers(_ value: String) -> HeaderCell {
        return mutate(headers: value)
    }
    
    public func scope(_ value: String) -> HeaderCell {
        return mutate(scope: value)
    }
    
    public func aria(atomic value: Bool) -> HeaderCell {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> HeaderCell {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> HeaderCell {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> HeaderCell {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> HeaderCell {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> HeaderCell {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> HeaderCell {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> HeaderCell {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> HeaderCell {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> HeaderCell {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> HeaderCell {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> HeaderCell {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> HeaderCell {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> HeaderCell {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> HeaderCell {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> HeaderCell {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> HeaderCell {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> HeaderCell {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> HeaderCell {
        return mutate(ariaroledescription: value)
    }
}

extension HeaderCell: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [LocalizedStringKey(key: localizedKey)]
    }

    public init(_ localizedKey: String, with context: some Encodable) {
        self.content = [LocalizedStringKey(key: localizedKey, context: context)]
    }
}
