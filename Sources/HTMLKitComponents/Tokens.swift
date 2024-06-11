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
        /// Aligns the elements along a custom direction.
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
        
        /// Aligns the text on the left.
        case leading
        /// Aligns the text in the middle.
        case center
        /// Aligns the text on the right.
        case trailing
        /// Sets the text to a custom alignment.
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

    /// A size for column.
    public enum ViewWidth {
        
        /// Sets the width of the view to 8.3 % of the parent view.
        case one
        /// Sets the width of the view to 16.67 % of the parent view.
        case two
        /// Sets the width of the view to 25 % of the parent view.
        case three
        /// Sets the width of the view to 33.3 % of the parent view.
        case four
        /// Sets the width of the view to 41.67 % of the parent view.
        case five
        /// Sets the width of the view to 50 % of the parent view.
        case six
        /// Sets the width of the view to 58.3 % of the parent view.
        case seven
        /// Sets the width of the view to 66.67 % of the parent view.
        case eight
        /// Sets the width of the view to 75 % of the parent view.
        case nine
        /// Sets the width of the view to 83.3% of the parent view.
        case ten
        /// Sets the width of the view to 91.67 % of the parent view.
        case eleven
        /// Sets the width of the view to 100 % of the parent view.
        case twelve
        /// Sets the width of view to the intrinsic preferred width.
        case maximum
        /// Sets the width of the view to the intrinsic minimum width.
        case minimum
        /// Sets the view to a custom width.
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
                
            case .minimum:
                return "minimum"
                
            case .maximum:
                return "maximum"

            case .custom(let string):
                return string
            }
        }
    }
    
    public enum ViewHeight {
        
        /// Sets the height of the view to 8.3 % of the parent view.
        case one
        /// Sets the height of the view to 16.67 % of the parent view.
        case two
        /// Sets the height of the view to 25 % of the parent view.
        case three
        /// Sets the height of the view to 33.3 % of the parent view.
        case four
        /// Sets the height of the view to 41.67 % of the parent view.
        case five
        /// Sets the height of the view to 50 % of the parent view.
        case six
        /// Sets the height of the view to 58.3 % of the parent view.
        case seven
        /// Sets the height of the view to 66.67 % of the parent view.
        case eight
        /// Sets the height of the view to 75 % of the parent view.
        case nine
        /// Sets the height of the view to 83.3% of the parent view.
        case ten
        /// Sets the height of the view to 91.67 % of the parent view.
        case eleven
        /// Sets the height of the view to 100 % of the parent view.
        case twelve
        /// Sets the height of the view to the intrinsic minimum height.
        case minimum
        /// Sets the height of the view to the intrinsic maximum height.
        case maximum
        /// Sets the view to a custom width.
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
                
            case .minimum:
                return "minimum"
                
            case .maximum:
                return "maximum"
                
            case .custom(let string):
                return string
            }
        }
    }


    /// A color for text.
    public enum ForegroundColor {
        
        /// Changes the foreground color to #000000 .
        case black
        /// Changes the foreground color to #FFFFFF.
        case white
        /// Changes the foreground color to #4098D7.
        case blue
        /// Changes the foreground color to #BF7140.
        case brown
        /// Changes the foreground color to #38BEC9.
        case cyan
        /// Changes the foreground color to #57AE5B.
        case green
        /// Changes the foreground color to #647ACB.
        case indigo
        /// Changes the foreground color to #91E697.
        case mint
        /// Changes the foreground color to #DA4A91.
        case pink
        /// Changes the foreground color to #724BB7.
        case purple
        /// Changes the foreground color to #D64545.
        case red
        /// Changes the foreground color to #3EBD93.
        case teal
        /// Changes the foreground color to #E67635.
        case orange
        /// Changes the foreground color to #F7D070.
        case yellow
        /// Changes the foreground color to #9E9E9E.
        case gray
        /// Changes the foreground color to #F7F7F7.
        case silver
        /// Changes the foreground color to #007FFF.
        case accent
        /// Changes the foreground opacity to 0.0.
        case transparent
        /// Changes the foreground color to #DFE3E7.
        case system
        /// Changes the foreground to a random color.
        case random
        /// Changes the foreground color to a custom value.
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
                
            case .accent:
                return "accent"
                
            case .transparent:
                return "transparent"
                
            case .system:
                return "system"
                
            case .random:
                return ["blue", "brown", "cyan", "green", "indigo", "mint", "pink", "purple", "red", "teal", "orange", "yellow", "gray"].randomElement()!

            case .custom(let string):
                return string
            }
        }
    }

    /// A size for text.
    public enum FontSize {
        
        /// Changes the size of the font to 0.67 rem.
        case tiny
        /// Changes the size of the font to 0.83 rem.
        case small
        /// Changes the size of the font to 1.17 rem.
        case medium
        /// Changes the size of the font to 1.5 rem.
        case large
        /// Changes the size of the font to 2 rem.
        case extralarge
        /// Changes the size of the font to a custom value.
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
    public enum TextCase {
        
        /// Converts all characters to uppercase.
        case uppercase
        /// Converts all characters to lowercase.
        case lowercase
        /// Capitalizes the first letter of each word.
        case capitalize
        /// Sets the transformation to a custom value.
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
        /// Sets the weight to custom value.
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
        
        /// Underlines the text.
        case underline
        /// Overlines the text.
        case overline
        /// Adds a line through the text.
        case strikeThrough
        /// Sets the decoration of the text to a custom value.
        case custom(String)
        
        var value: String {
            
            switch self {
            case .underline:
                return "underline"
                
            case .overline:
                return "overline"
                
            case .strikeThrough:
                return "strikethrough"

            case .custom(let string):
                return string
            }
        }
    }

    /// A style for a font
    public enum FontStyle {
        
        /// Displays the text as italic.
        case italic
        /// Displays the text as oblique.
        case oblique
        /// Displays the text as a custom style.
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

    /// A background color for a view.
    public enum BackgroundColor {
        
        /// Changes the background color to #000000 .
        case black
        /// Changes the background color to #FFFFFF.
        case white
        /// Changes the background color to #4098D7.
        case blue
        /// Changes the background color to #BF7140.
        case brown
        /// Changes the background color to #38BEC9.
        case cyan
        /// Changes the background color to #57AE5B.
        case green
        /// Changes the background color to #647ACB.
        case indigo
        /// Changes the background color to #91E697.
        case mint
        /// Changes the background color to #DA4A91.
        case pink
        /// Changes the background color to #724BB7.
        case purple
        /// Changes the background color to #D64545.
        case red
        /// Changes the background color to #3EBD93.
        case teal
        /// Changes the background color to #E67635.
        case orange
        /// Changes the background color to #F7D070.
        case yellow
        /// Changes the background color to #9E9E9E.
        case gray
        /// Changes the background color to #F7F7F7.
        case silver
        /// Changes the background color to #007FFF.
        case accent
        /// Changes the background opacity to 0.0.
        case transparent
        /// Changes the background color to #DFE3E7.
        case system
        /// Changes the background to a random color.
        case random
        /// Changes the background to a custom color.
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
                
            case .accent:
                return "accent"
                
            case .transparent:
                return "transparent"
                
            case .system:
                return "system"
                
            case .random:
                return ["blue", "brown", "cyan", "green", "indigo", "mint", "pink", "purple", "red", "teal", "orange", "yellow", "gray"].randomElement()!

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
        /// Resizes to the content to a custom value.
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

    /// A views opacity.
    public enum OpacityValue {
        
        /// Sets the opacity value to 1.0.
        case intransparent
        /// Sets the opacity value to 0.0.
        case transparent
        /// Sets the opacity value to a custom value.
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

    /// A size for an image view.
    public enum ImageScale {
        
        /// Sets the inline size of the image to 3.125 rem.
        case small
        /// Sets the inline size of the image to 12.5 rem.
        case medium
        /// Sets the inline size of the image to 25 rem.
        case large
        /// Sets the inline size of the image to a custom value.
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

    /// A shape for a view.
    public enum ClipShape {
        
        /// Transforms the shape of the view into a circle.
        case circle
        /// Transforms the shape of the view along the custom value.
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
        /// Sets the stack order to a custom value.
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
        
        /// Changes the appearance of the text to title.
        case title
        /// Changes the appearance of the text to headline.
        case headline
        /// Changes the appearance of the text to subheadline.
        case subheadline
        /// Changes the appearance of the text to body.
        case body
        /// Changes the appearance of the text to body.
        case callout
        /// Changes the appearance of the text to a caption.
        case caption
        /// Changes the appearance of the text to a footnote.
        case footnote
        /// Changes the appearance of the text to a code.
        case code
        /// Changes the text to a custom appearance.
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

    /// A space for content.
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

    /// A syntax highlight for code.
    public enum SyntaxHighlight {
        
        /// Sets the syntax highlight to plaintext.
        case plaintext
        /// Sets the syntax highlight to HTML.
        case html
        /// Sets the syntax highlight to CSS.
        case css
        /// Sets the syntax highlight to Javascript.
        case javascript
        /// Sets the syntax highlight to a custom value.
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
        
        /// Changes the button appearance to the primary style.
        case primary
        /// Changes the button appearance to the seconary style.
        case outline
        /// Changes the button to a custom appearance.
        case custom(String)
        
        var value: String {
            
            switch self {
            case .primary:
                return "primary"
                
            case .outline:
                return "outline"

            case .custom(let string):
                return string
            }
        }
    }

    /// A shape of the button.
    public enum BorderShape {
        
        /// Changes the border radius to 0.313 rem.
        case smallrounded
        /// Changes the border radius to 0.625 rem.
        case largerounded
        /// Changes the border radius to 1.563 rem.
        case fullrounded
        /// Changes the border radius to a custom value.
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
    public enum ControlSize {
        
        /// Sets the size to 100 %.
        case full
        /// Sets the size to 75 %.
        case large
        /// Sets the size to 50 %.
        case medium
        /// Sets the size to 25 %.
        case small
        /// Sets the size to a custom value.
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
        /// Sets the ratio for the grid to a custom value.
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

        /// Changes the appearance of the list to a list group.
        case listgroup
        /// Changes the list to a custom appearance.
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
        
        /// Shows the view as active view.
        case active
        /// Disables the view.
        case disabled
        /// Hides the view.
        case hidden
        /// Shows the view.
        case visible
        /// Sets the view state to a custom value.
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
    
    /// A color for the border.
    public enum BorderColor {
        
        /// Changes the border color to #000000 .
        case black
        /// Changes the border color to #FFFFFF.
        case white
        /// Changes the border color to #4098D7.
        case blue
        /// Changes the border color to #BF7140.
        case brown
        /// Changes the border color to #38BEC9.
        case cyan
        /// Changes the border color to #57AE5B.
        case green
        /// Changes the border color to #647ACB.
        case indigo
        /// Changes the border color to #91E697.
        case mint
        /// Changes the border color to #DA4A91.
        case pink
        /// Changes the border color to #724BB7.
        case purple
        /// Changes the border color to #D64545.
        case red
        /// Changes the border color to #3EBD93.
        case teal
        /// Changes the border color to #E67635.
        case orange
        /// Changes the border color to #F7D070.
        case yellow
        /// Changes the border color to #9E9E9E.
        case gray
        /// Changes the border color to #F7F7F7.
        case silver
        /// Changes the border color to #007FFF.
        case accent
        /// Changes the border opacity to 0.0.
        case transparent
        /// Changes the border color to #DFE3E7.
        case system
        /// Changes the border to a custom color.
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
                
            case .accent:
                return "accent"
                
            case .transparent:
                return "transparent"
                
            case .system:
                return "system"

            case .custom(let string):
                return string
            }
        }
    }
    
    /// A color for the focus.
    public enum FocusColor {
        
        /// Changes the foreground color to #000000 .
        case black
        /// Changes the foreground color to #FFFFFF.
        case white
        /// Changes the foreground color to #4098D7.
        case blue
        /// Changes the foreground color to #BF7140.
        case brown
        /// Changes the foreground color to #38BEC9.
        case cyan
        /// Changes the foreground color to #57AE5B.
        case green
        /// Changes the foreground color to #647ACB.
        case indigo
        /// Changes the foreground color to #91E697.
        case mint
        /// Changes the foreground color to #DA4A91.
        case pink
        /// Changes the foreground color to #724BB7.
        case purple
        /// Changes the foreground color to #D64545.
        case red
        /// Changes the foreground color to #3EBD93.
        case teal
        /// Changes the foreground color to #E67635.
        case orange
        /// Changes the foreground color to #F7D070.
        case yellow
        /// Changes the foreground color to #9E9E9E.
        case gray
        /// Changes the foreground color to #F7F7F7.
        case silver
        /// Changes the foreground color to #007FFF.
        case accent
        /// Changes the foreground opacity to 0.0.
        case transparent
        /// Changes the foreground color to #DFE3E7.
        case system
        /// Changes the foreground to a custom color.
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
                
            case .accent:
                return "accent"
                
            case .transparent:
                return "transparent"
                
            case .system:
                return "system"

            case .custom(let string):
                return string
            }
        }
    }
    
    /// A color scheme for the application.
    public enum ColorScheme {
        
        /// Changes the color scheme to dark.
        case dark
        /// Changes the color scheme to light.
        case light
        /// Changes the color scheme to a custom value.
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
        
        /// Changes the padding size of the view to 1 rem.
        case small
        /// Changes the padding size of the view to 1.5 rem.
        case medium
        /// Changes the padding size of the view to 2.25 rem.
        case large
        /// Changes the padding size to a custom value.
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
        /// Changes the margin size of the view to 1 rem.
        case small
        /// Changes the margin size of the view to 1.5 rem.
        case medium
        /// Changes the margin size of the view to 2.25 rem.
        case large
        /// Changes the margin size to auto.
        case auto
        /// Changes the margin size to a custom value.
        case custom(String)
        
        var value: String {
            
            switch self {
            case .small:
                return "small"
                
            case .medium:
                return "medium"
                
            case .large:
                return "large"
                
            case .auto:
                return "auto"
                
            case .custom(let string):
                return string
            }
        }
    }
    
    /// A ratio for images.
    public enum AspectRatio {
        
        /// Sets the aspect ratio to 1/1.
        case equal
        /// Sets the aspect ratio to 2/1.
        case unequal
        /// Sets the aspect ratio to a custom ratio.
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
    
    /// A style for navigations.
    public enum NavigationStyle {
        
        case plain
        /// Changes the appearance of the navigation to pagination.
        case pagination
        /// Changes the appearance of the navigation to menu.
        case menu
        /// Changes the navigation to a custom appearance.
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
    
    /// A height for text lines.
    public enum LineHeight {
        
        /// Sets the height of the line to 1.0.
        case small
        /// Sets the height of the line to 1.75.
        case medium
        /// Sets the height of the line to 2.25.
        case large
        /// Setst the height of the line to a custom value.
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
    
    /// A line limit for texts.
    public enum LineLimit {
        
        /// Sets the line limit to 1.
        case one
        /// Sets the line limit to 2.
        case two
        /// Sets the line limit to 3.
        case three
        /// Sets the line limit to a custom value.
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
    
    /// A alignment for the frame
    public enum FrameAlignment {
        
        /// Aligns the frame on the left side.
        case leading
        /// Aligns the frame in the middle.
        case center
        /// Aligns the frame on the right side.
        case trailing
        /// Aligns the frame to a custom alignment.
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
    
    /// A font family for text.
    public enum FontFamily {
        
        /// Sets the font of the text to Arial.
        case arial
        /// Sets the font of the text to Helvetica.
        case helvetica
        /// Sets the font of the text to Verdana.
        case verdana
        case custom(String)
        
        var value: String {
            
            switch self {
            case .arial:
                return "arial"
                
            case .helvetica:
                return "helvetica"
                
            case .verdana:
                return "verdana"
                
            case .custom(let string):
                return string
            }
        }
    }
    
    public enum BlurLevel {
        
        case light
        case medium
        case strong
        case custom(String)
        
        internal var value: String {
            
            switch self {
            case .light:
                return "light"
                
            case .medium:
                return "medium"
                
            case .strong:
                return "strong"
                
            case .custom(let string):
                return string
            }
        }
    }
    
    public enum GrayscaleDepth {
        
        case light
        case neutral
        case dark
        case custom(String)
        
        internal var value: String {
            
            switch self {
            case .light:
                return "light"
                
            case .neutral:
                return "neutral"
                
            case .dark:
                return "dark"
                
            case .custom(let string):
                return string
            }
        }
    }
    
    public enum BrightnessLevel {
        
        case low
        case medium
        case high
        case custom(String)
        
        internal var value: String {
            
            switch self {
            case .low:
                return "low"
                
            case .medium:
                return "medium"
                
            case .high:
                return "high"
                
            case .custom(let string):
                return string
            }
        }
    }
    
    public enum SaturationLevel {
        
        case low
        case medium
        case high
        case custom(String)
        
        internal var value: String {
            
            switch self {
            case .low:
                return "low"
                
            case .medium:
                return "medium"
                
            case .high:
                return "high"
                
            case .custom(let string):
                return string
            }
        }
    }
    
    public enum ContrastLevel {
        
        case low
        case medium
        case high
        case custom(String)
        
        internal var value: String {
            
            switch self {
            case .low:
                return "low"
                
            case .medium:
                return "medium"
                
            case .high:
                return "high"
                
            case .custom(let string):
                return string
            }
        }
    }
    
    public enum InnerRadius {
        
        case small
        case medium
        case large
        case custom(String)
        
        internal var value: String {
            
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
    
    /// A space for content.
    public enum ListSpace {
        
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
    
    public enum BlurRadius {
        
        case small
        case medium
        case large
        case custom(String)
        
        internal var value: String {
            
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
    
    /// A color for the focus.
    public enum ShadowColor {
        
        /// Changes the foreground color to #000000 .
        case black
        /// Changes the foreground color to #FFFFFF.
        case white
        /// Changes the foreground color to #4098D7.
        case blue
        /// Changes the foreground color to #BF7140.
        case brown
        /// Changes the foreground color to #38BEC9.
        case cyan
        /// Changes the foreground color to #57AE5B.
        case green
        /// Changes the foreground color to #647ACB.
        case indigo
        /// Changes the foreground color to #91E697.
        case mint
        /// Changes the foreground color to #DA4A91.
        case pink
        /// Changes the foreground color to #724BB7.
        case purple
        /// Changes the foreground color to #D64545.
        case red
        /// Changes the foreground color to #3EBD93.
        case teal
        /// Changes the foreground color to #E67635.
        case orange
        /// Changes the foreground color to #F7D070.
        case yellow
        /// Changes the foreground color to #9E9E9E.
        case gray
        /// Changes the foreground color to #F7F7F7.
        case silver

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

            case .custom(let string):
                return string
            }
        }
    }
    
    public enum BorderWidth {
        
        /// Changes the border width of the view to 1 px.
        case small
        /// Changes the border width of the view to 2 px.
        case medium
        /// Changes the border width of the view to 3 px.
        case large
        /// Changes the width of the border to a custom value.
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
    
    public enum ProgressStyle {
        
        case circular
        
        case linear
        
        case custom(String)
        
        var value: String {
            
            switch self {
            case .circular:
                return "circular"
                
            case .linear:
                return "linear"

            case .custom(let string):
                return string
            }
        }
    }
    
    /// A color for text.
    public enum TintColor {
        
        /// Changes the foreground color to #000000 .
        case black
        /// Changes the foreground color to #FFFFFF.
        case white
        /// Changes the foreground color to #4098D7.
        case blue
        /// Changes the foreground color to #BF7140.
        case brown
        /// Changes the foreground color to #38BEC9.
        case cyan
        /// Changes the foreground color to #57AE5B.
        case green
        /// Changes the foreground color to #647ACB.
        case indigo
        /// Changes the foreground color to #91E697.
        case mint
        /// Changes the foreground color to #DA4A91.
        case pink
        /// Changes the foreground color to #724BB7.
        case purple
        /// Changes the foreground color to #D64545.
        case red
        /// Changes the foreground color to #3EBD93.
        case teal
        /// Changes the foreground color to #E67635.
        case orange
        /// Changes the foreground color to #F7D070.
        case yellow
        /// Changes the foreground color to #9E9E9E.
        case gray
        /// Changes the foreground color to #F7F7F7.
        case silver
        /// Changes the foreground color to #007FFF.
        case accent
        /// Changes the foreground color to a custom value.
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
                
            case .accent:
                return "accent"

            case .custom(let string):
                return string
            }
        }
    }
}
