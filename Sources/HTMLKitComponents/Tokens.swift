/*
 Abstract:
 The file contains the class tokens for the components.
 */

/// A collection of class tokens for the components.
public enum Tokens {
    
    /// A direction for elements.
    public enum FlowDirection: String {
        
        /// Aligns the elements vertically.
        case vertical = "vertical"
        
        /// Aligns the elements horizontally.
        case horizontal = "horizontal"
    }

    /// A alignment for text along the horizontal axis.
    public enum TextAlignment: String {
        
        /// Aligns the text left.
        case left = "left"
        
        /// Aligns the text in the middle.
        case center = "center"
        
        /// Aligns the text right.
        case right = "right"
    }

    /// A size for column.
    public enum ColumnSize: String {
        
        /// Sets the size to 8.3 %.
        case one = "one"
        
        /// Sets the size to 16.67 %.
        case two = "two"
        
        /// Sets the size to 25 %.
        case three = "three"
        
        /// Sets the size to 33.3 %.
        case four = "four"
        
        /// Sets the size to 41.67 %.
        case five = "five"
        
        /// Sets the size to 50 %.
        case six = "six"
        
        /// Sets the size to 58.3 %.
        case seven = "seven"
        
        /// Sets the size to 66.67 %.
        case eight = "eight"
        
        /// Sets the size to 75 %.
        case nine = "nine"
        
        /// Sets the size to 83.3%.
        case ten = "ten"
        
        /// Sets the size to 91.67 %.
        case eleven = "eleven"
        
        /// Sets the size to 100 %.
        case twelve = "twelve"
    }

    /// A color for text.
    public enum ForegroundColor: String {
        
        /// Changes the foreground color to black.
        case black = "black"
        
        /// Changes the foreground color to white.
        case white = "white"
        
        /// Changes the foreground color to blue.
        case blue = "blue"
        
        /// Changes the foreground color to brown.
        case brown = "brown"
        
        /// Changes the foreground color to cyan.
        case cyan = "cyan"
        
        /// Changes the foreground color to green.
        case green = "green"
        
        /// Changes the foreground color to indigo.
        case indigo = "indigo"
        
        /// Changes the foreground color to mint.
        case mint = "mint"
        
        /// Changes the foreground color to pink.
        case pink = "pink"
        
        /// Changes the foreground color to purple.
        case purple = "purple"
        
        /// Changes the foreground color to red.
        case red = "red"
        
        /// Changes the foreground color to teal.
        case teal = "teal"
        
        /// Changes the foreground color to orange.
        case orange = "orange"
        
        /// Changes the foreground color to yellow.
        case yellow = "yellow"
        
        /// Changes the foreground color to gray.
        case gray = "gray"
        
        /// Changes the foreground color to silver.
        case silver = "silver"
        
        /// Changes the foreground color to black.
        case highlight = "highlight"
        
        /// Changes the foreground color to black.
        case primary = "primary"
        
        /// Changes the foreground color to black.
        case secondary = "secondary"
    }

    /// A size for text.
    public enum FontSize: String {
        
        /// Changes the size to small.
        case tiny = "tiny"
        
        /// Changes the size to small.
        case small = "small"
        
        /// Changes the size to medium.
        case medium = "medium"
        
        /// Changes the size to large.
        case large = "large"
        
        /// Changes the size to extra large.
        case extralarge = "extralarge"
    }

    /// A transformation for the text.
    public enum TextTransformation: String {
        
        /// Converts all characters to uppercase.
        case uppercase = "uppercase"
        
        /// Converts all characters to lowercase.
        case lowercase = "lowercase"
        
        /// Capitalizes the first letter of each word.
        case capitalize = "capitalize"
    }

    /// A weight for text.
    public enum FontWeight: String {
        
        /// Sets the weight to 100.
        case thin = "thin"
        
        /// Sets the weight to 200.
        case ultraLight = "ultralight"
        
        /// Sets the weight to 300.
        case light = "light"
        
        /// Sets the weight to 400.
        case regular = "regular"
        
        /// Sets the weight to 500.
        case medium = "medium"
        
        /// Sets the weight to 600.
        case semibold = "semibold"
        
        /// Sets the weight to 700.
        case bold = "bold"

        /// Sets the weight to 900.
        case heavy = "heavy"
        
        /// Sets the weight to 950.
        case black = "black"
    }

    /// A decoration for text.
    public enum TextDecoration: String {
        
        case underline = "underline"
        
        case overline = "overline"
        
        case strikeThrough = "strikethrough"
        
        case none = "none"
    }

    public enum FontStyle: String {
        
        case italic = "italic"
        
        case oblique = "oblique"
    }

    public enum BackgroundColor: String {
        
        /// Changes the background color to black.
        case black = "black"
        
        /// Changes the background color to white.
        case white = "white"
        
        /// Changes the background color to blue.
        case blue = "blue"
        
        /// Changes the background color to brown.
        case brown = "brown"
        
        /// Changes the background color to cyan.
        case cyan = "cyan"
        
        /// Changes the background color to green.
        case green = "green"
        
        /// Changes the background color to indigo.
        case indigo = "indigo"
        
        /// Changes the background color to mint.
        case mint = "mint"
        
        /// Changes the background color to pink.
        case pink = "pink"
        
        /// Changes the background color to purple.
        case purple = "purple"
        
        /// Changes the background color to red.
        case red = "red"
        
        /// Changes the background color to teal.
        case teal = "teal"
        
        /// Changes the background color to ornage.
        case orange = "orange"
        
        /// Changes the background color to yellow.
        case yellow = "yellow"
        
        /// Changes the background color to gray.
        case gray = "gray"
        
        /// Changes the background color to silver.
        case silver = "silver"
        
        case highlight = "highlight"
        
        case primary = "primary"
        
        case secondary = "secondary"
        
        case transparent = "transparent"
    }

    /// A resize for an element.
    public enum ObjectFit: String {

        /// Resizes the content to fit within the parent.
        case contain = "contain"
        
        /// Resizes the content to fill the parent. The overflow will be clipped.
        case cover = "cover"
        
        /// Resizes the content to fill the parent. If necessary it will be streched or squished.
        case fill = "fill"
        
        case scaleDown = "scaledown"
        
        /// Does not resize.
        case none = "none"
    }

    public enum OpacityValue: String {
        
        case intransparent = "intransparent"
        
        case transparent = "transparent"
    }

    /// A offset for a column.
    public enum ColumnOffset: String {
        
        /// Sets the offset to 8.3 %.
        case one = "one"
        
        /// Sets the offset to 16.67 %.
        case two = "two"
        
        /// Sets the offset to 25 %.
        case three = "three"
        
        /// Sets the offset to 33.33 %.
        case four = "four"
        
        /// Sets the offset to 41.67 %.
        case five = "five"
        
        /// Sets the offset to 50 %.
        case six = "six"
        
        /// Sets the offset to  58.3 %.
        case seven = "seven"
        
        /// Sets the offset to  66.7 %.
        case eight = "eight"
        
        /// Sets the offset to 75 %.
        case nine = "nine"
        
        /// Sets the offset to 83.3 %.
        case ten = "ten"
        
        /// Sets the offset to 91.67 %.
        case eleven = "eleven"
    }

    public enum ImageScale: String {
        
        case small = "small"
        case medium = "medium"
        case large = "large"
    }

    public enum ClipShape: String {
        
        case circle = "circle"
    }

    /// Position along the z-axis.
    public enum PositionIndex: String {
        
        /// Sets the stack order to 1.
        case one = "1"
        
        /// Sets the stack order to 2.
        case two = "2"
        
        /// Sets the stack order to 3.
        case three = "3"
        
        /// Sets the stack order to 4.
        case four = "4"
        
        /// Sets the stack order to 5.
        case five = "5"
    }

    /// A style for text.
    public enum TextStyle: String {
        
        /// Formats the text as title.
        case title = "title"
        
        /// Formats the text as headline.
        case headline = "headline"
        
        /// Formats the text as subheadline.
        case subheadline = "subheadline"
        
        /// Formats the text as body.
        case body = "body"
        
        /// Formats the text as callout.
        case callout = "callout"
        
        /// Formats the text as caption.
        case caption = "caption"
        
        /// Formats the text as footnote.
        case footnote = "footnote"
        
        /// Formats the text as code.
        case code = "code"
    }

    /// A alignment along the vertically axis.
    public enum VerticalAlignment: String {
        
        /// Aligns at the top.
        case top = "top"
        
        /// Aligns in the middle.
        case center = "center"
        
        /// Aligns at the bottom.
        case bottom = "bottom"
        
        /// Aligns with the parent's baseline.
        case baseline = "baseline"
    }

    /// A alignment along the horizontal axis.
    public enum HorizontalAlignment: String {
        
        /// Aligns left.
        case leading = "leading"
        
        /// Aligns center.
        case center = "center"
        
        /// Aligns right.
        case trailing = "trailing"
    }

    public enum ContentSpace: String {
        
        case around = "around"
        case between = "between"
        case evenly = "evenly"
        case large = "large"
        case medium = "medium"
        case small = "small"
    }

    public enum SyntaxHighlight: String {
        
        case plaintext = "plaintext"
        case html = "html"
        case css = "css"
        case javascript = "javascript"
    }

    /// A style for button.
    public enum ButtonStyle: String {
        
        case primary = "primary"
        case secondary = "secondary"
        case outline = "outline"
    }

    /// A shape of the button.
    public enum BorderShape: String {
        
        case smallrounded = "smallrounded"
        case largerounded = "largerounded"
        case fullrounded = "fullrounded"
    }

    /// A size of a button.
    public enum ButtonSize: String {
        
        /// Sets the size to 100 %.
        case full = "full"
        
        /// Sets the size to 75 %.
        case large = "large"
        
        /// Sets the size to 50 %.
        case medium = "medium"
        
        /// Sets the size to 25 %.
        case small = "small"
    }

    /// A ratio for the grid.
    public enum ItemRatio: String {
        
        ///  Sets the ratio to 15%.
        case sixth = "15"
        
        /// Sets  the ratio to 20 %.
        case fifth = "20"
        
        /// Sets the ratio to 25 %.
        case quarter = "25"
        
        /// Sets the ratio to 33 %.
        case third = "33"
        
        /// Sets the ratio to 50 %.
        case half = "50"
    }

    /// A style for a list.
    public enum ListStyle: String {

        case listgroup = "listgroup"
    }
    
    /// A state for the view.
    public enum ViewState: String {
        
        /// Sets the state to active.
        case active = "active"
        
        /// Sets the state to disabled.
        case disabled = "disabled"
        
        /// Sets the state to hidden.
        case hidden = "hidden"
        
        /// Sets the state to visible.
        case visible = "visible"
    }
    
    public enum BorderColor: String {
        
        /// Changes the border color to black.
        case black = "black"
        
        /// Changes the border color to white.
        case white = "white"
        
        /// Changes the border color to blue.
        case blue = "blue"
        
        /// Changes the border color to brown.
        case brown = "brown"
        
        /// Changes the border color to cyan.
        case cyan = "cyan"
        
        /// Changes the border color to green.
        case green = "green"
        
        /// Changes the border color to indigo.
        case indigo = "indigo"
        
        /// Changes the border color to mint.
        case mint = "mint"
        
        /// Changes the border color to pink.
        case pink = "pink"
        
        /// Changes the border color to purple.
        case purple = "purple"
        
        /// Changes the border color to red.
        case red = "red"
        
        /// Changes the border color to teal.
        case teal = "teal"
        
        /// Changes the border color to ornage.
        case orange = "orange"
        
        /// Changes the border color to yellow.
        case yellow = "yellow"
        
        /// Changes the border color to gray.
        case gray = "gray"
        
        /// Changes the border color to silver.
        case silver = "silver"
        
        case primary = "primary"
        
        case secondary = "secondary"
        
        case transparent = "transparent"
    }
    
    public enum FocusColor: String {
        
        /// Changes the border color to black.
        case black = "black"
        
        /// Changes the border color to white.
        case white = "white"
        
        /// Changes the border color to blue.
        case blue = "blue"
        
        /// Changes the border color to brown.
        case brown = "brown"
        
        /// Changes the border color to cyan.
        case cyan = "cyan"
        
        /// Changes the border color to green.
        case green = "green"
        
        /// Changes the border color to indigo.
        case indigo = "indigo"
        
        /// Changes the border color to mint.
        case mint = "mint"
        
        /// Changes the border color to pink.
        case pink = "pink"
        
        /// Changes the border color to purple.
        case purple = "purple"
        
        /// Changes the border color to red.
        case red = "red"
        
        /// Changes the border color to teal.
        case teal = "teal"
        
        /// Changes the border color to ornage.
        case orange = "orange"
        
        /// Changes the border color to yellow.
        case yellow = "yellow"
        
        /// Changes the border color to gray.
        case gray = "gray"
        
        /// Changes the border color to silver.
        case silver = "silver"
        
        case primary = "primary"
        
        case secondary = "secondary"
    }
    
    public enum ColorScheme: String {
        
        /// Changes the color scheme to dark.
        case dark = "dark"
        
        /// Changes the color scheme to light.
        case light = "light"
    }
    
    public enum PaddingLength: String {
        
        case large = "large"
        case medium = "medium"
        case small = "small"
    }
    
    public enum MarginLength: String {
        
        case large = "large"
        case medium = "medium"
        case small = "small"
    }
    
    public enum AspectRatio: String {
        
        case equal = "equal"
        case unequal = "unequal"
    }
    
    public enum NavigationStyle: String {
        
        case plain = "plain"
    }
    
    public enum LineHeight: String {
        
        case small = "small"
        case medium = "medium"
        case large = "large"
    }
    
    public enum LineLimit: String {
        
        case one = "one"
        case two = "two"
        case three = "three"
     }
}
