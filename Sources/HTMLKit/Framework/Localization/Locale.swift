import Foundation

/// A type that represents a locale.
///
/// A locale holds information about language, region and cultural preferences.
@_documentation(visibility: internal)
public struct Locale: Sendable {
    
    /// An enumeration of potential languages.
    public enum Language: String, Sendable {
        
        case albanian = "sq"
        case arabic = "ar"
        case belarusian = "be"
        case bengali = "bn"
        case bulgarian = "bg"
        case catalan = "ca"
        case chinese = "zh"
        case croatian = "hr"
        case czech = "cs"
        case danish = "da"
        case dutch = "nl"
        case english = "en"
        case estonian = "et"
        case finnish = "fi"
        case french = "fr"
        case german = "de"
        case greek = "el"
        case hebrew = "he"
        case hindi = "hi"
        case hungarian = "hu"
        case icelandic = "is"
        case indonesian = "id"
        case italian = "it"
        case japanese = "ja"
        case korean = "ko"
        case latvian = "lv"
        case lithuanian = "lt"
        case macedonian = "mk"
        case malay = "ms"
        case norwegian = "nb"
        case persian = "fa"
        case polish = "pl"
        case portuguese = "pt"
        case romanian = "ro"
        case russian = "ru"
        case serbian = "sr"
        case slovak = "sk"
        case slovenian = "sl"
        case spanish = "es"
        case swedish = "sv"
        case turkish = "tr"
        case ukrainian = "uk"
    }
    
    /// The language code of the language.
    ///
    /// The language code represents the generic language.
    public var language: String? {
        return tag.components(separatedBy: "-").first
    }
    
    /// The region code of the language.
    ///
    /// The region code refers to the regional dialect of a language.
    public var region: String? {
        
        let components = tag.components(separatedBy: "-")
        
        if components.count > 1 {
            return components.last
        }
        
        return nil
    }
    
    /// The currency code of the language.
    public var currencyCode: String? {
        return currencyCodes[tag]
    }
    
    /// The currency symbol of the language.
    public var currencySymbol: String? {
        return currencySymbols[tag]
    }
    
    /// The decimal seperator of the language.
    public var decimalSeparator: String? {
        return decimalSeparators[tag]
    }
    
    /// The date format of the language.
    public var dateFormat: String? {
        return dateFormats[tag]
    }
    
    /// The time format of the language.
    public var timeFormat: String? {
        return timeFormats[tag]
    }
    
    /// The plural rules of the language.
    public func pluralCategory(by number: Double) -> PluralCategory {
        
        guard let rules = pluralRules[tag] else {
            return .other
        }
        
        /// The positive value of the number
        let absolute = abs(number)
        
        /// The integral part of the number
        let integral = Int(absolute)
        
        /// The fractional part of the number
        let fraction = absolute.truncatingRemainder(dividingBy: 1)
        
        /// The number of fractional digits
        let scale = String(absolute).count - String(integral).count - 1
        
        /// The exponent value of the number
        let exponent = absolute.exponent
        
        return rules(integral, fraction, scale, exponent)
    }
    
    public func pluralCategory(by number: Int) -> PluralCategory {
        
        guard let rules = pluralRules[tag] else {
            return .other
        }
        
        /// The positive value of the number
        let absolute = abs(number)
        
        /// The integer part of the number
        let integer = Int(absolute)
        
        return rules(integer, 0, 0, 0)
    }
    
    /// The locale identifier.
    internal let tag: String
    
    /// Create a locale.
    ///
    /// - Parameter tag: A locale tag e.g. en-US.
    public init(tag: String) {
        self.tag = tag
    }
    
    /// Create a locale with a predefined tag.
    ///
    /// - Parameter tag: A locale tag e.g. en-US.
    public init(tag: Language) {
        self.tag = tag.rawValue
    }
}

extension Locale {
    
    private var pluralRules: [String: (_ i: Int, _ f: Double, _ s: Int, _ e: Int) -> PluralCategory] {
        return [
            "ar-AE": { i, f, s, e in
                
                if i == 0 && f == 0 {
                    return .zero
                }
                
                if i == 1 && f == 0 {
                    return .one
                }
                
                if i == 2 && f == 0 {
                    return .two
                }
                
                if (3...10).contains(i % 100) && f == 0 {
                    return .few
                }
                
                if (11...99).contains(i % 100) && f == 0 {
                    return .many
                }
                
                return .other
            },
            "ar-DZ": { i, f, s, e in
                
                if i == 0 && f == 0 {
                    return .zero
                }
                
                if i == 1 && f == 0 {
                    return .one
                }
                
                if i == 2 && f == 0 {
                    return .two
                }
                
                if (3...10).contains(i % 100) && f == 0 {
                    return .few
                }
                
                if (11...99).contains(i % 100) && f == 0 {
                    return .many
                }
                
                return .other
            },
            "ar-EG": { i, f, s, e in
                
                if i == 0 && f == 0 {
                    return .zero
                }
                
                if i == 1 && f == 0 {
                    return .one
                }
                
                if i == 2 && f == 0 {
                    return .two
                }
                
                if (3...10).contains(i % 100) && f == 0 {
                    return .few
                }
                
                if (11...99).contains(i % 100) && f == 0 {
                    return .many
                }
                
                return .other
            },
            "ar-IQ": { i, f, s, e in
                
                if i == 0 && f == 0 {
                    return .zero
                }
                
                if i == 1 && f == 0 {
                    return .one
                }
                
                if i == 2 && f == 0 {
                    return .two
                }
                
                if (3...10).contains(i % 100) && f == 0 {
                    return .few
                }
                
                if (11...99).contains(i % 100) && f == 0 {
                    return .many
                }
                
                return .other
            },
            "ar-QA": { i, f, s, e in
                
                if f == 0 && i == 0 {
                    return .zero
                }
                
                if f == 0 && i == 1 {
                    return .one
                }
                
                if f == 0 && i == 2 {
                    return .two
                }
                
                if f == 0 && (3...10).contains(i % 100) {
                    return .few
                }
                
                if f == 0 && (11...99).contains(i % 100) {
                    return .many
                }
                
                return .other
            },
            "az-AZ": { i, f, s, e in
                return .other
            },
            "be-BY": { i, f, s, e in
                
                if i % 10 == 1 && i % 100 != 11 && f == 0 {
                    return .one
                }
                
                if (2...4).contains(i % 10) && !(12...14).contains(i % 100) && f == 0 {
                    return .few
                }
                
                if i % 10 == 0 && f == 0 || (5...9).contains(i % 10) && f == 0 || (11...14).contains(i % 100) && f == 0 {
                    return .many
                }
                
                return .other
            },
            "bg-BG": { i, f, s, e in
                
                if f == 0 && i == 1 {
                    return .one
                }
                
                return .other
            },
            "ca-ES": { i, f, s, e in
                
                if s == 0 && i == 1 {
                    return .one
                }
                
                if e == 0 && i != 0 && i % 1000000 == 0 && s == 0 || !(0...5).contains(e) {
                    return .many
                }
                
                return .other
            },
            "cs-CZ": { i, f, s, e in 
                
                if f == 0 && i == 1 {
                    return .one
                }
                
                if f == 0 && (2...4).contains(i){
                    return .few
                }
                
                if f != 0 {
                    return .many
                }
                
                return .other
            },
            "da-DK": { i, f, s, e in 
            
                let t = 0
            
                if i == 1 || t != 0 && (0...1).contains(i) {
                    return .one
                }
                
                return .other
            },
            "de-DE": { i, f, s, e in 
                
                if f == 0 && i == 1 {
                    return .one
                }
                
                return .other
            },
            "de-AT": { i, f, s, e in
                
                if f == 0 && i == 1 {
                    return .one
                }
                
                return .other
            },
            "de-CH": { i, f, s, e in
                
                if f == 0 && i == 1 {
                    return .one
                }
                
                return .other
            },
            "en-AU": { i, f, s, e in
                
                if s == 0 && i == 1 {
                    return .one
                }
                
                return .other
            },
            "en-CA": { i, f, s, e in
                
                if s == 0 && i == 1 {
                    return .one
                }
                
                return .other
            },
            "en-GB": { i, f, s, e in
                
                if s == 0 && i == 1 {
                    return .one
                }
                
                return .other
            },
            "en-IE": { i, f, s, e in
                
                if s == 0 && i == 1 {
                    return .one
                }
                
                return .other
            },
            "en-US": { i, f, s, e in
                
                if s == 0 && i == 1 {
                    return .one
                }
                
                return .other
            },
            "en-SG": { i, f, s, e in
                
                if s == 0 && i == 1 {
                    return .one
                }
                
                return .other
            },
            "el-GR": { i, f, s, e in
                
                if i == 1 {
                    return .one
                }
                
                return .other
            },
            "es-AR": { i, f, s, e in
                
                if i == 1 {
                    return .one
                }
                
                if e == 0 && i != 0 && i % 1000000 == 0 && s == 0 || !(0...5).contains(e) && s == 0 {
                    return .many
                }
                
                return .other
            },
            "es-CL": { i, f, s, e in
                
                if i == 1 {
                    return .one
                }
                
                if e == 0 && i != 0 && i % 1000000 == 0 && s == 0 || !(0...5).contains(e) && s == 0 {
                    return .many
                }
                
                return .other
            },
            "en-CO": { i, f, s, e in
                
                if i == 1 {
                    return .one
                }
                
                if e == 0 && i != 0 && i % 1000000 == 0 && s == 0 || !(0...5).contains(e) && s == 0 {
                    return .many
                }
                
                return .other
            },
            "es-ES": { i, f, s, e in
                
                if i == 1 {
                    return .one
                }
                
                if e == 0 && i != 0 && i % 1000000 == 0 && s == 0 || !(0...5).contains(e) && s == 0 {
                    return .many
                }
                
                return .other
            },
            "es-MX": { i, f, s, e in
                
                if i == 1 {
                    return .one
                }
                
                if e == 0 && i != 0 && i % 1000000 == 0 && s == 0 || !(0...5).contains(e) && s == 0 {
                    return .many
                }
                
                return .other
            },
            "et-EE": { i, f, s, e in
                
                if i == 1 && s == 0 {
                    return .one
                }
                
                return .other
            },
            "fa-IR": { i, f, s, e in
                return .other
            },
            "fi-FI": { i, f, s, e in
                
                if s == 0 && i == 1 {
                    return .one
                }
                
                return .other
            },
            "fr-FR": { i, f, s, e in
                
                if (0...1).contains(i) {
                    return .one
                }
                
                if e == 0 && i != 0 && i % 1000000 == 0 && s == 0 || !(0...5).contains(e) && s == 0 {
                    return .many
                }
                
                return .other
            },
            "fr-LU": { i, f, s, e in
                
                if (0...1).contains(i) {
                    return .one
                }
                
                if e == 0 && i != 0 && i % 1000000 == 0 && s == 0 || !(0...5).contains(e) && s == 0 {
                    return .many
                }
                
                return .other
            },
            "he-IL": { i, f, s, e in
                
                if i == 1 && s == 0 || i == 0 {
                    return .one
                }
                
                if i == 2 && s == 0 {
                    return .two
                }
                
                return .other
            },
            "hi-IN": { i, f, s, e in
                
                if (0...1).contains(i) && f == 0 {
                    return .one
                }
            
                return .other
            },
            "hr-HR": { i, f, s, e in
                
                let t = Int(f * pow(10.0, Double(s)))
                
                if s == 0 && i % 10 == 1 && i % 100 != 11 || t % 10 == 1 && t % 100 != 11 {
                    return .one
                }
                
                if s == 0 && (2...4).contains(i % 10) && !(12...14).contains(i % 100) || (2...4).contains(t % 10) && !(12...14).contains(t % 100) {
                    return .few
                }
                
                return .other
            },
            "hu-HU": { i, f, s, e in
                
                if i == 1 {
                    return .one
                }
                
                return .other
            },
            "hy-AM": { i, f, s, e in
                
                if i == 0 || i == 1 {
                    return .one
                }
                
                return .other
            },
            "is-IS": { i, f, s, e in
                
                let t = Int(f * pow(10.0, Double(s)))
                
                if t == 0 && i % 10 == 1 && i % 100 != 11 || t % 10 == 1 &&
                t % 100 != 11 {
                    return .one
                }
                
                return .other
            },
            "it-IT": { i, f, s, e in
                
                if s == 0 && i == 1 {
                    return .one
                }
                
                if e == 0 && i != 0 && i % 1000000 == 0 && f == 0 || !(0...5).contains(e) {
                    return .many
                }
                
                return .other
            },
            "ja-JP": { i, f, s, e in
                return .other // done
            },
            "ka-GE": { i, f, s, e in
                
                if i == 1 {
                    return .one
                }
                
                return .other
            },
            "ko-KP": { i, f, s, e in
                return .other // done
            },
            "ko-KR": { i, f, s, e in
                return .other // done
            },
            "lt-LT": { i, f, s, e in
                
                if i % 10 == 1 && !(11...19).contains(i % 100) {
                    return .one
                }
                
                if (2...9).contains(i % 10) && !(11...19).contains(i % 100) {
                    return .few
                }
                
                if f != 0 {
                    return .many
                }
                
                return .other
            },
            "lv-LV": { i, f, s, e in
                
                let t = Int(f * pow(10.0, Double(s)))
                
                if i % 10 == 0 && f == 0 || (11...19).contains(i % 100) && f == 0 || (11...19).contains(t % 100) && f == 0 {
                    return .zero
                }
                
                if i % 10 == 1 && i % 100 != 11 && f != 2 || f != 2 && t % 10 == 1 && t % 100 != 11 || f != 2 && t % 10 == 1 {
                    return .one
                }
                
                return .other
            },
            "mk-MK": { i, f, s, e in
                
                let t = Int(f * pow(10.0, Double(s)))
                
                if i % 10 == 1 && i % 100 != 11 || t % 10 == 1 && t % 100 != 11 {
                    return .one
                }
                    
                return .other
            },
            "ms-MY": { i, f, s, e in
                return .other // done
            },
            "mt-MT": { i, f, s, e in
                
                if i == 1 && f == 0 {
                    return .one
                }
                
                if i == 2 && f == 0 {
                    return .two
                }
                
                if i == 0 && f == 0 || (3...10).contains(i % 100) && f == 0 {
                    return .few
                }
                
                if (11...19).contains(i % 100) && f == 0 {
                    return .many
                }
                
                return .other
            },
            "nl-NL": { i, f, s, e in
                
                if s == 0 && i == 1 {
                    return .one
                }
                
                return .other
            },
            "no-NO": { i, f, s, e in
                
                if i == 1 {
                    return .one
                }
                
                return .other
            },
            "pl-PL": { i, f, s, e in
                
                if s == 0 && i == 1 {
                    return .one
                }
                
                if s == 0 && (2...4).contains(i % 10) && !(12...14).contains(i % 100) {
                    return .few
                }
                
                if s == 0 && i != 1 && (0...1).contains(i % 10) || s == 0 && (5...9).contains(i % 10) || s == 0 && (12...14).contains(i % 100) {
                    return .many
                }
                
                return .other
            },
            "pt-PT": { i, f, s, e in
                
                if i == 1 {
                    return .one
                }
                
                if e == 0 && i != 0 && i % 1000000 == 0 && s == 0 || !(0...5).contains(e) && s == 0 {
                    return .many
                }
                
                return .other
            },
            "ro-RO": { i, f, s, e in
                
                if i == 1 && s == 0 {
                    return .one
                }
                
                if f != 0 || i == 0 || i != 1 && (1...19).contains(i) {
                    return .few
                }
                
                return .other
            },
            "ru-BY": { i, f, s, e in
                return .other
            },
            "ru-RU": { i, f, s, e in
                
                if f == 0 && i % 10 == 1 && i % 100 != 11 {
                    return .one
                }
                
                if f == 0 && (2...4).contains(i % 10) && !(12...14).contains(i % 100) {
                    return .few
                }
                
                if f == 0 && i % 10 == 0 || f == 0 && (5...9).contains(i % 10) || f == 0 && (11...14).contains(i % 100) {
                    return .many
                }
                
                return .other
            },
            "sk-SK": { i, f, s, e in
                
                if i == 1 && s == 0 {
                    return .one
                }
                
                if (2...4).contains(i) && s == 0 {
                    return .few
                }
                
                if f != 0 {
                    return .many
                }
                
                return .other
            },
            "sl-SI": { i, f, s, e in
                
                if s == 0 && i % 100 == 1 {
                    return .one
                }
                
                if s == 0 && i % 100 == 2 {
                    return .two
                }
                
                if s == 0 && (3...4).contains(i % 100) || s != 0 {
                    return .few
                }
                
                return .other
            },
            "sr-RS": { i, f, s, e in
                
                let t = Int(f * pow(10.0, Double(s)))
                
                if f == 0 && i % 10 == 1 && i % 100 != 11 || t % 10 == 1 && t % 100 != 11 {
                    return .one
                }
                
                if f == 0 && (2...4).contains(i % 10) && !(12...14).contains(i % 100) || (2...4).contains(t % 10) && !(12...14).contains(t % 100) {
                    return .few
                }
                
                return .other
            },
            "sr-XK": { i, f, s, e in
                return .other
            },
            "sq-AL": { i, f, s, e in
                
                if i == 1 {
                    return .one
                }
                
                return .other
            },
            "sv-SE": { i, f, s, e in
                
                if i == 1 && s == 0 {
                    return .one
                }
                
                return .other
            },
            "th-TH": { i, f, s, e in
                return .other // done
            },
            "tr-TR": { i, f, s, e in
                
                if i == 1 {
                    return .one
                }
                
                return .other
            },
            "uk-UA": { i, f, s, e in
                
                if f == 0 && i % 10 == 1 && i % 100 != 11 {
                    return .one
                }
                
                if f == 0 && (2...4).contains(i % 10) && !(12...14).contains(i % 100) {
                    return .few
                }
                
                if f == 0 && i % 10 == 0 || f == 0 && (5...9).contains(i % 10) || f == 0 && (11...14).contains(i % 100) {
                    return .many
                }
                
                return .other
            },
            "zh-CN": { i, f, s, e in
                return .other // done
            },
            "zh-HK": { i, f, s, e in
                return .other // done
            }
        ]
    }
    
    private var currencyCodes: [String: String] {
        return [
            "ar-AE": "AED‏",
            "ar-DZ": "DZD",
            "ar-EG": "EGP",
            "ar-IQ": "IQD",
            "ar-QA": "QAR",
            "az-AZ": "AZN",
            "be-BY": "BYR",
            "bg-BG": "BGN",
            "ca-ES": "EUR",
            "cs-CZ": "CZK",
            "da-DK": "DKK",
            "de-AT": "EUR",
            "de-CH": "CHF",
            "de-DE": "EUR",
            "en-AU": "AUD",
            "en-CA": "CAD",
            "en-GB": "GBP",
            "en-IE": "EUR",
            "en-US": "USD",
            "en-SG": "SGD",
            "el-GR": "EUR",
            "es-AR": "ARS",
            "es-CL": "CLP",
            "es-CO": "COP",
            "es-ES": "EUR",
            "es-MX": "MXN",
            "et-EE": "EUR",
            "fa-IR": "IRR",
            "fi-FI": "EUR",
            "fr-FR": "EUR",
            "fr-LU": "EUR",
            "he-IL": "ILS",
            "hi-IN": "INR",
            "hr-HR": "HRK",
            "hu-HU": "HUF",
            "hy-AM": "AMD",
            "id-ID": "IDR",
            "is-IS": "ISK",
            "it-IT": "EUR",
            "ja-JP": "JPY",
            "ka-GE": "GEL",
            "ko-KP": "KPW",
            "ko-KR": "KRW",
            "lt-LT": "EUR",
            "lv-LV": "EUR",
            "mk-MK": "MKD",
            "ms-MY": "MYR",
            "mt-MT": "EUR",
            "nl-BE": "EUR",
            "nl-NL": "EUR",
            "no-NO": "NOK",
            "pl-PL": "PLN",
            "ps-AF": "AFN",
            "pt-BR": "BRL",
            "pt-PT": "EUR",
            "ro-RO": "RON",
            "ru-BY": "BYR",
            "ru-RU": "RUB",
            "sk-SK": "EUR",
            "sl-SI": "EUR",
            "sr-RS": "RSD",
            "sr-XK": "EUR",
            "sq-AL": "ALL",
            "sv-SE": "SEK",
            "th-TH": "THB",
            "tr-TR": "TRY",
            "uk-UA": "UAH",
            "zh-CN": "CNY",
            "zh-HK": "HKD"
        ]
    }
    
    private var currencySymbols: [String: String] {
        return [
            "ar-AE": "د.إ.‏",
            "ar-DZ": "د.ج",
            "ar-EG": "£",
            "ar-IQ": "ع.د",
            "ar-QA": "ر.ق.‏",
            "az-AZ": "₼",
            "be-BY": "Br",
            "bg-BG": "лв.",
            "ca-ES": "€",
            "cs-CZ": "Kč",
            "da-DK": "kr.",
            "de-AT": "€",
            "de-CH": "Fr.",
            "de-DE": "€",
            "en-AU": "$",
            "en-CA": "$",
            "en-GB": "£",
            "en-IE": "€",
            "en-US": "$",
            "en-SG": "$",
            "el-GR": "€",
            "es-AR": "$",
            "es-CL": "$",
            "es-CO": "$",
            "es-ES": "€",
            "es-MX": "$",
            "et-EE": "€",
            "fa-IR": "﷼",
            "fi-FI": "€",
            "fr-FR": "€",
            "fr-LU": "€",
            "he-IL": "₪",
            "hi-IN": "₹",
            "hr-HR": "HRK",
            "hu-HU": "Ft",
            "hy-AM": "֏",
            "id-ID": "Rp",
            "is-IS": "ISK",
            "it-IT": "€",
            "ja-JP": "¥",
            "ka-GE": "₾",
            "ko-KP": "KPW",
            "ko-KR": "₩",
            "lt-LT": "€",
            "lv-LV": "€",
            "mk-MK": "ден",
            "ms-MY": "RM",
            "mt-MT": "€",
            "nl-BE": "€",
            "nl-NL": "€",
            "no-NO": "kr",
            "pl-PL": "zł",
            "ps-AF": "؋",
            "pt-BR": "R$",
            "pt-PT": "€",
            "ro-RO": "RON",
            "ru-BY": "₽",
            "ru-RU": "₽",
            "sk-SK": "€",
            "sl-SI": "€",
            "sr-RS": "RSD",
            "sr-XK": "€",
            "sq-AL": "Lekë",
            "sv-SE": "kr",
            "th-TH": "THB",
            "tr-TR": "₺",
            "uk-UA": "₴",
            "zh-CN": "¥",
            "zh-HK": "HK$",
        ]
    }
    
    private var decimalSeparators: [String: String] {
        return [
            "ar-AE": ",",
            "ar-DZ": ",",
            "ar-EG": ",",
            "ar-IQ": ",",
            "ar-QA": ",",
            "az-AZ": ",",
            "be-BY": ",",
            "bg-BG": ",",
            "ca-ES": ",",
            "cs-CZ": ",",
            "da-DK": ",",
            "de-AT": ",",
            "de-CH": ",",
            "de-DE": ",",
            "en-AU": ".",
            "en-CA": ".",
            "en-GB": ".",
            "en-IE": ".",
            "en-US": ".",
            "en-SG": ".",
            "el-GR": ",",
            "es-AR": ",",
            "es-CL": ",",
            "es-CO": ",",
            "es-ES": ",",
            "es-MX": ".",
            "et-EE": ",",
            "fa-IR": ",",
            "fi-FI": ",",
            "fr-FR": ",",
            "fr-LU": ",",
            "he-IL": ".",
            "hi-IN": ".",
            "hr-HR": ",",
            "hu-HU": ",",
            "hy-AM": ",",
            "is-IS": ",",
            "it-IT": ",",
            "ja-JP": ".",
            "ka-GE": ",",
            "ko-KP": ".",
            "ko-KR": ".",
            "lt-LT": ",",
            "lv-LV": ",",
            "mk-MK": ",",
            "ms-MY": ".",
            "mt-MT": ".",
            "nl-BE": ",",
            "nl-NL": ",",
            "no-NO": ",",
            "pl-PL": ",",
            "ps-AF": ",",
            "pt-BR": ",",
            "pt-PT": ",",
            "ro-RO": ",",
            "ru-BY": ",",
            "ru-RU": ",",
            "sk-SK": ",",
            "sl-SI": ",",
            "sr-RS": ",",
            "sr-XK": ",",
            "sq-AL": ",",
            "sv-SE": ",",
            "th-TH": ".",
            "tr-TR": ",",
            "uk-UA": ",",
            "zh-CN": ".",
            "zh-HK": ".",
        ]
    }
    
    private var dateFormats: [String: String] {
        return [
            "ar-AE": "dd‏/MM‏/yyyy",
            "ar-DZ": "dd/MM/yyyy",
            "ar-EG": "dd/MM/yyyy",
            "ar-IQ": "dd/MM/yyyy",
            "ar-QA": "dd‏/MM‏/yyyy",
            "az-AZ": "dd.MM.yyyy",
            "be-BY": "dd.MM.yyyy",
            "bg-BG": "dd.MM.yyyy",
            "ca-ES": "dd/MM/yyyy",
            "cs-CZ": "dd. MM. yyyy",
            "da-DK": "yyyy-mm-dd",
            "de-AT": "dd.MM.yyyy",
            "de-CH": "dd.MM.yyyy",
            "de-DE": "dd.MM.yyyy",
            "en-AU": "dd/MM/yyyy",
            "en-CA": "yyyy-MM-dd",
            "en-GB": "dd/MM/yyyy",
            "en-IE": "dd/MM/yyyy",
            "en-SG": "dd/MM/yyyy",
            "en-US": "M/D/yyyy",
            "el-GR": "dd/MM/yyyy",
            "es-AR": "dd/MM/yyyy",
            "es-CL": "dd-MM-yyyy",
            "es-CO": "dd/MM/yyyy",
            "es-ES": "dd/MM/yyyy",
            "es-MX": "dd/MM/yyyy",
            "et-EE": "dd.MM.yyyy",
            "fa-IR": "yyyy/MM/dd",
            "fi-FI": "dd.MM.yyyy",
            "fr-FR": "dd/MM/yyyy",
            "fr-LU": "dd/MM/yyyy",
            "he-IL": "dd.MM.yyyy",
            "hi-IN": "dd/MM/yyyy",
            "hr-HR": "dd.MM.yyyy.",
            "hu-HU": "yyyy. MM. dd.",
            "hy-AM": "dd.MM.yyyy",
            "id-ID": "dd/MM/yyyy",
            "is-IS": "dd.MM.yyyy",
            "it-IT": "dd/MM/yyyy",
            "ja-JP": "yyyy/MM/dd",
            "ka-GE": "dd.MM.yyyy",
            "ko-KR": "yyyy. MM. dd.",
            "ko-KP": "yyyy. MM. dd.",
            "lt-LT": "yyyy-MM-dd",
            "lv-LV": "dd.MM.yyyy",
            "mk-MK": "dd.MM.yyyy",
            "ms-MY": "dd/MM/yyyy",
            "mt-MT": "dd/MM/yyyy",
            "nl-NL": "dd-MM-yyyy",
            "nl-BE": "dd-MM-yyyy",
            "no-NO": "dd.MM.yyyy",
            "pl-PL": "dd.MM.yyyy",
            "ps-AF": "dd/MM/yyyy",
            "pt-BR": "dd/MM/yyyy",
            "pt-PT": "dd/MM/yyyy",
            "ro-RO": "dd.MM.yyyy",
            "ru-BY": "dd.MM.yyyy",
            "ru-RU": "dd.MM.yyyy",
            "sk-SK": "dd. MM. yyyy",
            "sl-SI": "dd. MM. yyyy",
            "sr-RS": "dd.MM.yyyy.",
            "sr-XK": "dd.MM.yyyy.",
            "sq-AL": "dd.MM.yyyy",
            "sv-SE": "yyyy-MM-dd",
            "th-TH": "dd/MM/y",
            "tr-TR": "dd.MM.yyyy",
            "uk-UA": "dd.MM.yyyy",
            "zh-CN": "yyyy/MM/dd",
            "zh-HK": "dd/MM/yyyy",
        ]
    }
    
    private var timeFormats: [String: String] {
        return [
            "ar-AE": "h:mm:ss tt",
            "ar-DZ": "H:mm:ss",
            "ar-EG": "h:mm:ss tt",
            "ar-IQ": "h:mm:ss tt",
            "ar-QA": "h:mm:ss tt",
            "az-AZ": "H:mm:ss",
            "be-BY": "H:mm:ss",
            "bg-BG": "H:mm:ss",
            "ca-ES": "H:mm:ss",
            "cs-CZ": "H:mm:ss",
            "da-DK": "H.mm.ss",
            "de-AT": "HH:mm:ss",
            "de-CH": "HH:mm:ss",
            "de-DE": "HH:mm:ss",
            "en-AU": "h:mm:ss tt",
            "en-CA": "h:mm:ss tt",
            "en-GB": "HH:mm:ss",
            "en-IE": "HH:mm:ss",
            "en-SG": "h:mm:ss tt",
            "en-US": "h:mm:ss tt",
            "el-GR": "H:mm:ss",
            "es-AR": "H:mm:ss",
            "es-CL": "H:mm:ss",
            "es-CO": "h:mm:ss tt",
            "es-ES": "H:mm:ss",
            "es-MX": "h:mm:ss tt",
            "et-EE": "H:mm:ss",
            "fa-IR": "H:mm:ss",
            "fi-FI": "H.mm.ss",
            "fr-FR": "HH:mm:ss",
            "fr-LU": "HH:mm:ss",
            "he-IL": "H:mm:ss",
            "hi-IN": "h:mm:ss a",
            "hr-HR": "H:mm:ss",
            "hu-HU": "H:mm:ss",
            "hy-AM": "H:mm:ss",
            "id-ID": "HH:mm:ss",
            "is-IS": "H:mm:ss",
            "it-IT": "H:mm:ss",
            "ja-JP": "H:mm:ss",
            "ko-KP": "H:mm:ss",
            "ko-KR": "a h:mm:ss",
            "lt-LT": "HH:mm:ss",
            "lv-LV": "HH:mm:ss",
            "mk-MK": "H:mm:ss",
            "nl-BE": "HH:mm:ss",
            "nl-NL": "HH:mm:ss",
            "no-NO": "HH:mm:ss",
            "pl-PL": "HH:mm:ss",
            "ps-AF": "H:mm:ss",
            "pt-BR": "HH:mm:ss",
            "pt-PT": "HH:mm:ss",
            "ro-RO": "HH:mm:ss",
            "ru-BY": "HH:mm:ss",
            "ru-RU": "H:mm:ss",
            "sk-SK": "H:mm:ss",
            "sl-SI": "H:mm:ss",
            "sr-RS": "H:mm:ss",
            "sr-XK": "HH:mm:ss",
            "sq-AL": "HH:mm:ss",
            "sv-SE": "HH:mm:ss",
            "th-TH": "H:mm:ss",
            "tr-TR": "HH:mm:ss",
            "uk-UA": "HH:mm:ss",
            "zh-CN": "ah:mm:ss",
            "zh-HK": "ah:mm:ss",
        ]
    }
}

extension Locale: Hashable {
    
    public static func == (lhs: Locale, rhs: Locale) -> Bool {
        return lhs.tag == rhs.tag
    }
}

extension Locale: CustomStringConvertible {
    
    public var description: String {
        return tag
    }
}
