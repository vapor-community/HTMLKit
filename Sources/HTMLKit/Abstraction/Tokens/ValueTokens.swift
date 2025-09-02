import Collections

public enum Credential {
    
    /// A credential mode for cross-origin requests.
    ///
    /// ```swift
    /// Link()
    ///     .reference("https://...")
    ///     .crossOrigin(.useCredentials)
    /// ```
    public enum Mode: String {
        
        /// Requests without credentials.
        case anonymous
        
        /// Send credentials with the request.
        case useCredentials = "use-credentials"
    }
}

/// A namespace for several types of attribute values.
public enum Values {
    
    /// A type of a document property.
    ///
    /// ```swift
    /// Meta()
    ///     .name(.viewport)
    /// ```
    public enum Name: String {
        
        /// Indicates the application name.
        case applicationName = "application-name"
        
        /// Indicates the author name.
        case author = "author"
        
        /// Indicates a document description.
        case description = "description"
        
        /// Indicates the software tool.
        case generator = "generator"
        
        /// Describe the document content.
        case keywords = "keywords"
        
        /// Indicates the document referrer.
        case referrer = "referrer"
        
        /// Indicates a theme color.
        case themeColor = "theme-color"
        
        /// Indicates a color mode.
        case colorScheme = "color-scheme"
        
        /// Indicates the crawler behaviour.
        case robots = "robots"
        
        /// Indicates the viewport size.
        case viewport = "viewport"
    }

    /// A type of a button element.
    ///
    /// ```swift
    /// Button {
    ///     "Lorem ipsum"
    /// }
    /// .type(.button)
    /// ```
    public enum Button: String {

        /// Submits form data.
        case submit
        
        /// Acts as a simple button.
        case button
        
        /// Resets the form data to its initial values.
        case reset
    }

    /// An encoding for form submission.
    ///
    /// ```swift
    /// Form {
    /// }
    /// .encoding(.plain)
    /// ```
    public enum Encoding: String {
        
        /// Encodes the data before sent to server.
        case urlEncoded = "application/x-www-form-urlencoded"
        
        /// Allows to upload file data.
        case multipart = "multipart/form-data"
        
        /// Sends data without encoding.
        case plainText = "text/plain"
    }

    /// A method for form submission.
    ///
    /// ```swift
    /// Form {
    /// }
    /// .method(.post)
    /// ```
    public enum Method: String {
        
        /// Sends the form data as a post transaction.
        case post
        
        /// Appends the form data to name/value pairs.
        case get
        
        /// Closes the dialog and triggers a submit event, without actually sending the form data.
        case dialog
    }

    /// The type of an input element.
    ///
    /// ```struct
    /// Input()
    ///     .type(.text)
    ///     .name("lorem")
    ///     .id("lorem")
    /// ```
    public enum Input: String {
        
        /// Indicates a hidden field.
        case hidden
        
        /// Indicates a text field.
        case text
        
        /// Indicates a search field.
        case search
        
        /// Indicates a phone field.
        case phone = "tel"
        
        /// Indicates a url field.
        case url
        
        /// Indicates a email field.
        case email
        
        /// Indicates a password field.
        case password
        
        /// Indicates a date field.
        case date
        
        /// Indicates a date field.
        case month
        
        /// Indicates a date field.
        case week
        
        /// Indicates a date field.
        case time
        
        /// Indicates a date field.
        case datetimeLocal = "datetime-local"
        
        /// Indicates a number field.
        case number
        
        /// Indicates a range field.
        case range
        
        /// Indicates a color field.
        case color
        
        /// Indicates a check box.
        case checkbox
        
        /// Indicates a radio select.
        case radio
        
        /// Indicates a file dialog.
        case file
        
        /// Indicates a submit field.
        case submit
        
        /// Indicates a image field.
        case image
        
        /// Indicates a reset field.
        case reset
        
        /// Indicates a action button.
        case button
    }

    /// The language of the document content.
    ///
    /// ```swift
    /// Html {
    /// }
    /// .language(.english)
    /// ```
    public enum Language: String {
        
        /// Indicates the Abkhazian language.
        case abkhazian = "ab"

        /// Indicates the Afar language.
        case afar = "aa"

        /// Indicates the Afrikaans language.
        case afrikaans = "af"

        /// Indicates the Akan language.
        case akan = "ak"

        /// Indicates the Albanian language.
        case albanian = "sq"

        /// Indicates the Amharic language.
        case amharic = "am"

        /// Indicates the Arabic language.
        case arabic = "ar"

        /// Indicates the Aragonese language.
        case aragonese = "an"

        /// Indicates the Armenian language.
        case armenian = "hy"

        /// Indicates the Assamese language.
        case assamese = "as"

        /// Indicates the Avaric language.
        case avaric = "av"

        /// Indicates the Avestan language.
        case avestan = "ae"

        /// Indicates the Aymara language.
        case aymara = "ay"

        /// Indicates the Bambara language.
        case bambara = "bm"

        /// Indicates the Bashkir language.
        case bashkir = "ba"

        /// Indicates the Basque language.
        case basque = "eu"

        /// Indicates the Belarusian language.
        case belarusian = "be"

        /// Indicates the Bengali language.
        case bengali = "bn"

        /// Indicates the Bihari languages.
        case bihari = "bh"

        /// Indicates the Bislama language.
        case bislama = "bl"

        /// Indicates the Bosnian language.
        case bosnian = "bs"

        /// Indicates the Breton language.
        case breton = "br"

        /// Indicates the Bulgarian language.
        case bulgarian = "bg"

        /// Indicates the Burmese language.
        case burmese = "my"

        /// Indicates the Catalan language.
        case catalan = "ca"

        /// Indicates the Chamorro language.
        case chamorro = "ch"

        /// Indicates the Chechen language.
        case chechen = "ce"

        /// Indicates the Chichewa, Chewa, or Nyanja language.
        case chichewa, chewa, nyanja = "ny"

        /// Indicates the Chinese language.
        case chinese = "zh"

        /// Indicates the Chuvash language.
        case chuvash = "cv"

        /// Indicates the Cornish language.
        case cornish = "kw"

        /// Indicates the Corsican language.
        case corsican = "co"

        /// Indicates the Cree language.
        case cree = "cr"

        /// Indicates the Croatian language.
        case croatian = "hr"

        /// Indicates the Czech language.
        case czech = "cs"

        /// Indicates the Danish language.
        case danish = "da"

        /// Indicates the Divehi, Dhivehi, or Maldivian language.
        case divehi, dhivehi, maldivian = "dv"

        /// Indicates the Dutch language.
        case dutch = "nl"

        /// Indicates the Dzongkha language.
        case dzongkha = "dz"

        /// Indicates the English language.
        case english = "en"

        /// Indicates the Esperanto language.
        case esperanto = "eo"

        /// Indicates the Estonian language.
        case estonian = "et"

        /// Indicates the Ewe language.
        case ewe = "ee"

        /// Indicates the Faroese language.
        case faroese = "fo"

        /// Indicates the Fijian language.
        case fijian = "fj"

        /// Indicates the Finnish language.
        case finnish = "fi"

        /// Indicates the French language.
        case french = "fr"

        /// Indicates the Fula, Fulah, Pulaar, or Pular language.
        case fula, fulah, pulaar, pular = "ff"

        /// Indicates the Galician language.
        case galician = "gl"

        /// Indicates the Scottish Gaelic language.
        case gaelicScottish = "gd"

        /// Indicates the Manx Gaelic language.
        case gaelicManx = "gv"

        /// Indicates the Georgian language.
        case georgian = "ka"

        /// Indicates the German language.
        case german = "de"

        /// Indicates the Greek language.
        case greek = "el"

        /// Indicates the Guarani language.
        case guarani = "gn"

        /// Indicates the Gujarati language.
        case gujarati = "gu"

        /// Indicates the Haitian Creole language.
        case haitianCreole = "ht"

        /// Indicates the Hausa language.
        case hausa = "ha"

        /// Indicates the Hebrew language.
        case hebrew = "he"

        /// Indicates the Herero language.
        case herero = "hz"

        /// Indicates the Hindi language.
        case hindi = "hi"

        /// Indicates the Hiri Motu language.
        case hiriMotu = "ho"

        /// Indicates the Hungarian language.
        case hungarian = "hu"

        /// Indicates the Icelandic language.
        case icelandic = "is"

        /// Indicates the Ido language.
        case ido = "io"

        /// Indicates the Igbo language.
        case igbo = "ig"

        /// Indicates the Indonesian language.
        case indonesian = "id"

        /// Indicates the Interlingua language.
        case interlingua = "ia"

        /// Indicates the Interlingue language.
        case interlingue = "ie"

        /// Indicates the Inuktitut language.
        case inuktitut = "iu"

        /// Indicates the Inupiaq language.
        case inupiak = "ik"

        /// Indicates the Irish language.
        case irish = "ga"

        /// Indicates the Italian language.
        case italian = "it"

        /// Indicates the Japanese language.
        case japanese = "ja"

        /// Indicates the Javanese language.
        case javanese = "jv"

        /// Indicates the Kalaallisut (Greenlandic) language.
        case kalaallisut, greenlandic = "kl"

        /// Indicates the Kannada language.
        case kannada = "kn"

        /// Indicates the Kanuri language.
        case kanuri = "kr"

        /// Indicates the Kashmiri language.
        case kashmiri = "ks"

        /// Indicates the Kazakh language.
        case kazakh = "kk"

        /// Indicates the Khmer language.
        case khmer = "km"

        /// Indicates the Kikuyu language.
        case kikuyu = "ki"

        /// Indicates the Kinyarwanda (Rwanda) language.
        case kinyarwandaRwanda = "rw"

        /// Indicates the Kirundi language.
        case kirundi = "rn"

        /// Indicates the Kyrgyz language.
        case kyrgyz = "ky"

        /// Indicates the Komi language.
        case komi = "kv"

        /// Indicates the Kongo language.
        case kongo = "kg"

        /// Indicates the Korean language.
        case korean = "ko"

        /// Indicates the Kurdish language.
        case kurdish = "ku"

        /// Indicates the Kwanyama language.
        case kwanyama = "kj"

        /// Indicates the Lao language.
        case lao = "lo"

        /// Indicates the Latin language.
        case latin = "la"

        /// Indicates the Latvian (Lettish) language.
        case latvianLettish = "lv"

        /// Indicates the Limburgish language.
        case limburgish = "li"

        /// Indicates the Lingala language.
        case lingala = "ln"

        /// Indicates the Lithuanian language.
        case lithuanian = "lt"

        /// Indicates the Luba-Katanga language.
        case lugaKatanga = "lu"

        /// Indicates the Luganda (Ganda) language.
        case lugandaGanda = "lg"

        /// Indicates the Luxembourgish language.
        case luxembourgish = "lb"

        /// Indicates the Macedonian language.
        case macedonian = "mk"

        /// Indicates the Malagasy language.
        case malagasy = "mg"

        /// Indicates the Malay language.
        case malay = "ms"

        /// Indicates the Malayalam language.
        case malayalam = "ml"

        /// Indicates the Maltese language.
        case maltese = "mt"

        /// Indicates the Maori language.
        case maori = "mi"

        /// Indicates the Marathi language.
        case marathi = "mr"

        /// Indicates the Marshallese language.
        case marshallese = "mh"

        /// Indicates the Moldavian language.
        case moldavian = "mo"

        /// Indicates the Mongolian language.
        case mongolian = "mn"

        /// Indicates the Nauru language.
        case nauru = "na"

        /// Indicates the Navajo language.
        case navajo = "nv"

        /// Indicates the Ndonga language.
        case ndonga = "ng"

        /// Indicates the Northern Ndebele language.
        case northernNdebele = "nd"

        /// Indicates the Nepali language.
        case nepali = "ne"

        /// Indicates the Norwegian language.
        case norwegian = "no"

        /// Indicates the Norwegian Bokmål language.
        case norwegianBokmål = "nb"

        /// Indicates the Norwegian Nynorsk language.
        case norwegianNynorsk = "nn"

        /// Indicates the Nuosu (Sichuan Yi) language.
        case nuosu, sichuanYi = "ii"

        /// Indicates the Occitan language.
        case occitan = "oc"

        /// Indicates the Ojibwe language.
        case ojibwe = "oj"

        /// Indicates the Old Church Slavonic (Old Bulgarian) language.
        case oldChurchSlavonic, oldBulgarian = "cu"

        /// Indicates the Oriya language.
        case oriya = "or"

        /// Indicates the Oromo language.
        case oromo = "om"

        /// Indicates the Ossetian language.
        case ossetian = "os"

        /// Indicates the Pāli language.
        case pāli = "pi"

        /// Indicates the Pashto (Pushto) language.
        case pashto, pushto = "ps"

        /// Indicates the Persian language.
        case persian = "fa"

        /// Indicates the Polish language.
        case polish = "pl"

        /// Indicates the Portuguese language.
        case portuguese = "pt"

        /// Indicates the Punjabi language.
        case punjabi = "pa"

        /// Indicates the Quechua language.
        case quechua = "qu"

        /// Indicates the Romansh language.
        case romansh = "rm"

        /// Indicates the Romanian language.
        case romanian = "ro"

        /// Indicates the Russian language.
        case russian = "ru"

        /// Indicates the Sami language.
        case sami = "se"

        /// Indicates the Samoan language.
        case samoan = "sm"

        /// Indicates the Sango language.
        case sango = "sg"

        /// Indicates the Sanskrit language.
        case sanskrit = "sa"

        /// Indicates the Serbian language.
        case serbian = "sr"

        /// Indicates the Serbo-Croatian language.
        case serboCroatian = "sh"

        /// Indicates the Sesotho language.
        case sesotho = "st"

        /// Indicates the Setswana language.
        case setswana = "tn"

        /// Indicates the Shona language.
        case shona = "sn"

        /// Indicates the Sindhi language.
        case sindhi = "sd"

        /// Indicates the Sinhalese language.
        case sinhalese = "si"

        /// Indicates the Slovak language.
        case slovak = "sk"

        /// Indicates the Slovenian language.
        case slovenian = "sl"

        /// Indicates the Somali language.
        case somali = "so"

        /// Indicates the Southern Ndebele language.
        case southernNdebele = "nr"

        /// Indicates the Spanish language.
        case spanish = "es"

        /// Indicates the Sundanese language.
        case sundanese = "su"

        /// Indicates the Swahili language.
        case swahili = "sw"

        /// Indicates the Swati (Siswati, Swazi) language.
        case swati, siswati, swazi = "ss"

        /// Indicates the Swedish language.
        case swedish = "sv"

        /// Indicates the Tagalog language.
        case tagalog = "tl"

        /// Indicates the Tahitian language.
        case tahitian = "ty"

        /// Indicates the Tajik language.
        case tajik = "tg"

        /// Indicates the Tamil language.
        case tamil = "ta"

        /// Indicates the Tatar language.
        case tatar = "tt"

        /// Indicates the Telugu language.
        case telugu = "te"

        /// Indicates the Thai language.
        case thai = "th"

        /// Indicates the Tibetan language.
        case tibetan = "bo"

        /// Indicates the Tigrinya language.
        case tigrinya = "ti"

        /// Indicates the Tonga language.
        case tonga = "to"

        /// Indicates the Tsonga language.
        case tsonga = "ts"

        /// Indicates the Turkish language.
        case turkish = "tr"

        /// Indicates the Turkmen language.
        case turkmen = "tk"

        /// Indicates the Twi language.
        case twi = "tw"

        /// Indicates the Uyghur language.
        case uyghur = "ug"

        /// Indicates the Ukrainian language.
        case ukrainian = "uk"

        /// Indicates the Urdu language.
        case urdu = "ur"

        /// Indicates the Uzbek language.
        case uzbek = "uz"

        /// Indicates the Venda language.
        case venda = "ve"

        /// Indicates the Vietnamese language.
        case vietnamese = "vi"

        /// Indicates the Volapük language.
        case volapük = "vo"

        /// Indicates the Walloon language.
        case wallon = "wa"

        /// Indicates the Welsh language.
        case welsh = "cy"

        /// Indicates the Wolof language.
        case wolof = "wo"

        /// Indicates the Western Frisian language.
        case westernFrisian = "fy"

        /// Indicates the Xhosa language.
        case xhosa = "xh"

        /// Indicates the Yiddish language.
        case yiddish = "yi"

        /// Indicates the Yoruba language.
        case yoruba = "yo"

        /// Indicates the Zhuang or Chuang language.
        case zhuang, chuang = "za"

        /// Indicates the Zulu language.
        case zulu = "zu"
    }

    /// A reference information on a link.
    ///
    /// ```swift
    /// Link()
    ///     .referrerPolicy(.sameOrigin)
    /// ```
    public enum Policy: String {
        
        /// Sends full referrer for same origin.
        case strictOriginWhenCrossOrigin = "strict-origin-when-cross-origin"
        
        /// Sends no referrer.
        case noReferrer = "no-referrer"
        
        /// Sends referrer unless downgrading the connection.
        case noReferrerWhenDowngrade = "no-referrer-when-downgrade"
        
        /// Sends only the origin.
        case origin = "origin"
        
        /// Sends referrer only for other origin requests.
        case originWhenCrossOrigin = "origin-when-cross-origin"
        
        /// Sends referrer only for same origin requests
        case sameOrigin = "same-origin"
        
        /// Sends refferer only if security level is maintained.
        case strictOrigin = "strict-origin"
        
        /// Sends full referrer always.
        case unsafeUrl = "unsafe-url"
    }

    /// A reference information between a link and the current document.
    ///
    /// ```swift
    /// Link()
    ///     .reference(...ico)
    ///     .relation(.icon)
    /// ```
    public enum Relation: String {
        
        /// Indicates an alternate presentation.
        case alternate
        
        /// Indicates the preferred url.
        case canonical
        
        /// Indicates an author page.
        case author
        
        /// Indicates a perma link.
        case bookmark
        
        /// Indicates a dns prefetch.
        case dnsPrefetch = "dns-prefetch"
        
        /// Indicates a external resource.
        case external
        
        /// Indicates a help context.
        case help
        
        /// Indicates a document icon.
        case icon
        
        /// Indicates a app manifest.
        case manifest
        
        /// Indicates a module preload.
        case modulePreload = "modulepreload"
        
        /// Indicates a licence information.
        case licence
        
        /// Indicates a page pagination.
        case next
        
        /// Indicates no follow up.
        case noFollow = "nofollow"
        
        /// Indicates no link opener.
        case noOpener = "noopener"
        
        /// Indicates no link referrer.
        case noReferrer = "noreferrer"
        
        /// Indicates link opener.
        case opener
        
        /// Indicates ping back.
        case pingback
        
        /// Indicates ressource preconnect.
        case preconnect
        
        /// Indicates link prefetch.
        case prefetch
        
        /// Indicates a ressource preload.
        case preload
        
        @available(*, deprecated, message: "It is no longer part of the web standards.")
        case prerender
        
        /// Indicates a page pagination.
        case prev
        
        /// Indicates a search content.
        case search
        
        /// Indicates a style sheet.
        case stylesheet
        
        /// Indicates a content tag.
        case tag
        
        @available(*, deprecated, message: "It is no longer part of the web standards. Use 'icon' instead.")
        case shortcutIcon = "shortcut icon"
        
        /// Indicates a touch icon.
        case appleTouchIcon = "apple-touch-icon"
        
        /// Indicates a launch screen.
        case appleTouchStartupImage = "apple-touch-startup-image"
    }

    /// A target of a link reference.
    ///
    /// ```swift
    /// Anchor {
    ///     "Lorem ipsum"
    /// }
    /// .reference("https://...")
    /// .target(.blank)
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

    /// A shape of a map area.
    ///
    /// ```swift
    /// Area()
    ///     .shape(.polygon)
    /// ```
    public enum Shape: String {
        
        /// Expects the entire region.
        case `default`
        
        /// Expects a circular region.
        case circle
        
        /// Expects a polygonal region.
        case polygon = "poly"
        
        /// Expects a rectangular region.
        case rectangle = "rect"
    }

    /// The manner of the text wrapping.
    ///
    /// ```swift
    /// TextArea {
    /// }
    /// .wrap(.soft)
    /// ```
    public enum Wrapping: String {
        
        /// Does not wrap the text after form submission.
        case soft
        
        /// Wraps the text, after form submission.
        case hard
    }

    /// The writing direction of text content.
    ///
    /// ```html
    /// Paragraph {
    ///     "Lorem ipsum..."
    /// }
    /// .direction(.leftToRight)
    /// ```
    public enum Direction: String {
        
        /// Sets the direction left to right.
        case leftToRight = "ltr"
        
        /// Sets the direction right to left.
        case rightToLeft = "rtl"
        
        /// Decides the direction by its content.
        case auto
    }

    /// A type of a media element.
    ///
    /// ```swift
    /// Link()
    ///     .type(.css)
    ///     .reference("...css")
    /// ```
    public enum Media: String {
        
        /// Indicates a html content.
        case html = "text/html"
        
        /// Indicates a style sheet.
        case css = "text/css"
        
        /// Indicates video content.
        case ogg = "video/ogg"
        
        /// Indicates video content.
        case mp4 = "video/mp4"
        
        /// Indicates video content.
        case webm = "video/webm"
        
        /// Indicates a audio content.
        case mpeg = "audio/mpeg"
        
        /// Indicates a js content.
        case javascript = "application/javascript"
        
        /// Indicates a favorite icon.
        case xIcon = "image/x-icon"
    }

    /// A marker for an item list.
    ///
    /// ```swift
    /// OrderedList {
    ///     ListItem {
    ///         "Lorem ipsum"
    ///     }
    /// }
    /// .type(.lowercaseAlpha)
    /// ```
    public enum Marker: String {
        
        /// Uses numbers e.g. 1, 2, 3
        case decimal = "1"
        
        /// Uses uppercase letters e.g. A, B, C
        case uppercaseAlpha = "A"
        
        /// Uses lowercase letters e.g. a, b, c
        case lowercaseAlpha = "a"
        
        /// Uses uppercase Roman numerals e.g. I, II, III
        case uppercaseRoman = "I"
        
        /// Uses lowercase Roman numerals e.g. i, ii, iii
        case lowercaseRoman = "i"
    }

    /// The type of a page document.
    ///
    /// ```swift
    /// Document(.html5)
    /// ```
    public enum Doctype: String {
        
        /// Indicates a html document.
        case html5 = "html"
        
        case html4Strict = #"HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd""#
        
        case html4Transitional = #"HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd""#
        
        case html4Frameset = #"HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd""#
        
        case xhtmlStrict = #"html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd""#
        
        case xhtmlTransitional = #"html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd""#
        
        case xhtmlFrameset = #"html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd""#
        
        case xhtml = #"html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd""#
    }

    /// A key of a preview property.
    ///
    /// ```swift
    /// Meta()
    ///     .property(.locale)
    /// ```
    public enum Graph: String {

        /// Indicates the page title.
        case title = "og:title"
        
        /// Indicates the share picture.
        case image = "og:image"
        
        /// Indicates a content description.
        case description = "og:description"
        
        /// Indicates the content format.
        case type = "og:type"
        
        /// Indicates the document url.
        case url = "og:url"
        
        /// Indicates the content language.
        case locale = "og:locale"
        
        /// Indicates the site name.
        case siteName = "og:site_name"
    }

    /// A label for the enter key.
    ///
    /// ```swift
    /// Input()
    ///     .enterKeyHint(.next)
    /// ```
    public enum Hint: String {
        
        /// Displays Enter as the hint.
        case enter
        
        /// Displays Done as the hint.
        case done
        
        /// Displays Go as the hint.
        case go
        
        /// Displays Next as the hint.
        case next
        
        /// Displays Previous as the hint.
        case previous
        
        /// Displays Search as the hint.
        case search
        
        /// Displays Send as the hint.
        case send
    }

    /// A manner of input capitalization.
    ///
    /// ```swift
    /// Input()
    ///     .autocapitalize(.words)
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

    /// The character encoding of the document.
    ///
    /// ```swift
    /// Meta()
    ///     .chartset(.utf8)
    /// ```
    public enum Charset: String {
        
        /// Specifies the encoding for unicode.
        case utf8 = "utf-8"
        
        /// Specifies the encoding for unicode.
        case utf16 = "utf-16"
        
        /// Specifies the encoding for windows-1252.
        case ansi = "windows-1252"
        
        /// Specifies the encoding for latin alphabet.
        case iso = "iso-8859-1"
    }

    /// A equivalent of a header directive.
    ///
    /// ```swift
    /// Meta()
    ///     .equivalent(.content)
    /// ```
    public enum Equivalent: String {
        
        /// Specifies the character encoding.
        case content = "content-type"
        
        /// Specifies the preferred stylesheet.
        case `default` = "default-style"
        
        /// Specifies the redirect delay.
        case refresh = "refresh"
    }

    /// The role of a non-semantic element.
    ///
    /// ```swift
    /// Anchor {
    ///     "Lorem ipsum..."
    /// }
    /// .reference("https://...")
    /// .target(.blank)
    /// .role(.button)
    /// ```
    public enum Role: String {
        
        /// Indicates an alert message.
        case alert
        
        /// Indicates an alert window.
        case alertDialog = "alertdialog"
        
        /// Indicates an desktop application.
        case application
        
        /// Indicates a blog post.
        case article
        
        /// Indicates a page header.
        case banner
        
        /// Indicates an action button.
        case button
        
        /// Indicates a table cell.
        case cell
        
        /// Indicates a check box.
        case checkbox
        
        /// Indicates a table header.
        case columnHeader = "columnheader"
        
        /// Indicates a select list.
        case combobox
        
        @available(*, deprecated, message: "It is an abstract role and should not be used.")
        case command
        
        /// Indicates a text comment.
        case comment
        
        /// Indicates a page aside.
        case complementary
        
        @available(*, deprecated, message: "It is an abstract role and should not be used.")
        case composite
        
        /// Indicates a page footer.
        case contentInfo = "contentinfo"
        
        /// Indicates a term definition.
        case definition
        
        /// Indicates a dialog window.
        case dialog
        
        @available(*, deprecated, message: "It is no longer part of the web standards. Use 'list' instead.")
        case directory
        
        /// Indicates a read mode.
        case document
        
        /// Indicates a content feed.
        case feed
        
        /// Indicates a media figure.
        case figure
        
        /// Indicates a form container.
        case form
        
        /// Indicates a content grid.
        case grid
        
        /// Indicates a table cell.
        case gridCell = "gridcell"
        
        /// Indicates a group container.
        case group
        
        /// Indicates a text heading.
        case heading
        
        /// Indicates an image set.
        case img
        
        @available(*, deprecated, message: "It is an abstract role and should not be used.")
        case input
        
        @available(*, deprecated, message: "It is an abstract role and should not be used.")
        case landmark
        
        /// Indicates an item list.
        case list
        
        /// Indicates a select list.
        case listBox = "listbox"
        
        /// Indicates a list item.
        case listItem = "listitem"
        
        /// Indicates a chat log.
        case log
        
        /// Indicates the main content.
        case main
        
        /// Indicates a text mark.
        case mark
        
        /// Indicates a live area.
        case marquee
        
        /// Indicates a mathematical expression.
        case math
        
        /// Indicates a comamnd menu.
        case menu
        
        /// Indicates a command menu.
        case menuBar = "menubar"
        
        /// Indicates a menu item.
        case menuItem = "menuitem"
        
        /// Indicates a menu control.
        case menuItemCheckbox = "menuitemcheckbox"
        
        /// Indicates a menu control.
        case menuItemRadio = "menuitemradio"
        
        /// Indicates a level meter.
        case meter
        
        /// Indicates a page navigation.
        case navigation
        
        /// Indicates no role.
        case none
        
        /// Indicates a text note.
        case note
        
        /// Indicates a select option.
        case option
        
        /// Indicates a presentation purpose only.
        case presentation
        
        /// Indicates a radio select.
        case radio
        
        @available(*, deprecated, message: "It is an abstract role and should not be used.")
        case range
        
        /// Indicates a content section.
        case region
        
        @available(*, deprecated, message: "It is an abstract role and should not be used.")
        case roleType = "roletype"
        
        /// Indicates a table row.
        case row
        
        /// Indicates a row group.
        case rowGroup = "rowgroup"
        
        /// Indicates a row header.
        case rowHeader = "rowheader"
        
        /// Indicates a scrollbar.
        case scrollbar
        
        /// Indicates a search form.
        case search
        
        /// Indicates a search control.
        case searchBox = "searchbox"
        
        @available(*, deprecated, message: "It is an abstract role and should not be used.")
        case sectionHead = "sectionhead"
        
        @available(*, deprecated, message: "It is an abstract role and should not be used.")
        case select
        
        /// Indicates a content divider.
        case separator
        
        /// Indicates a status mesage.
        case status
        
        @available(*, deprecated, message: "It is an abstract role and should not be used.")
        case structure
        
        /// Indicates a content suggestion.
        case suggestion
        
        /// Indicates a toggle switch.
        case `switch`
        
        /// Indicates a tab item.
        case tab
        
        /// Indicates a table container.
        case table
        
        /// Indicates a tab list.
        case tabList = "tablist"
        
        /// Indicates a tab panel.
        case tabPanel = "tabpanel"
        
        /// Indicates a word definition.
        case term
        
        /// Indicates a text control.
        case textbox
        
        /// Indicates a time counter.
        case timer
        
        /// Indicates a toolbar.
        case toolbar
        
        /// Indicates a tooltip.
        case tooltip
        
        /// Indicates a tree view.
        case tree
        
        /// Indicates a tree grid.
        case treeGrid = "treegrid"
        
        /// Indicates a tree item.
        case treeItem = "treeitem"
        
        @available(*, deprecated, message: "It is an abstract role and should not be used.")
        case widget
        
        @available(*, deprecated, message: "It is an abstract role and should not be used.")
        case window
    }

    /// The corner shape of the stroke edge.
    ///
    /// ```struct
    /// Vector {
    ///     Line {
    ///     }
    ///     .strokeLineCap(.butt)
    /// }
    /// ```
    public enum Linecap: String {
        
        /// Indicates squared edges at the endpoint.
        case butt
        
        /// Indicates squared edges past the endpoint.
        case square
            
        /// Indicates rounded edges.
        case round
    }

    /// The corner shape of the stroke joint.
    ///
    /// ```struct
    /// Vector {
    ///     Line {
    ///     }
    ///     .strokeLineJoin(.miter)
    /// }
    /// ```
    public enum Linejoin: String {
        
        /// Indicates a sharp join.
        case miter
        
        /// Indicates a round join.
        case round
        
        /// Indicates a beveled join.
        case bevel
    }

    /// A decision used for automated translation.
    ///
    /// ```swift
    /// Span {
    ///     "Lorem ipsum"
    /// }
    /// .translate(.no)
    /// ```
    public enum Decision: String {
        
        /// Tells a affirmative decision.
        case yes
        
        /// Tells a negative decision.
        case no
    }

    /// A type of a text track.
    ///
    /// ```swift
    /// Track()
    ///     .kind(.captions)
    /// ```
    public enum Kind: String {
        
        /// Indicates a caption track.
        case captions
        
        /// Indicates a chapter track.
        case chapters
        
        /// Indicates a description track.
        case descriptions
        
        /// Indicates a metadata track.
        case metadata
        
        /// Indicates a subtitle track.
        case subtitles
    }

    /// The behaviour used for loading audio.
    ///
    /// ```swift
    /// Audio {
    ///     Source()
    ///         .source(...mp4)
    ///         .type(.mp4)
    /// }
    /// .preload(.auto)
    /// ```
    public enum Preload: String {
        
        /// Should load on page load.
        case auto
        
        /// Should only load metadata on page load.
        case metadata
        
        /// Should not load on page load.
        case none
    }
    
    /// A type as resource hint.
    ///
    /// ```swift
    /// Link()
    ///     .as(.fetch)
    /// ```
    public enum Resource: String {
        
        /// Hints a fetch response.
        case fetch
        
        /// Hints a font file.
        case font
        
        /// Hints an image file.
        case image
        
        /// Hints a script file.
        case script
        
        /// Hints a style sheet.
        case style
        
        /// Hints a text track.
        case track
    }

    public enum Accessibility {
        
        /// An indicator of a completion manner.
        ///
        /// ```swift
        /// Input()
        ///     .aria(autoComplete: .inline)
        /// ```
        public enum Complete: String {
            
            /// Indicates no suggestions.
            case none
            
            /// Indicates the suggestions will be inserted into the input.
            case inline
            
            /// Indicates the suggestions shown in a list.
            case list
            
            /// Indicates inline and list suggestions.
            case both
        }

        /// An indicator of checked state.
        ///
        /// ```swift
        /// Division {
        /// }
        /// .aria(checked: .mixed)
        /// ```
        public enum Check: String {
            
            /// Indicates the element is not checked.
            case `false`
            
            /// Indicates the element has three states to check.
            case `mixed`
            
            /// Indicates the element is checked.
            case `true`
            
            /// Indicates the element is not checkable.
            case `undefined`
        }

        /// An indicator of the current position.
        ///
        /// ```swift
        /// ListItem {
        /// }
        /// .aria(current: .true)
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

        /// An indicator of a popup type.
        ///
        /// ```swift
        /// Button {
        /// }
        /// .aria(hasPopup: .dialog)
        /// ```
        public enum Popup: String {
            
            /// Indicates no popup.
            case `false`
            
            /// Indicates the popup is a menu.
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

        /// An indicator of an input validation.
        ///
        /// ```swift
        /// Input()
        ///     .aria(invalid: .true)
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

        /// An indicator of a notification manner.
        ///
        /// ```swift
        /// Division {
        /// }
        /// .aria(live: .polite)
        /// ```
        public enum Live: String {
            
            /// Indicates that updates to the region should be presented the user immediately.
            case assertive
            
            /// Indicates that updates to the region should not be presented to the user unless the used is currently focused on that region.
            case off
            
            /// Indicates that updates to the region should be presented at the next graceful opportunity.
            case polite
        }

        /// An indicator of the element orientation.
        ///
        /// ```swift
        /// ```
        public enum Orientation: String {
            
            /// Indicates that the element's orientation is unknown.
            case undefined
            
            /// Indicates that the element is oriented horizontally.
            case horizontal
            
            /// Indicates that the element is oriented vertically.
            case vertical
        }

        /// An indicator of a pressed state.
        ///
        /// ```swift
        /// Button {
        ///     "Lorem"
        /// }
        /// .aria(pressed: .true)
        /// ```
        public enum Pressed: String {
            
            /// Indicates the element is not pressable.
            case undefined
            
            /// Indicates the element is not pressed.
            case `false`
            
            /// Indicates the element has three states to press.
            case mixed
            
            /// Indicates the element is pressed.
            case `true`
        }

        /// An indicator of a text revision.
        ///
        /// ```swift
        /// Division {
        /// }
        /// .aria(relevant: .all)
        /// ```
        public enum Relevant: String {
            
            /// Indicates node additions.
            case additions
            
            /// Indicates node and text additions.
            case additionsText
            
            /// Indicates all relevants.
            case all
            
            /// Indicates node removals.
            case removals
            
            /// Indicates text additions.
            case text
        }

        /// An indicator of a selected state.
        ///
        /// ```swift
        /// Division {
        ///     Division {
        ///         Paragraph {
        ///             "Lorem ipsum"
        ///         }
        ///     }
        ///     .aria(selected: .true)
        ///     Division {
        ///         Paragraph {
        ///             "Lorem ipsum"
        ///         }
        ///     }
        /// }
        /// .role(.tablist)
        /// ```
        public enum Selected: String {
            
            /// Indicates the element is not selectable.
            case undefined
            
            /// Indicates the element is not selected.
            case `false`
            
            /// Indicates the element is selected.
            case `true`
        }

        /// An indicator of the sort algorithm.
        ///
        /// ```swift
        /// HeaderCell {
        /// }
        /// .aria(sort: .ascending)
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
        
        /// A mode for the shadow access.
        ///
        /// ```swift
        /// Template {
        /// }
        /// .shadowRootMode(.open)
        /// ```
        public enum Mode: String {
            
            /// Opens the shadow root. It can be reached via javascript.
            case open
            
            /// Closes the shadow root. It cannot be reached from the outside.
            case closed
        }
    }
    
    /// A fetch priority of an element.
    ///
    /// ```swift
    /// Image()
    ///     .source("...jpg")
    ///     .alternate("Lorem ipsum...")
    ///     .fetchPriority(.high)
    /// ```
    public enum Priority: String {
        
        /// Signals a higher priority for fetching relative to other resources.
        case high
        
        /// Signals a lower priority for fetching relative to other resources.
        case low
        
        /// Signals a automatic determination of the fetch priority.
        case auto
    }
    
    /// A loading strategy of an element.
    ///
    /// ```swift
    /// Image()
    ///     .source("...jpg")
    ///     .alternate("Lorem ipsum...")
    ///     .loading(.eager)
    /// ```
    public enum Loading: String {
        
        /// Defers fetching a resource until some conditions are met.
        case lazy
        
        /// Fetches a resource immediately.
        case eager
    }
    
    /// A decoding strategy of an element.
    ///
    /// ```swift
    /// Image()
    ///     .source("...jpg")
    ///     .alternate("Lorem ipsum...")
    ///     .decoding(.async)
    /// ```
    public enum Decoding: String {
        
        /// Hints a preference to decode synchronously.
        case sync
        
        /// Hints a preference to decode asynchronously.
        case async
        
        /// Hints no preference for the decoding.
        case auto
    }
    
    /// A rendering strategy of an element.
    ///
    /// ```swift
    /// Style {
    ///     """
    ///     p { text-align: center; }
    ///     """
    /// }
    /// .blocking(.render)
    /// ```
    public enum Blocking: String {
        
        /// Indicates a render-blocking element.
        case render
    }
    
    public enum Popover {
        
        /// A state for a popover trigger.
        ///
        /// ```swift
        /// Division {
        /// }
        /// .popover(.manual)
        /// ```
        public enum State: String {
            
            /// Closes other popovers when opened.
            case auto
            
            /// Does not close other popovers.
            case manual
        }
        
        /// An action for a popover target.
        ///
        /// ```swift
        /// Button {
        ///     "Lorem ipsum"
        /// }
        /// .popoverTarget("id")
        /// .popoverAction(.hide)
        /// ```
        public enum Action: String {
            
            /// Toggles between showing and hidden.
            case toggle
            
            /// Shows a popover.
            case show
            
            /// Hides a popover.
            case hide
        }
    }
    
    /// A scope for a header cell.
    ///
    /// ```swift
    /// HeaderCell {
    ///     "Lorem ipsum"
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
  
    /// A mode for the virtual keyboard.
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
    
    /// A setting for text completion.
    ///
    /// ```swift
    /// Select {
    /// }
    /// .autocomplete([.organization, .organizationTitle])
    /// ```
    public enum Completion: String {
        
        /// Enables completion.
        case on
        
        /// Disables completion.
        case off
        
        /// Expects a name.
        case name
        
        /// Expects a prefix like Mr, Ms, Dr.
        case honorificPrefix = "honorific-prefix"
        
        /// Expects the first name.
        case givenName = "given-name"
        
        /// Expects a middle name.
        case additionalName = "additional-name"
        
        /// Expects the last name.
        case familyName = "family-name"
        
        /// Expects a degree.
        case honorificSuffix = "honorific-suffix"
        
        /// Expects a screen name.
        case nickname
        
        /// Expects a username.
        case username
        
        /// Expects a new password.
        case newPassword = "new-password"
        
        /// Expects the current password.
        case currentPassword = "current-password"
        
        /// Expects a company name.
        case organization
        
        /// Expects a job title.
        case organizationTitle = "organization-title"
        
        /// Expects a one time code.
        case oneTimeCode = "one-time-code"
        
        /// Expects a address.
        case streetAddress = "street-address"
        
        /// Expects a address.
        case addressLine1 = "address-line1"
        
        /// Expects a address.
        case addressLine2 = "address-line2"
        
        /// Expects a address.
        case addressLine3 = "address-line3"
        
        /// Expects a country code.
        case country = "country"
        
        /// Expects the country name.
        case countryName = "country-name"
        
        /// Expects a postal code.
        case postalCode = "postal-code"
        
        /// Expects shipping information.
        case shipping
        
        /// Expects billing information.
        case billing
        
        /// Expects the full name for payment.
        case paymentName = "cc-name"
        
        /// Expects the first name for payment.
        case paymentGivenName = "cc-given-name"
        
        /// Expects the middle name for payment.
        case paymentAdditionalName = "cc-additional-name"
        
        /// Expects the last name for payment.
        case paymentFamilyName = "cc-family-name"
        
        /// Expects the credit card number for payment.
        case paymentNumber = "cc-number"
        
        /// Expects the experiation date for payment.
        case paymentExpiry = "cc-expiry"
        
        /// Expects the experiation month for payment.
        case paymentExpiryMonth = "cc-expiry-month"
        
        /// Expects the experiation year for payment.
        case paymentExpiryYear = "cc-expiry-year"
        
        /// Expects the credit security code.
        case paymentSecurityCode = "cc-csc"
        
        /// Expects a payment type.
        case paymentType = "cc-type"
        
        /// Expects a transaction currency.
        case transactionCurrency = "transaction-currency"
        
        /// Expects the amount for payment.
        case transactionAmount = "transaction-amount"
        
        /// Expects a perferred language.
        case language
        
        /// Expects a birthday date.
        case birthday = "bday"
        
        /// Expects the day detail of the birthday date.
        case birthdayDay = "bday-day"
        
        /// Expects the month detail of the birthday date.
        case birthdayMonth = "bday-month"
        
        /// Expects the year detail of the birthday date.
        case birthdayYear = "bday-year"
        
        /// Expects a gender detail.
        case sex
        
        /// Expects a photo.
        case photo
        
        /// Expects a phone number.
        case phone = "tel"
        
        /// Expects the country code of the phone number.
        case phoneCountryCode = "tel-country-code"
        
        /// Expects a phone number without the country code.
        case phoneNational = "tel-national"
        
        /// Expects the area code of the phone number.
        case phoneAreaCode = "tel-area-code"
        
        /// Expects a phone number without the country and area code.
        case phoneLocal = "tel-local"
        
        /// Expects the local prefix of the phone number.
        case phoneLocalPrefix = "tel-local-prefix"
        
        /// Expects the local suffix of the phone number.
        case phoneLocalSuffix = "tel-local-suffix"
        
        /// Phone internal extension code.
        case phoneExtension = "tel-extension"
        
        /// Expects a url.
        case url
        
        /// Expects an email address.
        case email
        
        /// Expects a url for instant messaging.
        case messagingProtocol = "impp"
    }
    
    /// A enumeration of extra permission
    ///
    /// ```swift
    /// InlineFrame {
    /// }
    /// .sandbox([.allowDownloads, .allowForms])
    /// ```
    public enum Permission: String {
        
        /// Permits downloads.
        case allowDownloads = "allow-downloads"
        
        /// Permits form submissions within the content.
        case allowForms = "allow-forms"
        
        /// Permits to open modals.
        case allowModals = "allow-modals"
        
        /// Permits to lock the screen orientation.
        case allowOrientationLock = "allow-orientation-lock"
        
        /// Permits the use of the pointer lock API.
        case allowPointerLock = "allow-pointer-lock"
        
        /// Permits to open popups.
        case allowPopups = "allow-popups"
        
        /// Permits popups to open new windows without inheriting the sandboxing.
        case allowPopupsToEscapeSandbox = "allow-popups-to-escape-sandbox"
        
        /// Permits to start a presentation session.
        case allowPresentation = "allow-presentation"
        
        /// Permits the content to be treated as being from the same origin.
        case allowSameOrigin = "allow-same-origin"
        
        /// Permits script execution.
        case allowScripts = "allow-scripts"
        
        /// Permits the content to navigate its top-level browsing context.
        case allowTopNavigation = "allow-top-navigation"
        
        /// Permits the content to navigate its top-level browsing context, but only if initiated by user.
        case allowTopNavigationByUserActivation = "allow-top-navigation-by-user-activation"
    }
}
