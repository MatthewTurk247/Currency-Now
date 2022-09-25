//
//  Currency.swift
//  Currency Now
//
//  Created by Matthew Turk on 7/26/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation

protocol Exchangeable {
    var rates: [String: Any] { get }
    var base: Currency { get }
    var success: Bool { get }
}

enum Currency: CaseIterable {
    case AED, AFN, ALL, AMD, ANG, AOA, ARS, AUD
    case AWG, AZN, BAM, BBD, BDT, BGN, BHD, BIF
    case BMD, BND, BOB, BRL, BSD, BTC, BTN, BWP
    case BYN, BZD, CAD, CDF, CHF, CLP
    case CNY, COP, CRC, CUP, CVE, CZK, DJF
    case DKK, DOP, DZD, EGP, ERN, ETB, EUR, FJD
    case FKP, GBP, GEL, GGP, GHS, GIP, GMD, GNF
    case GTQ, GYD, HKD, HNL, HRK, HTG, HUF, IDR
    case ILS, INR, IQD, IRR, ISK, JEP, JMD
    case JOD, JPY, KES, KGS, KHR, KMF, KRW
    case KWD, KYD, KZT, LAK, LBP, LKR, LRD, LSL
    case LTL, LVL, LYD, MAD, MDL, MGA, MKD, MMK
    case MNT, MOP, MRO, MUR, MVR, MWK, MXN, MYR
    case MZN, NAD, NGN, NIO, NOK, NPR, NZD, OMR
    case PAB, PEN, PGK, PHP, PKR, PLN, PYG, QAR
    case RON, RSD, RUB, RWF, SAR, SBD, SCR, SDG
    case SEK, SGD, SHP, SLL, SOS, SRD, STD, SVC
    case SYP, SZL, THB, TJS, TMT, TND, TOP, TRY
    case TTD, TWD, TZS, UAH, UGX, USD, UYU, UZS
    case VEF, VND, VUV, WST, ZAR, ZMW, ZWL
    
    var home: Continent {
        switch self {
        case .AED:
            return .asia
        case .AFN:
            return .asia
        case .ALL:
            return .europe
        case .AMD:
            return .asia
        case .ANG:
            return .europe
        case .AOA:
            return .africa
        case .ARS:
            return .southAmerica
        case .AUD:
            return .australia
        case .AWG:
            return .southAmerica
        case .AZN:
            return .europe
        case .BAM:
            return .europe
        case .BBD:
            return .southAmerica
        case .BDT:
            return .asia
        case .BGN:
            return .europe
        case .BHD:
            return .asia
        case .BIF:
            return .africa
        case .BMD:
            return .northAmerica
        case .BND:
            return .asia
        case .BOB:
            return .southAmerica
        case .BRL:
            return .southAmerica
        case .BSD:
            return .northAmerica
        case .BTC:
            return .cryptocurrency
        case .BTN:
            return .asia
        case .BWP:
            return .africa
        case .BYN:
            return .europe
        case .BZD:
            return .southAmerica
        case .CAD:
            return .northAmerica
        case .CDF:
            return .africa
        case .CHF:
            return .europe
        case .CLP:
            return .southAmerica
        case .CNY:
            return .asia
        case .COP:
            return .southAmerica
        case .CRC:
            return .northAmerica
        case .CUP:
            return .northAmerica
        case .CVE:
            return .africa
        case .CZK:
            return .europe
        case .DJF:
            return .africa
        case .DKK:
            return .europe
        case .DOP:
            return .northAmerica
        case .DZD:
            return .africa
        case .EGP:
            return .africa
        case .ERN:
            return .africa
        case .ETB:
            return .africa
        case .EUR:
            return .europe
        case .FJD:
            return .australia
        case .FKP:
            return .southAmerica
        case .GBP:
            return .europe
        case .GEL:
            return .europe
        case .GGP:
            return .europe
        case .GHS:
            return .africa
        case .GIP:
            return .europe
        case .GMD:
            return .africa
        case .GNF:
            return .australia
        case .GTQ:
            return .northAmerica
        case .GYD:
            return .southAmerica
        case .HKD:
            return .asia
        case .HNL:
            return .northAmerica
        case .HRK:
            return .europe
        case .HTG:
            return .northAmerica
        case .HUF:
            return .europe
        case .IDR:
            return .asia
        case .ILS:
            return .asia
        case .INR:
            return .asia
        case .IQD:
            return .asia
        case .IRR:
            return .asia
        case .ISK:
            return .europe
        case .JEP:
            return .europe
        case .JMD:
            return .northAmerica
        case .JOD:
            return .asia
        case .JPY:
            return .asia
        case .KES:
            return .africa
        case .KGS:
            return .asia
        case .KHR:
            return .asia
        case .KMF:
            return .africa
        case .KRW:
            return .asia
        case .KWD:
            return .asia
        case .KYD:
            return .northAmerica
        case .KZT:
            return .asia
        case .LAK:
            return .asia
        case .LBP:
            return .asia
        case .LKR:
            return .asia
        case .LRD:
            return .africa
        case .LSL:
            return .africa
        case .LTL:
            return .africa
        case .LVL:
            return .europe
        case .LYD:
            return .africa
        case .MAD:
            return .africa
        case .MDL:
            return .europe
        case .MGA:
            return .africa
        case .MKD:
            return .europe
        case .MMK:
            return .asia
        case .MNT:
            return .asia
        case .MOP:
            return .asia
        case .MRO:
            return .africa
        case .MUR:
            return .africa
        case .MVR:
            return .asia
        case .MWK:
            return .africa
        case .MXN:
            return .northAmerica
        case .MYR:
            return .asia
        case .MZN:
            return .africa
        case .NAD:
            return .africa
        case .NGN:
            return .africa
        case .NIO:
            return .northAmerica
        case .NOK:
            return .europe
        case .NPR:
            return .asia
        case .NZD:
            return .australia
        case .OMR:
            return .asia
        case .PAB:
            return .northAmerica
        case .PEN:
            return .southAmerica
        case .PGK:
            return .australia
        case .PHP:
            return .asia
        case .PKR:
            return .asia
        case .PLN:
            return .europe
        case .PYG:
            return .southAmerica
        case .QAR:
            return .asia
        case .RON:
            return .europe
        case .RSD:
            return .europe
        case .RUB:
            return .europe
        case .RWF:
            return .africa
        case .SAR:
            return .asia
        case .SBD:
            return .australia
        case .SCR:
            return .africa
        case .SDG:
            return .africa
        case .SEK:
            return .europe
        case .SGD:
            return .asia
        case .SHP:
            return .africa
        case .SLL:
            return .africa
        case .SOS:
            return .africa
        case .SRD:
            return .southAmerica
        case .STD:
            return .africa
        case .SVC:
            return .northAmerica
        case .SYP:
            return .asia
        case .SZL:
            return .africa
        case .THB:
            return .asia
        case .TJS:
            return .asia
        case .TMT:
            return .asia
        case .TND:
            return .africa
        case .TOP:
            return .australia
        case .TRY:
            return .asia
        case .TTD:
            return .northAmerica
        case .TWD:
            return .asia
        case .TZS:
            return .africa
        case .UAH:
            return .europe
        case .UGX:
            return .africa
        case .USD:
            return .northAmerica
        case .UYU:
            return .southAmerica
        case .UZS:
            return .asia
        case .VEF:
            return .southAmerica
        case .VND:
            return .asia
        case .VUV:
            return .australia
        case .WST:
            return .australia
        case .ZAR:
            return .africa
        case .ZMW:
            return .africa
        case .ZWL:
            return .africa
        }
    }
    
    var name: String {
        switch self {
        case .AED:
            return "United Arab Emirates Dirham"
        case .AFN:
            return "Afghan Afghani"
        case .ALL:
            return "Albanian Lek"
        case .AMD:
            return "Armenian Dram"
        case .ANG:
            return "Netherlands Antillean Guilder"
        case .AOA:
            return "Angolan Kwanza"
        case .ARS:
            return "Argentine Peso"
        case .AUD:
            return "Australian Dollar"
        case .AWG:
            return "Aruban Florin"
        case .AZN:
            return "Azerbaijani Manat"
        case .BAM:
            return "Bosnia-Herzegovina Convertible Mark"
        case .BBD:
            return "Barbadian Dollar"
        case .BDT:
            return "Bangladeshi Taka"
        case .BGN:
            return "Bulgarian Lev"
        case .BHD:
            return "Bahraini Dinar"
        case .BIF:
            return "Burundian Franc"
        case .BMD:
            return "Bermudan Dollar"
        case .BND:
            return "Brunei Dollar"
        case .BOB:
            return "Bolivian Boliviano"
        case .BRL:
            return "Brazilian Real"
        case .BSD:
            return "Bahamian Dollar"
        case .BTC:
            return "Bitcoin"
        case .BTN:
            return "Bhutanese Ngultrum"
        case .BWP:
            return "Botswanan Pula"
        case .BYN:
            return "Belarusian Ruble"
        case .BZD:
            return "Belize Dollar"
        case .CAD:
            return "Canadian Dollar"
        case .CDF:
            return "Congolese Franc"
        case .CHF:
            return "Swiss Franc"
        case .CLP:
            return "Chilean Peso"
        case .CNY:
            return "Chinese Yuan"
        case .COP:
            return "Colombian Peso"
        case .CRC:
            return "Costa Rican Col\u{00f3}n"
        case .CUP:
            return "Cuban Peso"
        case .CVE:
            return "Cape Verdean Escudo"
        case .CZK:
            return "Czech Republic Koruna"
        case .DJF:
            return "Djiboutian Franc"
        case .DKK:
            return "Danish Krone"
        case .DOP:
            return "Dominican Peso"
        case .DZD:
            return "Algerian Dinar"
        case .EGP:
            return "Egyptian Pound"
        case .ERN:
            return "Eritrean Nakfa"
        case .ETB:
            return "Ethiopian Birr"
        case .EUR:
            return "Euro"
        case .FJD:
            return "Fijian Dollar"
        case .FKP:
            return "Falkland Islands Pound"
        case .GBP:
            return "British Pound Sterling"
        case .GEL:
            return "Georgian Lari"
        case .GGP:
            return "Guernsey Pound"
        case .GHS:
            return "Ghanaian Cedi"
        case .GIP:
            return "Gibraltar Pound"
        case .GMD:
            return "Gambian Dalasi"
        case .GNF:
            return "Guinean Franc"
        case .GTQ:
            return "Guatemalan Quetzal"
        case .GYD:
            return "Guyanaese Dollar"
        case .HKD:
            return "Hong Kong Dollar"
        case .HNL:
            return "Honduran Lempira"
        case .HRK:
            return "Croatian Kuna"
        case .HTG:
            return "Haitian Gourde"
        case .HUF:
            return "Hungarian Forint"
        case .IDR:
            return "Indonesian Rupiah"
        case .ILS:
            return "Israeli New Sheqel"
        case .INR:
            return "Indian Rupee"
        case .IQD:
            return "Iraqi Dinar"
        case .IRR:
            return "Iranian Rial"
        case .ISK:
            return "Icelandic Kr\u{00f3}na"
        case .JEP:
            return "Jersey Pound"
        case .JMD:
            return "Jamaican Dollar"
        case .JOD:
            return "Jordanian Dinar"
        case .JPY:
            return "Japanese Yen"
        case .KES:
            return "Kenyan Shilling"
        case .KGS:
            return "Kyrgystani Som"
        case .KHR:
            return "Cambodian Riel"
        case .KMF:
            return "Comorian Franc"
        case .KRW:
            return "South Korean Won"
        case .KWD:
            return "Kuwaiti Dinar"
        case .KYD:
            return "Cayman Islands Dollar"
        case .KZT:
            return "Kazakhstani Tenge"
        case .LAK:
            return "Laotian Kip"
        case .LBP:
            return "Lebanese Pound"
        case .LKR:
            return "Sri Lankan Rupee"
        case .LRD:
            return "Liberian Dollar"
        case .LSL:
            return "Lesotho Loti"
        case .LTL:
            return "Lithuanian Litas"
        case .LVL:
            return "Latvian Lats"
        case .LYD:
            return "Libyan Dinar"
        case .MAD:
            return "Moroccan Dirham"
        case .MDL:
            return "Moldovan Leu"
        case .MGA:
            return "Malagasy Ariary"
        case .MKD:
            return "Macedonian Denar"
        case .MMK:
            return "Myanma Kyat"
        case .MNT:
            return "Mongolian Tugrik"
        case .MOP:
            return "Macanese Pataca"
        case .MRO:
            return "Mauritanian Ouguiya"
        case .MUR:
            return "Mauritian Rupee"
        case .MVR:
            return "Maldivian Rufiyaa"
        case .MWK:
            return "Malawian Kwacha"
        case .MXN:
            return "Mexican Peso".localized() // ?
        case .MYR:
            return "Malaysian Ringgit"
        case .MZN:
            return "Mozambican Metical"
        case .NAD:
            return "Namibian Dollar"
        case .NGN:
            return "Nigerian Naira"
        case .NIO:
            return "Nicaraguan C\u{00f3}rdoba"
        case .NOK:
            return "Norwegian Krone"
        case .NPR:
            return "Nepalese Rupee"
        case .NZD:
            return "New Zealand Dollar"
        case .OMR:
            return "Omani Rial"
        case .PAB:
            return "Panamanian Balboa"
        case .PEN:
            return "Peruvian Nuevo Sol"
        case .PGK:
            return "Papua New Guinean Kina"
        case .PHP:
            return "Philippine Peso"
        case .PKR:
            return "Pakistani Rupee"
        case .PLN:
            return "Polish Zloty"
        case .PYG:
            return "Paraguayan Guarani"
        case .QAR:
            return "Qatari Rial"
        case .RON:
            return "Romanian Leu"
        case .RSD:
            return "Serbian Dinar"
        case .RUB:
            return "Russian Ruble"
        case .RWF:
            return "Rwandan Franc"
        case .SAR:
            return "Saudi Riyal"
        case .SBD:
            return "Solomon Islands Dollar"
        case .SCR:
            return "Seychellois Rupee"
        case .SDG:
            return "Sudanese Pound"
        case .SEK:
            return "Swedish Krona"
        case .SGD:
            return "Singapore Dollar"
        case .SHP:
            return "Saint Helena Pound"
        case .SLL:
            return "Sierra Leonean Leone"
        case .SOS:
            return "Somali Shilling"
        case .SRD:
            return "Surinamese Dollar"
        case .STD:
            return "S\u{00e3}o Tom\u{00e9} and Pr\u{00ed}ncipe Dobra"
        case .SVC:
            return "Salvadoran Col\u{00f3}n"
        case .SYP:
            return "Syrian Pound"
        case .SZL:
            return "Swazi Lilangeni"
        case .THB:
            return "Thai Baht"
        case .TJS:
            return "Tajikistani Somoni"
        case .TMT:
            return "Turkmenistani Manat"
        case .TND:
            return "Tunisian Dinar"
        case .TOP:
            return "Tongan Pa\u{02bb}anga"
        case .TRY:
            return "Turkish Lira"
        case .TTD:
            return "Trinidad and Tobago Dollar"
        case .TWD:
            return "New Taiwan Dollar"
        case .TZS:
            return "Tanzanian Shilling"
        case .UAH:
            return "Ukrainian Hryvnia"
        case .UGX:
            return "Ugandan Shilling"
        case .USD:
            return "United States Dollar"
        case .UYU:
            return "Uruguayan Peso"
        case .UZS:
            return "Uzbekistan Som"
        case .VEF:
            return "Venezuelan Bol\u{00ed}var Fuerte"
        case .VND:
            return "Vietnamese Dong"
        case .VUV:
            return "Vanuatu Vatu"
        case .WST:
            return "Samoan Tala"
        case .ZAR:
            return "South African Rand"
        case .ZMW:
            return "Zambian Kwacha"
        case .ZWL:
            return "Zimbabwean Dollar"
        }
    }
    
    var symbol: String {
        return String(describing: self)
    }
}



enum Continent {
    case asia
    case australia
    case africa
    case europe
    case northAmerica
    case southAmerica
    case cryptocurrency
    
    var name: String {
        switch self {
        case .asia:
            return "Asia"
        case .australia:
            return "Oceana"
        case .africa:
            return "Africa"
        case .europe:
            return "Europe"
        case .northAmerica:
            return "North America"
        case .southAmerica:
            return "South America"
        case .cryptocurrency:
            return "Cryptocurrency"
        }
    }
}
