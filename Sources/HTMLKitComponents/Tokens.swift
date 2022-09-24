/*
 Abstract:
 The file contains the class tokens for the css.
 */

public enum Tokens {
    
    /// A direction for elements.
    public enum FlowDirection: String {
        
        /// Aligns the elements vertically.
        case vertical = "direction:vertical"
        
        /// Aligns the elements horizontally.
        case horizontal = "direction:horizontal"
    }

    /// A alignment for text along the horizontal axis.
    public enum TextAlignment: String {
        
        /// Aligns the text left.
        case left = "alignment:left"
        
        /// Aligns the text in the middle.
        case center = "alignment:center"
        
        /// Aligns the text right.
        case right = "alignment:right"
    }

    /// A size for column.
    public enum ColumnSize: String {
        
        /// Sets the size to 8.3 %.
        case one = "size:1"
        
        /// Sets the size to 16.67 %.
        case two = "size:2"
        
        /// Sets the size to 25 %.
        case three = "size:3"
        
        /// Sets the size to 33.3 %.
        case four = "size:4"
        
        /// Sets the size to 41.67 %.
        case five = "size:5"
        
        /// Sets the size to 50 %.
        case six = "size:6"
        
        /// Sets the size to 58.3 %.
        case seven = "size:7"
        
        /// Sets the size to 66.67 %.
        case eight = "size:8"
        
        /// Sets the size to 75 %.
        case nine = "size:9"
        
        /// Sets the size to 83.3%.
        case ten = "size:10"
        
        /// Sets the size to 91.67 %.
        case eleven = "size:11"
        
        /// Sets the size to 100 %.
        case twelve = "size:12"
    }

    /// A color for text.
    public enum ForegroundColor: String {
        
        /// Changes the foreground color to black.
        case black = "color:black"
        
        /// Changes the foreground color to white.
        case white = "color:white"
        
        /// Changes the foreground color to blue.
        case blue = "color:blue"
        
        /// Changes the foreground color to brown.
        case brown = "color:brown"
        
        /// Changes the foreground color to cyan.
        case cyan = "color:cyan"
        
        /// Changes the foreground color to green.
        case green = "color:green"
        
        /// Changes the foreground color to indigo.
        case indigo = "color:indigo"
        
        /// Changes the foreground color to mint.
        case mint = "color:mint"
        
        /// Changes the foreground color to pink.
        case pink = "color:pink"
        
        /// Changes the foreground color to purple.
        case purple = "color:purple"
        
        /// Changes the foreground color to red.
        case red = "color:red"
        
        /// Changes the foreground color to teal.
        case teal = "color:teal"
        
        /// Changes the foreground color to orange.
        case orange = "color:orange"
        
        /// Changes the foreground color to yellow.
        case yellow = "color:yellow"
        
        /// Changes the foreground color to gray.
        case gray = "color:gray"
        
        /// Changes the foreground color to silver.
        case silver = "color:silver"
        
        /// Changes the foreground color to black.
        case highlight = "color:highlight"
        
        /// Changes the foreground color to black.
        case primary = "color:primary"
        
        /// Changes the foreground color to black.
        case secondary = "color:secondary"
    }

    /// A size for text.
    public enum FontSize: String {
        
        /// Changes the size to small.
        case small = "size:small"
        
        /// Changes the size to medium.
        case medium = "size:medium"
        
        /// Changes the size to large.
        case large = "size:large"
    }

    /// A transformation for the text.
    public enum TextTransformation: String {
        
        /// Converts all characters to uppercase.
        case uppercase = "transformation:uppercase"
        
        /// Converts all characters to lowercase.
        case lowercase = "transformation:lowercase"
        
        /// Capitalizes the first letter of each word.
        case capitalize = "transformation:capitalize"
    }

    /// A weight for text.
    public enum FontWeight: String {
        
        /// Sets the weight to 100.
        case thin = "weight:thin"
        
        /// Sets the weight to 200.
        case ultraLight = "weight:ultralight"
        
        /// Sets the weight to 300.
        case light = "weight:light"
        
        /// Sets the weight to 400.
        case regular = "weight:regular"
        
        /// Sets the weight to 500.
        case medium = "weight:medium"
        
        /// Sets the weight to 600.
        case semibold = "weight:semibold"
        
        /// Sets the weight to 700.
        case bold = "weight:bold"

        /// Sets the weight to 900.
        case heavy = "weight:heavy"
        
        /// Sets the weight to 950.
        case black = "weight:black"
    }

    /// A decoration for text.
    public enum TextDecoration: String {
        
        case underline = "decoration:underline"
        
        case overline = "decoration:overline"
        
        case strikeThrough = "decoration:strikethrough"
        
        case none = "decoration:none"
    }

    public enum FontStyle: String {
        
        case italic = "style:italic"
        
        case oblique = "style:oblique"
    }

    public enum BackgroundColor: String {
        
        /// Changes the background color to black.
        case black = "background:black"
        
        /// Changes the background color to white.
        case white = "background:white"
        
        /// Changes the background color to blue.
        case blue = "background:blue"
        
        /// Changes the background color to brown.
        case brown = "background:brown"
        
        /// Changes the background color to cyan.
        case cyan = "background:cyan"
        
        /// Changes the background color to green.
        case green = "background:green"
        
        /// Changes the background color to indigo.
        case indigo = "background:indigo"
        
        /// Changes the background color to mint.
        case mint = "background:mint"
        
        /// Changes the background color to pink.
        case pink = "background:pink"
        
        /// Changes the background color to purple.
        case purple = "background:purple"
        
        /// Changes the background color to red.
        case red = "background:red"
        
        /// Changes the background color to teal.
        case teal = "background:teal"
        
        /// Changes the background color to ornage.
        case orange = "background:orange"
        
        /// Changes the background color to yellow.
        case yellow = "background:yellow"
        
        /// Changes the background color to gray.
        case gray = "background:gray"
        
        /// Changes the background color to silver.
        case silver = "background:silver"
        
        case highlight = "background:highlight"
        
        case primary = "background:primary"
        
        case secondary = "background:secondary"
        
        case transparent = "background:transparent"
    }

    /// A resize for an element.
    public enum ObjectFit: String {
        
        /// Resizes the content to fit within the parent.
        case contain = "fit:contain"
        
        /// Resizes the content to fill the parent. The overflow will be clipped.
        case cover = "fit:cover"
        
        /// Resizes the content to fill the parent. If necessary it will be streched or squished.
        case fill = "fit:fill"
        
        case scaleDown = "fit:scaledown"
        
        /// Does not resize.
        case none = "fit:none"
    }

    public enum OpacityValue: String {
        
        case intransparent = "opacity:intransparent"
        
        case transparent = "opacity:transparent"
    }

    /// A offset for a column.
    public enum ColumnOffset: String {
        
        /// Sets the offset to 8.3 %.
        case one = "offset:1"
        
        /// Sets the offset to 16.67 %.
        case two = "offset:2"
        
        /// Sets the offset to 25 %.
        case three = "offset:3"
        
        /// Sets the offset to 33.33 %.
        case four = "offset:4"
        
        /// Sets the offset to 41.67 %.
        case five = "offset:5"
        
        /// Sets the offset to 50 %.
        case six = "offset:6"
        
        /// Sets the offset to  58.3 %.
        case seven = "offset:7"
        
        /// Sets the offset to  66.7 %.
        case eight = "offset:8"
        
        /// Sets the offset to 75 %.
        case nine = "offset:9"
        
        /// Sets the offset to 83.3 %.
        case ten = "offset:10"
        
        /// Sets the offset to 91.67 %.
        case eleven = "offset:11"
    }

    public enum ImageScale: String {
        
        case small = "scale:small"
        case medium = "scale:medium"
        case large = "scale:large"
    }

    public enum ClipShape: String {
        
        case smallrounded = "shape:smallrounded"
        case largerounded = "shape:largerounded"
        case circle = "shape:circle"
    }

    /// Position along the z-axis.
    public enum PositionIndex: String {
        
        /// Sets the stack order to 1.
        case one = "zindex:1"
        
        /// Sets the stack order to 2.
        case two = "zindex:2"
        
        /// Sets the stack order to 3.
        case three = "zindex:3"
        
        /// Sets the stack order to 4.
        case four = "zindex:4"
        
        /// Sets the stack order to 5.
        case five = "zindex:5"
    }

    /// A style for text.
    public enum TextStyle: String {
        
        /// Formats the text as title.
        case title = "style:title"
        
        /// Formats the text as headline.
        case headline = "style:headline"
        
        /// Formats the text as subheadline.
        case subheadline = "style:subheadline"
        
        /// Formats the text as body.
        case body = "style:body"
        
        /// Formats the text as callout.
        case callout = "style:callout"
        
        /// Formats the text as caption.
        case caption = "style:caption"
        
        /// Formats the text as footnote.
        case footnote = "style:footnote"
        
        /// Formats the text as code.
        case code = "style:code"
    }

    /// A alignment along the vertically axis.
    public enum VerticalAlignment: String {
        
        /// Aligns at the top.
        case top = "alignment:top"
        
        /// Aligns in the middle.
        case center = "alignment:center"
        
        /// Aligns at the bottom.
        case bottom = "alignment:bottom"
        
        /// Aligns with the parent's baseline.
        case baseline = "alignment:baseline"
    }

    /// A alignment along the horizontal axis.
    public enum HorizontalAlignment: String {
        
        /// Aligns left.
        case leading = "alignment:leading"
        
        /// Aligns center.
        case center = "alignment:center"
        
        /// Aligns right.
        case trailing = "alignment:trailing"
    }

    public enum ContentSpace: String {
        
        case around = "space:around"
        case between = "space:between"
        case evenly = "space:evenly"
    }

    public enum SyntaxHighlight: String {
        
        case plaintext = "hightlight:plaintext"
        case html = "hightlight:html"
        case css = "hightlight:css"
        case javascript = "hightlight:javascript"
    }

    /// A style for button.
    public enum ButtonStyle: String {
        
        case primary = "style:primary"
        case secondary = "style:secondary"
        case outline = "style:outline"
    }

    public enum BorderShape: String {
        
        case smallrounded = "shape:smallrounded"
        case largerounded = "shape:largerounded"
        case fullrounded = "shape:fullrounded"
        case circle = "shape:cirlce"
    }

    /// A size of a button.
    public enum ButtonSize: String {
        
        /// Sets the size to 100 %.
        case full = "size:full"
        
        /// Sets the size to 75 %.
        case large = "size:large"
        
        /// Sets the size to 50%.
        case medium = "size:medium"
        
        /// Sets the size to 25 %.
        case small = "size:small"
    }

    public enum ItemRatio: String {
        
        case quarter = "ratio:25"
        case third = "ratio:33"
        case half = "ratio:50"
    }

    /// A style for a collection.
    public enum CollectionStyle: String {
        
        case grid = "style:grid"
        case carousel = "style:carousel"
    }

    /// A style for a list.
    public enum ListStyle: String {

        case grouped = "style:grouped"
        case accordion = "style:accordion"
        case tab = "style:tab"
    }
}
