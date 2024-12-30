/*
 Abstract:
 The file contains serveral enumerations of attribute values.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import Collections

/// A namespace for several types of attribute values.
public enum Values {
    
    /// A name for a element.
    ///
    /// ```html
    /// <meta name="viewport">
    /// ```
    public enum Name: String {
        
        case applicationName = "application-name"
        case author = "author"
        case description = "description"
        case generator = "generator"
        case keywords = "keywords"
        case referrer = "referrer"
        case themeColor = "theme-color"
        case colorScheme = "color-scheme"
        case robots = "robots"
        case viewport = "viewport"
    }

    /// A typ for buttons.
    ///
    /// ```html
    /// <button type="submit"></button>
    /// ```
    public enum Button: String {

        /// Submits form data.
        case submit
        
        case button
        
        /// Resets the form data to its initial values.
        case reset
    }

    /// A encoding for the form submission.
    ///
    /// ```html
    /// <form enctype="text/plain"></form>
    /// ```
    public enum Encoding: String {
        
        /// Encodes the data before sent to server.
        case urlEncoded = "application/x-www-form-urlencoded"
        
        /// Allows to upload file data.
        case multipart = "multipart/form-data"
        
        case plainText = "text/plain"
    }

    /// A method for the form submission.
    ///
    /// ```html
    /// <form method="get"></form>
    /// ```
    public enum Method: String {
        
        /// Sends the form data as a post transaction.
        case post
        
        /// Appends the form data to name/value pairs.
        case get
    }

    /// A type of input elements.
    ///
    /// ```html
    /// <input type="password">
    /// ```
    public enum Input: String {
        
        case hidden
        case text
        case search
        case phone = "tel"
        case url
        case email
        case password
        case date
        case month
        case week
        case time
        case datetimeLocal = "datetime-local"
        case number
        case range
        case color
        case checkbox
        case radio
        case file
        case submit
        case image
        case reset
        case button
    }

    /// A language
    ///
    /// ```html
    /// <html lang="en"></html>
    /// ```
    public enum Language: String {
        
        case abkhazian = "ab"
        case afar = "aa"
        case afrikaans = "af"
        case akan = "ak"
        case albanian = "sq"
        case amharic = "am"
        case arabic = "ar"
        case aragonese = "an"
        case armenian = "hy"
        case assamese = "as"
        case avaric = "av"
        case avestan = "ae"
        case aymara = "ay"
        case bambara = "bm"
        case bashkir = "ba"
        case baske = "eu"
        case belarusian = "be"
        case bengali = "bn"
        case bihari = "bh"
        case bislama = "bl"
        case bosnian = "bs"
        case breton = "br"
        case bulgarian = "bg"
        case burmese = "my"
        case catalan = "ca"
        case chamorro = "ch"
        case chechen = "ce"
        case chichewa, chewa, nyanja  = "ny"
        case chinese = "zh"
        case chuvash = "cv"
        case cornish = "kw"
        case corsican = "co"
        case cree = "cr"
        case croation = "hr"
        case czech = "cs"
        case danish = "da"
        case divehi, dhivehi, maldivian = "dv"
        case dutch = "nl"
        case dzongkha = "dz"
        case english = "en"
        case esperanto = "eo"
        case estonian = "et"
        case ewe = "ee"
        case faroese = "fo"
        case fijian = "fj"
        case finnish = "fi"
        case french = "fr"
        case fula, fulah, pulaar, pular = "ff"
        case galician = "gl"
        case gaelicScottish = "gd"
        case gaelicManx = "gv"
        case georgian = "ka"
        case german = "de"
        case greek = "el"
        case guarani = "gn"
        case gujarati = "gu"
        case haitianCreole = "ht"
        case hausa = "ha"
        case hebrew = "he"
        case herero = "hz"
        case hindi = "hi"
        case hiriMotu = "ho"
        case hungarian = "hu"
        case icelandic = "is"
        case ido = "io"
        case igbo = "ig"
        case indonesian = "id"
        case interlingua = "ia"
        case interlingue = "ie"
        case inuktitut = "iu"
        case inupiak = "ik"
        case irish = "ga"
        case italian = "it"
        case japanese = "ja"
        case javanese = "jv"
        case kalaallisut, greenlandic = "kl"
        case kannada = "kn"
        case kanuri = "kr"
        case kashmiri = "ks"
        case kazakh = "kk"
        case khmer = "km"
        case kikuyu = "ki"
        case kinyarwandaRwanda = "rw"
        case kirundi = "rn"
        case kyrgyz = "ky"
        case komi = "kv"
        case kongo = "kg"
        case korean = "ko"
        case kurdish = "ku"
        case kwanyama = "kj"
        case lao = "lo"
        case latin = "la"
        case latvianLettish = "lv"
        case limburgish = "li"
        case lingala = "ln"
        case lithuanian = "lt"
        case lugaKatanga = "lu"
        case lugandaGanda = "lg"
        case luxembourgish = "lb"
        case macedonian = "mk"
        case malagasy = "mg"
        case malay = "ms"
        case malayalam = "ml"
        case maltese = "mt"
        case maori = "mi"
        case marathi = "mr"
        case marshallese = "mh"
        case moldavian = "mo"
        case mongolian = "mn"
        case nauru = "na"
        case navajo = "nv"
        case ndonga = "ng"
        case northernNdebele = "nd"
        case nepali = "ne"
        case norwegian = "no"
        case norwegianBokmål = "nb"
        case norwegianNynorsk = "nn"
        case nuosu, sichuanYi = "ii"
        case occitan = "oc"
        case ojibwe = "oj"
        case oldChurchSlavonic, oldBulgarian = "cu"
        case oriya = "or"
        case oromo = "om"
        case ossetian = "os"
        case pāli = "pi"
        case pashto, pushto = "ps"
        case persian = "fa"
        case polish = "pl"
        case portuguese = "pt"
        case punjabi = "pa"
        case quechua = "qu"
        case romansh = "rm"
        case romanian = "ro"
        case russian = "ru"
        case sami = "se"
        case samoan = "sm"
        case sango = "sg"
        case sanskrit = "sa"
        case serbian = "sr"
        case serboCroatian = "sh"
        case sesotho = "st"
        case setswana = "tn"
        case shona = "sn"
        case sindhi = "sd"
        case sinhalese = "si"
        case slovak = "sk"
        case slovenian = "sl"
        case somali = "so"
        case southernNdebele = "nr"
        case spanish = "es"
        case sundanese = "su"
        case swahili = "sw"
        case swati, siswati, swazi = "ss"
        case swedish = "sv"
        case tagalog = "tl"
        case tahitian = "ty"
        case tajik = "tg"
        case tamil = "ta"
        case tatar = "tt"
        case telugu = "te"
        case thai = "th"
        case tibetan = "bo"
        case tigrinya = "ti"
        case tonga = "to"
        case tsonga = "ts"
        case turkish = "tr"
        case turkmen = "tk"
        case twi = "tw"
        case uyghur = "ug"
        case ukrainian = "uk"
        case urdu = "ur"
        case uzbek = "uz"
        case venda = "ve"
        case vietnamese = "vi"
        case volapük = "vo"
        case wallon = "wa"
        case welsh = "cy"
        case wolof = "wo"
        case westernFrisian = "fy"
        case xhosa = "xh"
        case yiddish = "yi"
        case yoruba = "yo"
        case zhuang, chuang = "za"
        case zulu = "zu"
    }

    /// A reference information on a link.
    ///
    /// ```html
    /// <a referrerpolicy="no-referrer"></a>
    /// ```
    public enum Policy: String {
        
        case strictOriginWhenCrossOrigin = "strict-origin-when-cross-origin"
        case noReferrer = "no-referrer"
        case noReferrerWhenDowngrade = "no-referrer-when-downgrade"
        case origin = "origin"
        case originWhenCrossOrigin = "origin-when-cross-origin"
        case sameOrigin = "same-origin"
        case strictOrigin = "strict-origin"
        case unsafeUrl = "unsafe-url"
    }

    /// A reference information between a link and the current document.
    ///
    /// ```html
    /// <a rel="next"></a>
    /// ```
    public enum Relation: String {
        
        case alternate
        case canonical
        case author
        case bookmark
        case dnsPrefetch = "dns-prefetch"
        case external
        case help
        case icon
        case manifest
        case modulePreload = "modulepreload"
        case licence
        case next
        case noFollow = "nofollow"
        case noOpener = "noopener"
        case noReferrer = "noreferrer"
        case opener
        case pingback
        case preconnect
        case prefetch
        case preload
        @available(*, deprecated, message: "It is no longer part of the web standards.")
        case prerender
        case prev
        case search
        case stylesheet
        case tag
        @available(*, deprecated, message: "It is no longer part of the web standards. Use 'icon' instead.")
        case shortcutIcon = "shortcut icon"
        case appleTouchIcon = "apple-touch-icon"
        case appleTouchStartupImage = "apple-touch-startup-image"
    }

    /// A target for reference links.
    ///
    /// ```html
    /// <button type="submit"></button>
    /// ```
    public enum Target: String {
        
        /// Opens the target in the current tab.
        case current = "_self"
        
        /// Opens the target in a separate tab or window.
        case blank = "_blank"
        
        /// Opens the target in the parent frame.
        case parent = "_parent"
        
        /// Opens the target in the full frame of the window.
        case top = "_top"
    }

    /// The type is for
    ///
    /// ```html
    /// <area shape="rect">
    /// ```
    public enum Shape: String {
        
        case `default`
        case circle
        case polygon = "poly"
        case rectangle = "rect"
    }

    /// A manner of text wrapping.
    ///
    /// ```html
    /// <textarea wrap="hard">
    /// ```
    public enum Wrapping: String {
        
        /// Does not wrap the text after form submission.
        case soft
        
        /// Wraps the text, after form submission.
        case hard
    }

    /// A text direction.
    ///
    /// ```html
    /// <p dir="rtl"></p>
    /// ```
    public enum Direction: String {
        
        /// Sets the direction left to right.
        case leftToRight = "ltr"
        
        /// Sets the direction right to left.
        case rightToLeft = "rtl"
        
        /// Decides the direction by its content.
        case auto
    }

    /// The type is for
    ///
    /// ```html
    /// <link type="text/css"></link>
    /// ```
    public enum Media: String {
        
        case html = "text/html"
        case css = "text/css"
        case ogg = "video/ogg"
        case mp4 = "video/mp4"
        case webm = "video/webm"
        case mpeg = "audio/mpeg"
        case javascript = "application/javascript"
        case xIcon = "image/x-icon"
    }

    /// The type is for
    ///
    /// ```html
    /// <ol type="I"></ol>
    /// ```
    public enum Marker: String {
        
        case decimal = "1"
        case uppercaseAlpha = "A"
        case lowercaseAlpha = "a"
        case uppercaseRoman = "I"
        case lowercaseRoman = "i"
    }

    /// The type is for
    ///
    /// ```html
    /// <!DOCTYPE html5>
    /// ```
    public enum Doctype: String {
            
        case html5 = "html"
        case html4Strict = #"HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd""#
        case html4Transitional = #"HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd""#
        case html4Frameset = #"HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd""#
        case xhtmlStrict = #"html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd""#
        case xhtmlTransitional = #"html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd""#
        case xhtmlFrameset = #"html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd""#
        case xhtml = #"html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd""#
    }

    /// The type is for
    ///
    /// ```html
    /// <meta property="og:title">
    /// ```
    public enum Graph: String {

        case title = "og:title"
        case image = "og:image"
        case description = "og:description"
        case type = "og:type"
        case url = "og:url"
        case locale = "og:locale"
        case siteName = "og:site_name"
    }

    /// The type is for
    ///
    /// ```html
    /// <input enterkeyhint="next">
    /// ```
    public enum Hint: String {
        
        case enter
        case done
        case go
        case next
        case previous
        case search
        case send
    }

    /// The type is for
    ///
    /// ```html
    /// <input autocapitalize="words"></input>
    /// ```
    public enum Capitalization: String {
        
        /// Does not capitlize.
        case off = "off"
        
        /// Capitlizes the entire text.
        case characters = "characters"
        
        /// Capitlizes the first letter of each word.
        case words = "words"
        
        /// Capitlizes first letter of the sentence.
        case sentences = "sentences"
    }

    /// A character encoding for the html-document.
    ///
    /// ```html
    /// <meta charset="utf-8">
    /// ```
    public enum Charset: String {
        
        /// Specifies the encoding for unicode.
        case utf8 = "utf-8"
        
        case utf16 = "utf-16"
        
        /// Specifies the encoding for windows-1252.
        case ansi = "windows-1252"
        
        /// Specifies the encoding for latin alphabet.
        case iso = "iso-8859-1"
    }

    /// The type is for
    ///
    /// ```html
    /// <meta http-equiv="refresh">
    /// ```
    public enum Equivalent: String {
        
        case content = "content-type"
        case `default` = "default-style"
        case refresh = "refresh"
    }

    /// The type is for
    ///
    /// ```html
    /// <a role="button"></a>
    /// ```
    public enum Role: String {
        
        case alert
        case alertDialog = "alertdialog"
        case application
        case article
        case banner
        case button
        case cell
        case checkbox
        case columnHeader = "columnheader"
        case combobox
        case command
        case comment
        case complementary
        case composite
        case contentInfo = "contentinfo"
        case definition
        case dialog
        case directory
        case document
        case feed
        case figure
        case form
        case grid
        case gridCell = "gridcell"
        case group
        case heading
        case img
        case input
        case landmark
        case list
        case listBox = "listbox"
        case listItem = "listitem"
        case log
        case main
        case mark
        case marquee
        case math
        case menu
        case menuBar = "menubar"
        case menuItem = "menuitem"
        case menuItemCheckbox = "menuitemcheckbox"
        case menuItemRadio = "menuitemradio"
        case meter
        case navigation
        case none
        case note
        case option
        case presentation
        case radio
        case range
        case region
        case roleType = "roletype"
        case row
        case rowGroup = "rowgroup"
        case rowHeader = "rowheader"
        case scrollbar
        case search
        case searchBox = "searchbox"
        case sectionHead = "sectionhead"
        case select
        case separator
        case status
        case structure
        case suggestion
        case `switch`
        case tab
        case table
        case tabList = "tablist"
        case tabPanel = "tabpanel"
        case term
        case textbox
        case timer
        case toolbar
        case tooltip
        case tree
        case treeGrid = "treegrid"
        case treeItem = "treeitem"
        case widget
        case window
    }

    /// The type is for
    ///
    /// ```html
    /// <line stroke-linecap="square">
    /// ```
    public enum Linecap: String {
        
        case butt
        case square
        case round
    }

    /// The type is for
    ///
    /// ```html
    /// <path stroke-linejoin="bevel"></path>
    /// ```
    public enum Linejoin: String {
        
        case miter
        case round
        case bevel
    }

    /// The type is for
    ///
    /// ```html
    /// <span translate="yes"></span>
    /// ```
    public enum Decision: String {
        
        case yes
        case no
    }

    /// The type is for
    ///
    /// ```html
    /// <track kind="subtitles">
    /// ```
    public enum Kind: String {
        
        case captions
        case chapters
        case descriptions
        case metadata
        case subtitles
    }

    /// The type is for
    ///
    /// ```html
    /// <audio preload="none">
    /// ```
    public enum Preload: String {
        
        case auto
        case metadata
        case none
    }

    public enum Accessibility {
        
        /// The type is for
        ///
        /// ```html
        /// <tag aria-autocomplete="none">
        /// ```
        public enum Complete: String {
            
            case none
            case inline
            case list
            case both
        }

        /// The type is for
        ///
        /// ```html
        /// <tag aria-checked="false">
        /// ```
        public enum Check: String {
            
            case `false`
            case `mixed`
            case `true`
            case `undefined`
        }

        /// The type is for
        ///
        /// ```html
        /// <tag aria-current="step">
        /// ```
        public enum Current: String {
            
            /// Does not represent the current item within a set.
            case `false`
            
            /// Represents the current item within a set.
            case `true`
            
            /// Represents the current page within a set of pages.
            case page
            
            /// Represents the current step within a process.
            case step
            
            /// Represents the current location within an context.
            case location
            
            /// Represents the current date within a collection of dates.
            case date
            
            /// Represents the current time within a set of times.
            case time
        }

        /// The type is for
        ///
        /// ```html
        /// <tag aria-haspopup="false">
        /// ```
        public enum Popup: String {
            
            case `false`
            case `true`
            
            /// Indicates the popup is a menu.
            case menu
            
            /// Indicates the popup is a listbox.
            case listbox
            
            /// Indicates the popup is a tree.
            case tree
            
            /// Indicates the popup is a grid.
            case grid
            
            /// Indicates the popup is a dialog.
            case dialog
        }

        /// The type is for
        ///
        /// ```html
        /// <tag aria-invalid="grammar">
        /// ```
        public enum Invalid: String {
            
            /// Indicates that there are no detected errors.
            case `false`
            
            /// Indicates that errors were detected.
            case `true`
            
            /// Indicates that a grammatical error was deteced.
            case grammar
            
            /// Indicates that a spelling error was deteced.
            case spelling
        }

        /// The type is for
        ///
        /// ```html
        /// <tag aria-live="assertive">
        /// ```
        public enum Live: String {
            
            /// Indicates that updates to the region should be presented the user immediately.
            case assertive
            
            /// Indicates that updates to the region should not be presented to the user unless the used is currently focused on that region.
            case off
            
            /// Indicates that updates to the region should be presented at the next graceful opportunity.
            case polite
        }

        /// A indicator for the orientation of an element.
        ///
        /// ```html
        /// <tag aria-orientation="horizontal">
        /// ```
        public enum Orientation: String {
            
            /// Indicates that the element's orientation is unkown.
            case undefined
            
            /// Indicates that the element is oriented horizontally.
            case horizontal
            
            /// Indicates that the element is oriented vertically.
            case vertical
        }

        /// The type is for
        ///
        /// ```html
        /// <tag aria-pressed="mixed">
        /// ```
        public enum Pressed: String {
            
            case undefined
            case `false`
            case mixed
            case `true`
        }

        /// The type is for
        ///
        /// ```html
        /// <tag aria-relevant="all">
        /// ```
        public enum Relevant: String {
            
            case additions
            case additionsText
            case all
            case removals
            case text
        }

        /// The type is for
        ///
        /// ```html
        /// <tag aria-selected="false">
        /// ```
        public enum Selected: String {
            
            case undefined
            case `false`
            case `true`
        }

        /// A indicator for the sort algorithm in a grid or table.
        ///
        /// ```html
        /// <tag aria-sort="ascending">
        /// ```
        public enum Sort: String {
            
            /// Indicates that there is no sort algorithm defined.
            case none
            
            /// Indicates a different sort algorithm.
            case other
            
            /// Indicates that the items are sorted in ascending order.
            case ascending
            
            /// Indicates that the items are sorted in descending order.
            case descending
        }
    }
    
    public enum Shadow {
        
        /// An access mode for the shadow root.
        ///
        /// ```html
        /// <template shadowrootmode="open"></template>
        /// ```
        public enum Mode: String {
            
            /// Opens the shadow root. It can be reached via javascript.
            case open
            
            /// Closes the shadow root. It cannot be reached from the ouside.
            case closed
        }
    }
    
    public enum Priority: String {
        /// Signals a higher priority for fetching relative to other resources.
        case high
        /// Signals a lower priority for fetching relative to other resources.
        case low
        /// Signals a automatic determination of the fetch priority.
        case auto
    }
    
    public enum Loading: String {
        /// Defers fetching a resource until some conditions are met.
        case lazy
        /// Fetches a resource immediately
        case eager
    }
    
    public enum Decoding: String {
        /// Indicates a preference to decode synchronously
        case sync
        /// Indicates a preference to decode asynchronously
        case async
        /// Indicates no preference for the decoding.
        case auto
    }
    
    public enum Blocking: String {
        /// Indicates a render-blocking element.
        case render
    }
    
    public enum Popover {
        
        public enum State: String {
            /// Closes other popovers when opened.
            case auto
            /// Does not close other popovers.
            case manual
        }
        
        public enum Action: String {
            
            case toggle
            case show
            case hide
        }
    }
    
    /// A enumeration of potential scopes for a header cell.
    ///
    /// ```swift
    /// HeaderCell {
    ///     "..."
    /// }
    /// .scope(.column)
    /// ```
    public enum Scope: String {
        
        /// The cell applies to subsequent cells in the same row.
        case row
        
        /// The cell applies to subsequent cells in the same column.
        case column = "col"
        
        /// The cell applies to all remaining cells in the row group.
        case rowGroup = "rowgroup"
        
        /// The cell applies to all remaining cells in the column group.
        case columnGroup = "colgroup"
    }
  
    /// A enumeration of potential input modes for the virtual keyboard.
    ///
    /// ```swift
    /// Input()
    ///     .inputMode(.numeric)
    /// ```
    public enum Mode: String {
        
        /// Displays a virtual keyboard for text input in the user's locale.
        case text
        
        /// Does not display a virtual keyboard.
        case none
        
        /// Displays a keyboard for fractional numeric input.
        case decimal
        
        /// Displays a keyboard for email input
        case email
        
        /// Displays a keyboard for numeric input.
        case numeric
        
        /// Displays a keyboard for search input.
        case search
        
        /// Displays a keyboard for telephone number input.
        case phone = "tel"
        
        /// Displays a keyboard optimized for URL input.
        case url
    }
    
    /// A enumeration of potential completion settings
    ///
    /// ```swift
    /// Select {
    /// }
    /// .autocomplete([.organization, .organizationTitle])
    /// ```
    public enum Completion: String {
        
        /// Enables completion
        case on
        
        /// Disables completion
        case off
        
        /// Expects a name
        case name
        
        /// Expects a prefix like Mr, Ms, Dr
        case honorificPrefix = "honorific-prefix"
        
        /// Expects the first name
        case givenName = "given-name"
        
        /// Expects a middle name
        case additionalName = "additional-name"
        
        /// Expects the last name
        case familyName = "family-name"
        
        /// Expects a degree
        case honorificSuffix = "honorific-suffix"
        
        /// Expects a screen name
        case nickname
        
        /// Expects a username
        case username
        
        /// Expects a new password
        case newPassword = "new-password"
        
        /// Expects the current password
        case currentPassword = "current-password"
        
        /// Expects a company name
        case organization
        
        /// Expects a job title
        case organizationTitle = "organization-title"
        
        /// Expects a one time code
        case oneTimeCode = "one-time-code"
        
        /// Expects a address
        case streetAddress = "street-address"
        
        /// Expects a address
        case addressLine1 = "address-line1"
        
        /// Expects a address
        case addressLine2 = "address-line2"
        
        /// Expects a address
        case addressLine3 = "address-line3"
        
        /// Expects a country code
        case country = "country"
        
        /// Expects the country name
        case countryName = "country-name"
        
        /// Expects a postal code
        case postalCode = "postal-code"
        
        /// Expects shipping information
        case shipping
        
        /// Expects billing information
        case billing
        
        /// Expects the full name for payment
        case paymentName = "cc-name"
        
        /// Expects the first name for payment
        case paymentGivenName = "cc-given-name"
        
        /// Expects the middle name for payment
        case paymentAdditionalName = "cc-additional-name"
        
        /// Expects the last name for payment
        case paymentFamilyName = "cc-family-name"
        
        /// Expects the credit card number for payment
        case paymentNumber = "cc-number"
        
        /// Expects the experiation date for payment
        case paymentExpiry = "cc-expiry"
        
        /// Expects the experiation month for payment
        case paymentExpiryMonth = "cc-expiry-month"
        
        /// Expects the experiation year for payment
        case paymentExpiryYear = "cc-expiry-year"
        
        /// Expects the credit security code
        case paymentSecurityCode = "cc-csc"
        
        /// Expects a payment type
        case paymentType = "cc-type"
        
        /// Expects a transaction currency
        case transactionCurrency = "transaction-currency"
        
        /// Expects the amount for payment
        case transactionAmount = "transaction-amount"
        
        /// Expects a perferred language
        case language
        
        /// Expects a birthday date
        case birthday = "bday"
        
        /// Expects the day detail of the birthday date
        case birthdayDay = "bday-day"
        
        /// Expects the month detail of the birthday date
        case birthdayMonth = "bday-month"
        
        /// Expects the year detail of the birthday date
        case birthdayYear = "bday-year"
        
        /// Expects a gender detail
        case sex
        
        /// Expects a photo
        case photo
        
        /// Expects a phone number
        case phone = "tel"
        
        /// Expects the country code of the phone number
        case phoneCountryCode = "tel-country-code"
        
        /// Expects a phone number without the country code
        case phoneNational = "tel-national"
        
        /// Expects the area code of the phone number
        case phoneAreaCode = "tel-area-code"
        
        /// Expects a phone number without the country and area code
        case phoneLocal = "tel-local"
        
        /// Expects the local prefix of the phone number
        case phoneLocalPrefix = "tel-local-prefix"
        
        /// Expects the local suffix of the phone number
        case phoneLocalSuffix = "tel-local-suffix"
        
        /// Phone internal extension code
        case phoneExtension = "tel-extension"
        
        /// Expects a url
        case url
        
        /// Expects an email address
        case email
        
        /// Expects a url for instant messaging
        case messagingProtocol = "impp"
    }
}
