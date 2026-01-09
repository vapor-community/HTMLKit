/// A type that represents a locale
///
/// A locale holds information about language, region and cultural preferences.
@_documentation(visibility: internal)
public struct Locale: Hashable, Sendable {
    
    /// A enumeration of potential language tags
    public enum Tag: String, Sendable {
        
        case arabic = "ar"
        case belarusian = "be"
        case bulgarian = "bg"
        case catalan = "ca"
        case czech = "cs"
        case danish = "da"
        case german = "de"
        case greek = "el"
        case english = "en"
        case spanish = "es"
        case finnish = "fi"
        case french = "fr"
        case icelandic = "is"
        case italian = "it"
        case japanese = "ja"
        case hebrew = "he"
        case hindi = "hi"
        case croation = "hr"
        case hungarian = "hu"
        case korean = "ko"
        case lithuanian = "lt"
        case latvian = "lv"
        case macedonian = "mk"
        case norwegian = "nb"
        case dutch = "nl"
        case polish = "pl"
        case portuguese = "pt"
        case romanian = "ro"
        case russian = "ru"
        case serbian = "sr"
        case slovak = "sk"
        case slovenian = "sl"
        case albanian = "sq"
        case swedish = "sv"
        case thai = "th"
        case turkish = "tr"
        case ukrainian = "uk"
        case chinese = "zh"
    }
    
    /// The language code of the language
    ///
    /// The language code represents the generic language.
    public var language: String? {
        return tag.components(separatedBy: "-").first
    }
    
    /// The region code of the language
    ///
    /// The region code refers to the regional dialect of a language.
    public var region: String? {
        
        let components = tag.components(separatedBy: "-")
        
        if components.count > 1 {
            return components.last
        }
        
        return nil
    }
    
    /// The currency code of the language
    public var currencyCode: String? {
        return currencyCodes[tag]
    }
    
    /// The currency symbol of the language
    public var currencySymbol: String? {
        return currencySymbols[tag]
    }
    
    /// The decimal seperator of the language
    public var decimalSeparator: String? {
        return decimalSeparators[tag]
    }
    
    /// The date format of the language
    public var dateFormat: String? {
        return dateFormats[tag]
    }
    
    /// The time format of the language
    public var timeFormat: String? {
        return timeFormats[tag]
    }
    
    /// The locale identifier
    public let tag: String
    
    /// Initializes a locale
    ///
    /// - Parameter tag: A locale tag e.g. en-US
    public init(tag: String) {
        self.tag = tag
    }
    
    /// Initializes a locale with a predefined tag
    ///
    /// - Parameter tag: A locale tag e.g. en-US
    public init(tag: Tag) {
        self.tag = tag.rawValue
    }
}

extension Locale {
    
    internal var currencyCodes: [String: String] {
        return [
            "ar-AE": "AED‏",
            "ar_QA": "QAR",
            "be-BY": "BYR",
            "bg-BG": "BGN",
            "ca-ES": "EUR",
            "cs-CZ": "CZK",
            "da-DK": "DKK",
            "de-DE": "EUR",
            "el-GR": "EUR",
            "en-GB": "GBP",
            "en-US": "USD",
            "es-ES": "EUR",
            "fi-FI": "EUR",
            "fr-FR": "EUR",
            "is-IS": "ISK",
            "it-IT": "EUR",
            "ja-JP": "JPY",
            "he-IL": "ILS",
            "hi-IN": "INR",
            "hr-HR": "HRK",
            "hu-HU": "HUF",
            "ko-KP": "KPW",
            "ko-KR": "KRW",
            "lt-LT": "EUR",
            "lv-LV": "EUR",
            "mk-MK": "MKD",
            "nl-NL": "EUR",
            "nb-NO": "NOK",
            "pl-PL": "PLN",
            "pt-PT": "EUR",
            "ro-RO": "RON",
            "ru-RU": "RUB",
            "sr_RS": "RSD",
            "sr_XK": "EUR",
            "sk-SK": "EUR",
            "sl-SI": "EUR",
            "sq-AL": "ALL",
            "sv-SE": "SEK",
            "th-TH": "THB",
            "tr-TR": "TRY",
            "uk-UA": "UAH",
            "zh-CN": "CNY",
            "zh-HK": "HKD",
        ]
    }
    
    internal var currencySymbols: [String: String] {
        return [
            "ar-AE": "د.إ.‏",
            "ar_QA": "ر.ق.‏",
            "be-BY": "Br",
            "bg-BG": "лв.",
            "ca-ES": "€",
            "cs-CZ": "Kč",
            "da-DK": "kr.",
            "de-DE": "€",
            "el-GR": "€",
            "en-GB": "£",
            "en-US": "$",
            "es-ES": "€",
            "fi-FI": "€",
            "fr-FR": "€",
            "is-IS": "ISK",
            "it-IT": "€",
            "ja-JP": "¥",
            "he-IL": "₪",
            "hi-IN": "₹",
            "hr-HR": "HRK",
            "hu-HU": "Ft",
            "ko-KP": "KPW",
            "ko-KR": "₩",
            "lt-LT": "€",
            "lv-LV": "€",
            "mk-MK": "ден",
            "nl-NL": "€",
            "nb-NO": "kr",
            "pl-PL": "zł",
            "pt-PT": "€",
            "ro-RO": "RON",
            "ru-RU": "₽",
            "sr_RS": "RSD",
            "sk-SK": "€",
            "sl-SI": "€",
            "sq-AL": "Lekë",
            "sv-SE": "kr",
            "th-TH": "THB",
            "tr-TR": "₺",
            "uk-UA": "₴",
            "zh-CN": "¥",
            "zh-HK": "HK$",
        ]
    }
    
    internal var decimalSeparators: [String: String] {
        return [
            "ar-AE": ",",
            "ar_QA": ",",
            "be-BY": ",",
            "bg-BG": ",",
            "ca-ES": ",",
            "cs-CZ": ",",
            "da-DK": ",",
            "de-DE": ",",
            "el-GR": ",",
            "en-GB": ".",
            "en-US": ".",
            "es-ES": ",",
            "fi-FI": ",",
            "fr-FR": ",",
            "is-IS": ",",
            "it-IT": ",",
            "ja-JP": ".",
            "he-IL": ".",
            "hi-IN": ".",
            "hr-HR": ",",
            "hu-HU": ",",
            "ko-KP": ".",
            "ko-KR": ".",
            "lt-LT": ",",
            "lv-LV": ",",
            "mk-MK": ",",
            "nl-NL": ",",
            "nb-NO": ",",
            "pl-PL": ",",
            "pt-PT": ",",
            "ro-RO": ",",
            "ru-RU": ",",
            "sr_RS": ",",
            "sk-SK": ",",
            "sl-SI": ",",
            "sq-AL": ",",
            "sv-SE": ",",
            "th-TH": ".",
            "tr-TR": ",",
            "uk-UA": ",",
            "zh-CN": ".",
            "zh-HK": ".",
        ]
    }
    
    internal var dateFormats: [String: String] {
        return  [
            
            "ar-AE": "dd‏/MM‏/yyyy",
            "ar_QA": "dd‏/MM‏/yyyy",
            "be-BY": "dd.MM.yyyy",
            "bg-BG": "dd.MM.yyyy",
            "ca-ES": "dd/MM/yyyy",
            "cs-CZ": "dd. MM. yyyy",
            "da-DK": "yyyy-mm-dd",
            "de-DE": "dd.MM.yyyy",
            "el-GR": "dd/MM/yyyy",
            "en-GB": "dd/MM/yyyy",
            "en-US": "M/D/yyyy",
            "es-ES": "dd/MM/yyyy",
            "fi-FI": "dd.MM.yyyy",
            "fr-FR": "dd/MM/yyyy",
            "is-IS": "dd.MM.yyyy",
            "it-IT": "dd/MM/yyyy",
            "ja-JP": "yyyy/MM/dd",
            "he-IL": "dd.MM.yyyy",
            "hi-IN": "dd/MM/yyyy",
            "hr-HR": "dd.MM.yyyy.",
            "hu-HU": "yyyy. MM. dd.",
            "ko-KP": "yyyy. MM. dd.",
            "ko-KR": "yyyy. MM. dd.",
            "lt-LT": "yyyy-MM-dd",
            "lv-LV": "dd.MM.yyyy",
            "mk-MK": "dd.MM.yyyy",
            "nl-NL": "dd-MM-yyyy",
            "nb-NO": "dd.MM.yyyy",
            "pl-PL": "dd.MM.yyyy",
            "pt-PT": "dd/MM/yyyy",
            "ro-RO": "dd.MM.yyyy",
            "ru-RU": "dd.MM.yyyy",
            "sr_RS": "dd.MM.yyyy.",
            "sk-SK": "dd. MM. yyyy",
            "sl-SI": "dd. MM. yyyy",
            "sq-AL": "dd.MM.yyyy",
            "sv-SE": "yyyy-MM-dd",
            "th-TH": "dd/MM/y",
            "tr-TR": "dd.MM.yyyy",
            "uk-UA": "dd.MM.yyyy",
            "zh-CN": "yyyy/MM/dd",
            "zh-HK": "dd/MM/yyyy",
        ]
    }
    
    internal var timeFormats: [String: String] {
        return  [
            "en-GB": "HH:mm:ss",
            "en-US": "h:mm:ss tt",
            "de-DE": "HH:mm:ss",
            "fr-FR": "HH:mm:ss",
            "ru-RU": "H:mm:ss",
        ]
    }
}
