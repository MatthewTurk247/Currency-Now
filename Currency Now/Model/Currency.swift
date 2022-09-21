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

enum Currency {
    case AED, AFN, ALL, AMD
    case ANG, AOA, ARS, AUD
    case AWG, AZN, BAM, BBD
    case BDT, BGN, BHD, BIF
    case BMD, BND, BOB, BRL
    case BSD, BTC, BTN, BWP
    case BYN, BYR, BZD, CAD
    case CDF, CHF, CLF, CLP
    case CNY, COP, CRC, CUC
    case CUP, CVE, CZK, DJF
    case DKK, DOP, DZD, EGP
    case ERN, ETB, EUR, FJD
    case FKP, GBP, GEL, GGP
    case GHS, GIP, GMD, GNF
    case GTQ, GYD, HKD, HNL
    case HRK, HTG, HUF, IDR
    case ILS, IMP, INR, IQD
    case IRR, ISK, JEP, JMD
    case JOD, JPY, KES, KGS
    case KHR, KMF, KPW, KRW
    case KWD, KYD, KZT, LAK
    case LBP, LKR, LRD, LSL
    case LTL, LVL, LYD, MAD
    case MDL, MGA, MKD, MMK
    case MNT, MOP, MRO, MUR
    case MVR, MWK, MXN, MYR
    case MZN, NAD, NGN, NIO
    case NOK, NPR, NZD, OMR
    case PAB, PEN, PGK, PHP
    case PKR, PLN, PYG, QAR
    case RON, RSD, RUB, RWF
    case SAR, SBD, SCR, SDG
    case SEK, SGD, SHP, SLL
    case SOS, SRD, STD, SVC
    case SYP, SZL, THB, TJS
    case TMT, TND, TOP, TRY
    case TTD, TWD, TZS, UAH
    case UGX, USD, UYU, UZS
    case VEF, VND, VUV, WST
    case XAF, XAG, XAU, XCD
    case XDR, XOF, XPF, YER
    case ZAR, ZMK, ZMW, ZWL
    
    var home: Continent {
        switch self {
        case .AED:
            return .asia
        case .AFN:
            return .asia
        case .ALL:
            return .europe
        // TODO: Write out the other cases.
        default:
            return .europe
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
            return "New Belarusian Ruble"
        case .BYR:
            return "Belarusian Ruble"
        case .BZD:
            return "Belize Dollar"
        case .CAD:
            return "Canadian Dollar"
        case .CDF:
            return "Congolese Franc"
        case .CHF:
            return "Swiss Franc"
        case .CLF:
            return "Chilean Unit of Account (UF)"
        case .CLP:
            return "Chilean Peso"
        case .CNY:
            return "Chinese Yuan"
        case .COP:
            return "Colombian Peso"
        case .CRC:
            return "Costa Rican Col\u{00f3}n"
        case .CUC:
            return "Cuban Convertible Peso"
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
        case .IMP:
            return "Manx pound"
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
        case .KPW:
            return "North Korean Won"
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
        case .XAF:
            return "CFA Franc BEAC"
        case .XAG:
            return "Silver (troy ounce)"
        case .XAU:
            return "Gold (troy ounce)"
        case .XCD:
            return "East Caribbean Dollar"
        case .XDR:
            return "Special Drawing Rights"
        case .XOF:
            return "CFA Franc BCEAO"
        case .XPF:
            return "CFP Franc"
        case .YER:
            return "Yemeni Rial"
        case .ZAR:
            return "South African Rand"
        case .ZMK:
            return "Zambian Kwacha (pre-2013)"
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
}
