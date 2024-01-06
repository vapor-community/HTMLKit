/*
 Abstract:
 The file contains the class tokens for the components.
 */

/// A collection of class tokens for the components.
public enum Tokens {
    
    /// A direction for elements.
    public enum FlowDirection {
        
        /// Aligns the elements vertically.
        case vertical
        
        /// Aligns the elements horizontally.
        case horizontal
        
        case custom(String)
        
        var value: String {
            switch self {
            case .vertical:
                return "vertical"
                
            case .horizontal:
                return "horizontal"

            case .custom(let string):
                return string
            }
        }
    }

    /// A alignment for text along the horizontal axis.
    public enum TextAlignment {
        
        /// Aligns the text left.
        case left
        
        /// Aligns the text in the middle.
        case center
        
        /// Aligns the text right.
        case right
        
        case custom(String)
        
        var value: String {
            switch self {
            case .left:
                return "left"
                
            case .center:
                return "center"
                
            case .right:
                return "right"

            case .custom(let string):
                return string
            }
        }
    }

    /// A size for column.
    public enum ColumnSize {
        
        /// Sets the size to 8.3 %.
        case one
        
        /// Sets the size to 16.67 %.
        case two
        
        /// Sets the size to 25 %.
        case three
        
        /// Sets the size to 33.3 %.
        case four
        
        /// Sets the size to 41.67 %.
        case five
        
        /// Sets the size to 50 %.
        case six
        
        /// Sets the size to 58.3 %.
        case seven
        
        /// Sets the size to 66.67 %.
        case eight
        
        /// Sets the size to 75 %.
        case nine
        
        /// Sets the size to 83.3%.
        case ten
        
        /// Sets the size to 91.67 %.
        case eleven
        
        /// Sets the size to 100 %.
        case twelve
        
        case custom(String)
        
        var value: String {
            switch self {
            case .one:
                return "one"
                
            case .two:
                return "two"
                
            case .three:
                return "three"
                
            case .four:
                return "four"
                
            case .five:
                return "five"
                
            case .six:
                return "six"
                
            case .seven:
                return "seven"
                
            case .eight:
                return "eight"
                
            case .nine:
                return "nine"
                
            case .ten:
                return "ten"
                
            case .eleven:
                return "eleven"
                
            case .twelve:
                return "twelve"

            case .custom(let string):
                return string
            }
        }
    }

    /// A color for text.
    public enum ForegroundColor {
        
        /// Changes the border color to black.
        case black
        
        /// Changes the border color to white.
        case white
        
        /// Changes the border color to blue.
        case blue
        
        /// Changes the border color to brown.
        case brown
        
        /// Changes the border color to cyan.
        case cyan
        
        /// Changes the border color to green.
        case green
        
        /// Changes the border color to indigo.
        case indigo
        
        /// Changes the border color to mint.
        case mint
        
        /// Changes the border color to pink.
        case pink
        
        /// Changes the border color to purple.
        case purple
        
        /// Changes the border color to red.
        case red
        
        /// Changes the border color to teal.
        case teal
        
        /// Changes the border color to ornage.
        case orange
        
        /// Changes the border color to yellow.
        case yellow
        
        /// Changes the border color to gray.
        case gray
        
        /// Changes the border color to silver.
        case silver
        
        case primary
        
        case secondary
        
        case transparent
        
        case system
        
        case custom(String)
        
        var value: String {
            switch self {
            case .black:
                return "black"
                
            case .white:
                return "white"
                
            case .blue:
                return "blue"
                
            case .brown:
                return "brown"
                
            case .cyan:
                return "cyan"
                
            case .green:
                return "green"
                
            case .indigo:
                return "indigo"
                
            case .mint:
                return "mint"
                
            case .pink:
                return "pink"
                
            case .purple:
                return "purple"
                
            case .red:
                return "red"
                
            case .teal:
                return "teal"
                
            case .orange:
                return "orange"
                
            case .yellow:
                return "yellow"
                
            case .gray:
                return "gray"
                
            case .silver:
                return "silver"
                
            case .primary:
                return "primary"
                
            case .secondary:
                return "secondary"
                
            case .transparent:
                return "transparent"
                
            case .system:
                return "system"

            case .custom(let string):
                return string
            }
        }
    }

    /// A size for text.
    public enum FontSize {
        
        /// Changes the size to small.
        case tiny
        
        /// Changes the size to small.
        case small
        
        /// Changes the size to medium.
        case medium
        
        /// Changes the size to large.
        case large
        
        /// Changes the size to extra large.
        case extralarge
        
        case custom(String)
        
        var value: String {
            switch self {
            case .tiny:
                return "tiny"
                
            case .small:
                return "small"
                
            case .medium:
                return "medium"
                
            case .large:
                return "large"
                
            case .extralarge:
                return "extralarge"

            case .custom(let string):
                return string
            }
        }
    }

    /// A transformation for the text.
    public enum TextTransformation {
        
        /// Converts all characters to uppercase.
        case uppercase
        
        /// Converts all characters to lowercase.
        case lowercase
        
        /// Capitalizes the first letter of each word.
        case capitalize
        
        case custom(String)
        
        var value: String {
            switch self {
            case .uppercase:
                return "uppercase"
                
            case .lowercase:
                return "lowercase"
                
            case .capitalize:
                return "capitalize"

            case .custom(let string):
                return string
            }
        }
    }

    /// A weight for text.
    public enum FontWeight {
        
        /// Sets the weight to 100.
        case thin
        
        /// Sets the weight to 200.
        case ultraLight
        
        /// Sets the weight to 300.
        case light
        
        /// Sets the weight to 400.
        case regular
        
        /// Sets the weight to 500.
        case medium
        
        /// Sets the weight to 600.
        case semibold
        
        /// Sets the weight to 700.
        case bold

        /// Sets the weight to 900.
        case heavy
        
        /// Sets the weight to 950.
        case black
        
        case custom(String)
        
        var value: String {
            switch self {
            case .thin:
                return "thin"
                
            case .ultraLight:
                return "ultralight"
                
            case .light:
                return "light"
                
            case .regular:
                return "regular"
                
            case .medium:
                return "medium"
                
            case .semibold:
                return "semibold"
                
            case .bold:
                return "bold"
                
            case .heavy:
                return "heavy"
                
            case .black:
                return "black"

            case .custom(let string):
                return string
            }
        }
    }

    /// A decoration for text.
    public enum TextDecoration {
        
        case underline
        
        case overline
        
        case strikeThrough
        
        case none
        
        case custom(String)
        
        var value: String {
            switch self {
            case .underline:
                return "underline"
                
            case .overline:
                return "overline"
                
            case .strikeThrough:
                return "strikethrough"
                
            case .none:
                return "none"

            case .custom(let string):
                return string
            }
        }
    }

    public enum FontStyle {
        
        case italic
        
        case oblique
        
        case custom(String)
        
        var value: String {
            switch self {
            case .italic:
                return "italic"
                
            case .oblique:
                return "oblique"

            case .custom(let string):
                return string
            }
        }
    }

    public enum BackgroundColor {
        
        /// Changes the border color to black.
        case black
        
        /// Changes the border color to white.
        case white
        
        /// Changes the border color to blue.
        case blue
        
        /// Changes the border color to brown.
        case brown
        
        /// Changes the border color to cyan.
        case cyan
        
        /// Changes the border color to green.
        case green
        
        /// Changes the border color to indigo.
        case indigo
        
        /// Changes the border color to mint.
        case mint
        
        /// Changes the border color to pink.
        case pink
        
        /// Changes the border color to purple.
        case purple
        
        /// Changes the border color to red.
        case red
        
        /// Changes the border color to teal.
        case teal
        
        /// Changes the border color to ornage.
        case orange
        
        /// Changes the border color to yellow.
        case yellow
        
        /// Changes the border color to gray.
        case gray
        
        /// Changes the border color to silver.
        case silver
        
        case primary
        
        case secondary
        
        case transparent
        
        case system
        
        case custom(String)
        
        var value: String {
            switch self {
            case .black:
                return "black"
                
            case .white:
                return "white"
                
            case .blue:
                return "blue"
                
            case .brown:
                return "brown"
                
            case .cyan:
                return "cyan"
                
            case .green:
                return "green"
                
            case .indigo:
                return "indigo"
                
            case .mint:
                return "mint"
                
            case .pink:
                return "pink"
                
            case .purple:
                return "purple"
                
            case .red:
                return "red"
                
            case .teal:
                return "teal"
                
            case .orange:
                return "orange"
                
            case .yellow:
                return "yellow"
                
            case .gray:
                return "gray"
                
            case .silver:
                return "silver"
                
            case .primary:
                return "primary"
                
            case .secondary:
                return "secondary"
                
            case .transparent:
                return "transparent"
                
            case .system:
                return "system"

            case .custom(let string):
                return string
            }
        }
    }

    /// A resize for an element.
    public enum ObjectFit {

        /// Resizes the content to fit within the parent.
        case contain
        
        /// Resizes the content to fill the parent. The overflow will be clipped.
        case cover
        
        /// Resizes the content to fill the parent. If necessary it will be streched or squished.
        case fill
        
        case scaleDown
        
        /// Does not resize.
        case none
        
        case custom(String)
        
        var value: String {
            switch self {
            case .contain:
                return "contain"
                
            case .cover:
                return "cover"
                
            case .fill:
                return "fill"
                
            case .scaleDown:
                return "scaledown"
                
            case .none:
                return "none"

            case .custom(let string):
                return string
            }
        }
    }

    public enum OpacityValue {
        
        case intransparent
        
        case transparent
        
        case custom(String)
        
        var value: String {
            switch self {
            case .intransparent:
                return "intransparent"
                
            case .transparent:
                return "transparent"

            case .custom(let string):
                return string
            }
        }
    }

    /// A offset for a column.
    public enum ColumnOffset {
        
        /// Sets the offset to 8.3 %.
        case one
        
        /// Sets the offset to 16.67 %.
        case two
        
        /// Sets the offset to 25 %.
        case three
        
        /// Sets the offset to 33.33 %.
        case four
        
        /// Sets the offset to 41.67 %.
        case five
        
        /// Sets the offset to 50 %.
        case six
        
        /// Sets the offset to  58.3 %.
        case seven
        
        /// Sets the offset to  66.7 %.
        case eight
        
        /// Sets the offset to 75 %.
        case nine
        
        /// Sets the offset to 83.3 %.
        case ten
        
        /// Sets the offset to 91.67 %.
        case eleven
        
        case custom(String)
        
        var value: String {
            switch self {
            case .one:
                return "one"
                
            case .two:
                return "two"
                
            case .three:
                return "three"
                
            case .four:
                return "four"
                
            case .five:
                return "five"
                
            case .six:
                return "six"
                
            case .seven:
                return "seven"
                
            case .eight:
                return "eight"
                
            case .nine:
                return "nine"
                
            case .ten:
                return "ten"
                
            case .eleven:
                return "eleven"

            case .custom(let string):
                return string
            }
        }
    }

    public enum ImageScale {
        
        case small
        case medium
        case large
        case custom(String)
        
        var value: String {
            switch self {
            case .small:
                return "small"
                
            case .medium:
                return "medium"
                
            case .large:
                return "large"

            case .custom(let string):
                return string
            }
        }
    }

    public enum ClipShape {
        
        case circle
        
        case custom(String)
        
        var value: String {
            switch self {
            case .circle:
                return "circle"

            case .custom(let string):
                return string
            }
        }
    }

    /// Position along the z-axis.
    public enum PositionIndex {
        
        /// Sets the stack order to 1.
        case one
        
        /// Sets the stack order to 2.
        case two
        
        /// Sets the stack order to 3.
        case three
        
        /// Sets the stack order to 4.
        case four
        
        /// Sets the stack order to 5.
        case five
        
        case custom(String)
        
        var value: String {
            switch self {
            case .one:
                return "one"
                
            case .two:
                return "two"
                
            case .three:
                return "three"
                
            case .four:
                return "four"
                
            case .five:
                return "five"

            case .custom(let string):
                return string
            }
        }
    }

    /// A style for text.
    public enum TextStyle {
        
        /// Formats the text as title.
        case title
        
        /// Formats the text as headline.
        case headline
        
        /// Formats the text as subheadline.
        case subheadline
        
        /// Formats the text as body.
        case body
        
        /// Formats the text as callout.
        case callout
        
        /// Formats the text as caption.
        case caption
        
        /// Formats the text as footnote.
        case footnote
        
        /// Formats the text as code.
        case code
        
        case custom(String)
        
        var value: String {
            switch self {
            case .title:
                return "title"
                
            case .headline:
                return "headline"
                
            case .subheadline:
                return "subheadline"
                
            case .body:
                return "body"
                
            case .callout:
                return "callout"
                
            case .caption:
                return "caption"
                
            case .footnote:
                return "footnote"
                
            case .code:
                return "code"

            case .custom(let string):
                return string
            }
        }
    }

    /// A alignment along the vertically axis.
    public enum VerticalAlignment {
        
        /// Aligns the content at the top.
        case top
        /// Aligns the content in the middle.
        case center
        /// Aligns the content at the bottom.
        case bottom
        /// Aligns the content with the parent's baseline.
        case baseline
        /// Aligns the content along a custom value.
        case custom(String)
        
        var value: String {
            
            switch self {
            case .top:
                return "top"
                
            case .center:
                return "center"
                
            case .bottom:
                return "bottom"
                
            case .baseline:
                return "baseline"

            case .custom(let string):
                return string
            }
        }
    }

    /// A alignment along the horizontal axis.
    public enum HorizontalAlignment {
        
        /// Aligns the content on the left.
        case leading
        /// Aligns the content in the middle.
        case center
        /// Aligns the content on the right.
        case trailing
        /// Aligns the content along a custom value.
        case custom(String)
        
        var value: String {
            
            switch self {
            case .leading:
                return "leading"
                
            case .center:
                return "center"
                
            case .trailing:
                return "trailing"

            case .custom(let string):
                return string
            }
        }
    }

    public enum ContentSpace {
        
        /// Distributes the content evenly.
        case around
        /// Content is evenly distributed along the line.
        case between
        /// Sets the content space equally.
        case evenly
        /// Sets the content space in between to 2.25 rem.
        case large
        /// Sets the content space in between to 1.5 rem.
        case medium
        /// Sets the content space in between to 1 rem.
        case small
        /// Sets the content space to a custom value.
        case custom(String)
        
        var value: String {
            
            switch self {
            case .around:
                return "around"
                
            case .between:
                return "between"
                
            case .evenly:
                return "evenly"
                
            case .large:
                return "large"
                
            case .medium:
                return "medium"
                
            case .small:
                return "small"

            case .custom(let string):
                return string
            }
        }
    }

    public enum SyntaxHighlight {
        
        case plaintext
        case html
        case css
        case javascript
        
        case custom(String)
        
        var value: String {
            switch self {
            case .plaintext:
                return "plaintext"
                
            case .html:
                return "html"
                
            case .css:
                return "css"
                
            case .javascript:
                return "javascript"

            case .custom(let string):
                return string
            }
        }
    }

    /// A style for button.
    public enum ButtonStyle {
        
        case primary
        case secondary
        case outline
        
        case custom(String)
        
        var value: String {
            switch self {
            case .primary:
                return "primary"
                
            case .secondary:
                return "secondary"
                
            case .outline:
                return "outline"

            case .custom(let string):
                return string
            }
        }
    }

    /// A shape of the button.
    public enum BorderShape {
        
        case smallrounded
        case largerounded
        case fullrounded
        case custom(String)
        
        var value: String {
            switch self {
            case .smallrounded:
                return "smallrounded"
                
            case .largerounded:
                return "largerounded"
                
            case .fullrounded:
                return "fullrounded"

            case .custom(let string):
                return string
            }
        }
    }

    /// A size of a button.
    public enum ButtonSize {
        
        /// Sets the size to 100 %.
        case full
        
        /// Sets the size to 75 %.
        case large
        
        /// Sets the size to 50 %.
        case medium
        
        /// Sets the size to 25 %.
        case small
        
        case custom(String)
        
        var value: String {
            switch self {
            case .full:
                return "full"
                
            case .large:
                return "large"
                
            case .medium:
                return "medium"
                
            case .small:
                return "small"

            case .custom(let string):
                return string
            }
        }
    }

    /// A ratio for the grid.
    public enum GridRatio {
        
        case fit
        
        ///  Sets the ratio to 15%.
        case sixth
        
        /// Sets  the ratio to 20 %.
        case fifth
        
        /// Sets the ratio to 25 %.
        case quarter
        
        /// Sets the ratio to 33 %.
        case third
        
        /// Sets the ratio to 50 %.
        case half
        
        case custom(String)
        
        var value: String {
            switch self {
                
            case .fit:
                return "fit"
                
            case .sixth:
                return "sixth"
                
            case .fifth:
                return "fifth"
                
            case .quarter:
                return "quarter"
                
            case .third:
                return "third"
                
            case .half:
                return "half"

            case .custom(let string):
                return string
            }
        }
    }

    /// A style for a list.
    public enum ListStyle {

        case listgroup
        
        case custom(String)
        
        var value: String {
            switch self {
            case .listgroup:
                return "listgroup"
                
            case .custom(let string):
                return string
            }
        }
    }
    
    /// A state for the view.
    public enum ViewState {
        
        /// Sets the state to active.
        case active
        
        /// Sets the state to disabled.
        case disabled
        
        /// Sets the state to hidden.
        case hidden
        
        /// Sets the state to visible.
        case visible
        
        case custom(String)
        
        var value: String {
            switch self {
            case .active:
                return "active"
                
            case .disabled:
                return "disabled"
                
            case .hidden:
                return "hidden"
                
            case .visible:
                return "visible"

            case .custom(let string):
                return string
            }
        }
    }
    
    public enum BorderColor {
        
        /// Changes the border color to black.
        case black
        
        /// Changes the border color to white.
        case white
        
        /// Changes the border color to blue.
        case blue
        
        /// Changes the border color to brown.
        case brown
        
        /// Changes the border color to cyan.
        case cyan
        
        /// Changes the border color to green.
        case green
        
        /// Changes the border color to indigo.
        case indigo
        
        /// Changes the border color to mint.
        case mint
        
        /// Changes the border color to pink.
        case pink
        
        /// Changes the border color to purple.
        case purple
        
        /// Changes the border color to red.
        case red
        
        /// Changes the border color to teal.
        case teal
        
        /// Changes the border color to ornage.
        case orange
        
        /// Changes the border color to yellow.
        case yellow
        
        /// Changes the border color to gray.
        case gray
        
        /// Changes the border color to silver.
        case silver
        
        case primary
        
        case secondary
        
        case transparent
        
        case system
        
        case custom(String)
        
        var value: String {
            switch self {
            case .black:
                return "black"
                
            case .white:
                return "white"
                
            case .blue:
                return "blue"
                
            case .brown:
                return "brown"
                
            case .cyan:
                return "cyan"
                
            case .green:
                return "green"
                
            case .indigo:
                return "indigo"
                
            case .mint:
                return "mint"
                
            case .pink:
                return "pink"
                
            case .purple:
                return "purple"
                
            case .red:
                return "red"
                
            case .teal:
                return "teal"
                
            case .orange:
                return "orange"
                
            case .yellow:
                return "yellow"
                
            case .gray:
                return "gray"
                
            case .silver:
                return "silver"
                
            case .primary:
                return "primary"
                
            case .secondary:
                return "secondary"
                
            case .transparent:
                return "transparent"
                
            case .system:
                return "system"

            case .custom(let string):
                return string
            }
        }
    }
    
    public enum FocusColor {
        
        /// Changes the border color to black.
        case black
        
        /// Changes the border color to white.
        case white
        
        /// Changes the border color to blue.
        case blue
        
        /// Changes the border color to brown.
        case brown
        
        /// Changes the border color to cyan.
        case cyan
        
        /// Changes the border color to green.
        case green
        
        /// Changes the border color to indigo.
        case indigo
        
        /// Changes the border color to mint.
        case mint
        
        /// Changes the border color to pink.
        case pink
        
        /// Changes the border color to purple.
        case purple
        
        /// Changes the border color to red.
        case red
        
        /// Changes the border color to teal.
        case teal
        
        /// Changes the border color to ornage.
        case orange
        
        /// Changes the border color to yellow.
        case yellow
        
        /// Changes the border color to gray.
        case gray
        
        /// Changes the border color to silver.
        case silver
        
        case primary
        
        case secondary
        
        case transparent
        
        case custom(String)
        
        var value: String {
            switch self {
            case .black:
                return "black"
                
            case .white:
                return "white"
                
            case .blue:
                return "blue"
                
            case .brown:
                return "brown"
                
            case .cyan:
                return "cyan"
                
            case .green:
                return "green"
                
            case .indigo:
                return "indigo"
                
            case .mint:
                return "mint"
                
            case .pink:
                return "pink"
                
            case .purple:
                return "purple"
                
            case .red:
                return "red"
                
            case .teal:
                return "teal"
                
            case .orange:
                return "orange"
                
            case .yellow:
                return "yellow"
                
            case .gray:
                return "gray"
                
            case .silver:
                return "silver"
                
            case .primary:
                return "primary"
                
            case .secondary:
                return "secondary"
                
            case .transparent:
                return "transparent"

            case .custom(let string):
                return string
            }
        }
    }
    
    public enum ColorScheme {
        
        /// Changes the color scheme to dark.
        case dark
        /// Changes the color scheme to light.
        case light
        case custom(String)
        
        var value: String {
            switch self {
            case .dark:
                return "dark"
                
            case .light:
                return "light"

            case .custom(let string):
                return string
            }
        }
    }
    
    public enum PaddingLength {
        
        case small
        case medium
        case large
        case custom(String)
        
        var value: String {
            switch self {
            case .small:
                return "small"
                
            case .medium:
                return "medium"
                
            case .large:
                return "large"
                
            case .custom(let string):
                return string
            }
        }
    }
    
    public enum MarginLength {
        
        case small
        case medium
        case large
        case custom(String)
        
        var value: String {
            switch self {
            case .small:
                return "small"
                
            case .medium:
                return "medium"
                
            case .large:
                return "large"
                
            case .custom(let string):
                return string
            }
        }
    }
    
    public enum AspectRatio {
        
        case equal
        case unequal
        case custom(String)
        
        var value: String {
            switch self {
            case .equal:
                return "equal"
                
            case .unequal:
                return "unequal"
                
            case .custom(let string):
                return string
            }
        }
    }
    
    public enum NavigationStyle {
        
        case plain
        case pagination
        case menu
        case custom(String)
        
        var value: String {
            switch self {
            case .plain:
                return "plain"
                
            case .pagination:
                return "pagination"
                
            case .menu:
                return "menu"
                
            case .custom(let string):
                return string
            }
        }
    }
    
    public enum LineHeight {
        
        case small
        case medium
        case large
        case custom(String)
        
        var value: String {
            switch self {
            case .small:
                return "small"
                
            case .medium:
                return "medium"
                
            case .large:
                return "large"
                
            case .custom(let string):
                return string
            }
        }
    }
    
    public enum LineLimit {
        
        case one
        case two
        case three
        case custom(String)
        
        var value: String {
            switch self {
            case .one:
                return "one"
                
            case .two:
                return "two"
                
            case .three:
                return "three"
                
            case .custom(let string):
                return string
            }
        }
     }
}
