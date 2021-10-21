/// The type is for
///
///
public enum NameType: String {
    
    case author
    case description
    case generator
    case keywords
    case viewport
    case applicationName = "application-name"
}

/// The enum is for
///
///
public enum ButtonType: String {

    case submit
    case button
    case reset
}

/// The type is for
///
///
public enum EncodeType: String {
    
    case urlEncoded = "application/x-www-form-urlencoded"
    case multipart = "multipart/form-data"
    case plainText = "text/plain"
}

/// The enum is for
///
///
public enum MethodType: String {
    
    case post
    case get
}

/// The type is for
///
///
public enum InputType: String {
    
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

/// The type is for
///
///
public enum LanguageType: String {
    
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

/// The type is for
///
///
public enum PolicyType: String {
    
    case strictOriginWhenCrossOrigin = "strict-origin-when-cross-origin"
    case noReferrer = "no-referrer"
    case noReferrerWhenDowngrade = "no-referrer-when-downgrade"
    case origin = "origin"
    case originWhenCrossOrigin = "origin-when-cross-origin"
    case sameOrigin = "same-origin"
    case strictOrigin = "strict-origin"
    case unsafeUrl = "unsafe-url"
}

/// The type is for
///
///
public enum RelationshipType: String {
    
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
}

/// The enum is for
///
///
public enum TargetType: String {
    
    case blank
    case `self`
    case parent
    case top
}

/// The type is for
///
///
public enum ShapeType: String {
    
    case `default`
    case circle
    case polygon = "poly"
    case rectangle = "rect"
}

/// The type is for
///
///
public enum WrapType: String {
    
    case soft
    case hard
}

/// The enum is for
///
///
public enum DirectionType: String, HTMLContent {
    
    case leftToRight = "ltr"
    case rightToLeft = "rtl"
    case auto
}

extension DirectionType {
    
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        self.rawValue
    }

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: self.rawValue)
    }
}

/// The type is for
///
///
public enum MediaType {
    
    public enum Common: String {
        
        case html = "text/html"
        case css = "text/css"
    }
    
    public enum Style: String {
        
        case css = "text/css"
    }
    
    public enum Source: String {
        
        case ogg = "video/ogg"
        case mp4 = "video/mp4"
        case webm = "video/webm"
        case mpeg = "audio/mpeg"
    }
    
    public enum Script: String {
        
        case javascript = "application/javascript"
    }
}

/// The type is for
///
///
public enum MarkerType: String {
    
    case decimal = "1"
    case uppercaseAlpha = "A"
    case lowercaseAlpha = "a"
    case uppercaseRoman = "I"
    case lowercaseRoman = "i"
}

/// The type is for
///
///
public enum DocumentType: String {
        
    case html5 = "html"
    case html4Strict = #"HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd""#
    case html4Transitional = #"HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd""#
    case html4Frameset = #"HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd""#
    case xhtmlStrict = #"html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd""#
    case xhtmlTransitional = #"html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd""#
    case xhtmlFrameset = #"html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd""#
    case xhtml = #"html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd""#
}
