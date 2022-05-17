/*
 Abstract:
 The file contains html-types.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

/// A name for a element.
///
/// ```html
/// <meta name="viewport">
/// ```
public enum Names: String {
    
    case author = "author"
    case description = "description"
    case generator = "generator"
    case keywords = "keywords"
    case viewport = "viewport"
    case applicationName = "application-name"
}

/// A typ for buttons.
///
/// ```html
/// <button type="submit"></button>
/// ```
public enum Buttons: String {

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
public enum Inputs: String {
    
    case text
    case button
    case checkbox
    case color
    case date
    case email
    case file
    case hidden
    case image
    case month
    case number
    case password
    case radio
    case range
    case reset
    case search
    case submit
    case time
    case url
    case week
    case datetimeLocal = "datetime-local"
    case phone = "tel"
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
    case author
    case help
    case icon
    case licence
    case next
    case pingback
    case preconnect
    case prefetch
    case preload
    case prerender
    case prev
    case search
    case stylesheet
    case noFollow = "nofollow"
    case noReferrer = "noreferrer"
    case noOpener = "noopener"
    case dnsPrefetch = "dns-prefetch"
    case appleTouchIcon = "apple-touch-icon"
    case appleTouchStartupImage = "apple-touch-startup-image"
    case shortcutIcon = "shortcut icon"
}

/// A target for reference links.
///
/// ```html
/// <button type="submit"></button>
/// ```
public enum Target: String {
    
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
public enum Medias: String {
    
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
public enum Doctypes: String {
        
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
public enum Graphs: String {

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
public enum Roles: String {
    
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
