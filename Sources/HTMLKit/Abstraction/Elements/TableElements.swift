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
public struct Caption: ContentElement {

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
}

/// The element specifies a group of one or more columns.
///
/// ```html
/// <colgroup></colgroup>
/// ```
public struct ColumnGroup: ContentElement {

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
}

extension ColumnGroup: SpanAttribute {

    public func span(_ size: Int) -> ColumnGroup {
        return mutate(span: size)
    }
    
    public func span(_ size: Property<Int>) -> ColumnGroup {
        return mutate(span: size)
    }
}

/// The element represents a column in a table.
///
/// ```html
/// <col></col>
/// ```
public struct Column: ContentElement {

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
}

extension Column: SpanAttribute {
    
    public func span(_ size: Int) -> Column {
        return mutate(span: size)
    }
    
    public func span(_ size: Property<Int>) -> Column {
        return mutate(span: size)
    }
}

/// The element represents a block of rows in a table.
///
/// ```html
/// <tbody></tbody>
/// ```
public struct TableBody: ContentElement {

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
}

extension TableBody: WidthAttribute, HeightAttribute {
    
    public func width(_ size: Int) -> TableBody {
        return mutate(width: size)
    }
    
    public func width(_ size: Property<Int>) -> TableBody {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> TableBody {
        return mutate(height: size)
    }
    
    public func height(_ size: Property<Int>) -> TableBody {
        return mutate(height: size)
    }
}

/// The element represents the block of rows that consist of the column labels.
///
/// ```html
/// <thead></thead>
/// ```
public struct TableHead: ContentElement {

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
}

extension TableHead: WidthAttribute, HeightAttribute {

    public func width(_ size: Int) -> TableHead {
        return mutate(width: size)
    }
    
    public func width(_ size: Property<Int>) -> TableHead {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> TableHead {
        return mutate(height: size)
    }
    
    public func height(_ size: Property<Int>) -> TableHead {
        return mutate(height: size)
    }
}

/// The element represents the block of rows that consist of the column summaries.
///
/// ```html
/// <tfoot></tfoot>
/// ```
public struct TableFoot: ContentElement {

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
}

/// The element represents a row of cells in a table.
///
/// ```html
/// <tr></tr>
/// ```
public struct TableRow: ContentElement {

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
}

extension TableRow: WidthAttribute, HeightAttribute {

    public func width(_ size: Int) -> TableRow {
        return mutate(width: size)
    }
    
    public func width(_ size: Property<Int>) -> TableRow {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> TableRow {
        return mutate(height: size)
    }
    
    public func height(_ size: Property<Int>) -> TableRow {
        return mutate(height: size)
    }
}

/// The element represents a data cell in a table.
///
/// ```html
/// <td></td>
/// ```
public struct DataCell: ContentElement {

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
}

extension DataCell: ColumnSpanAttribute, RowSpanAttribute, HeaderAttribute {

    public func columnSpan(_ size: Int) -> DataCell {
        return mutate(colspan: size)
    }
    
    public func columnSpan(_ size: Property<Int>) -> DataCell {
        return mutate(colspan: size)
    }
    
    public func rowSpan(_ size: Int) -> DataCell {
        return mutate(rowspan: size)
    }
    
    public func rowSpan(_ size: Property<Int>) -> DataCell {
        return mutate(rowspan: size)
    }
    
    public func headers(_ value: String) -> DataCell {
        return mutate(headers: value)
    }
    
    public func headers(_ value: Property<String>) -> DataCell {
        return mutate(headers: value)
    }
}

/// The element represents a header cell in a table.
///
/// ```html
/// <th></th>
/// ```
public struct HeaderCell: ContentElement {

    internal var name: String { "th" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}

extension HeaderCell: ColumnSpanAttribute, RowSpanAttribute, HeaderAttribute, ScopeAttribute {
    
    public func columnSpan(_ size: Int) -> HeaderCell {
        return mutate(colspan: size)
    }
    
    public func columnSpan(_ size: Property<Int>) -> HeaderCell {
        return mutate(colspan: size)
    }
    
    public func rowSpan(_ size: Int) -> HeaderCell {
        return mutate(rowspan: size)
    }
    
    public func rowSpan(_ size: Property<Int>) -> HeaderCell {
        return mutate(rowspan: size)
    }
    
    public func headers(_ value: String) -> HeaderCell {
        return mutate(headers: value)
    }
    
    public func headers(_ value: Property<String>) -> HeaderCell {
        return mutate(headers: value)
    }
    
    public func scope(_ value: String) -> HeaderCell {
        return mutate(scope: value)
    }
    
    public func scope(_ value: Property<String>) -> HeaderCell {
        return mutate(scope: value)
    }
}

extension HeaderCell: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [LocalizedStringKey(key: localizedKey)]
    }
    
    public init<T: Encodable>(_ localizedKey: String, with context: Property<T>) {
        self.content = [LocalizedStringKey(key: localizedKey, context: context)]
    }
}
