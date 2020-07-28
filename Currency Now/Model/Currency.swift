//
//  Currency.swift
//  Currency Now
//
//  Created by Matthew Turk on 7/26/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation

import Foundation

struct Currency: Identifiable {

    enum Continent {
        case Asia
        case Australia
        case Africa
        case Europe
        case NorthAmerica
        case SouthAmerica
    }

    struct CurrencySection: Identifiable {
        var id: String {
            title
        }
        var title: String
        var currencies: [Currency]
    }

    var id: String {
        name
    }
    var name: String
    var fullName: String
    var continent: Continent

    static let currencySections: [CurrencySection] = [
        CurrencySection(
                title: "North America".localized(),
                currencies: currencies.filter({ currency in
                    currency.continent == .NorthAmerica
                })),
        CurrencySection(
                title: "Europe".localized(),
                currencies: currencies.filter({ currency in
                    currency.continent == .Europe
                })),
        CurrencySection(
                title: "Asia".localized(),
                currencies: currencies.filter({ currency in
                    currency.continent == .Asia
                })),
        CurrencySection(
                title: "Australia".localized(),
                currencies: currencies.filter({ currency in
                    currency.continent == .Australia
                })),
        CurrencySection(
                title: "South America".localized(),
                currencies: currencies.filter({ currency in
                    currency.continent == .SouthAmerica
                })),
        CurrencySection(
                title: "Africa".localized(),
                currencies: currencies.filter({ currency in
                    currency.continent == .Africa
                })),
    ]

    // MARK: Full currency array
    static let currencies: Array<Currency> = [
        Currency(name: "USD", fullName: "United States Dollar".localized(), continent: .NorthAmerica),
        Currency(name: "CAD", fullName: "Canadian Dollar".localized(), continent: .NorthAmerica),
        Currency(name: "MXN", fullName: "Mexican Peso".localized(), continent: .NorthAmerica),
        Currency(name: "BGN", fullName: "Bulgarian Lev".localized(), continent: .Europe),
        Currency(name: "CHF", fullName: "Swiss Franc".localized(), continent: .Europe),
        Currency(name: "CZK", fullName: "Czech Koruna".localized(), continent: .Europe),
        Currency(name: "DKK", fullName: "Danish Krone".localized(), continent: .Europe),
        Currency(name: "EUR", fullName: "Euro".localized(), continent: .Europe),
        Currency(name: "GBP", fullName: "British Pound Sterling".localized(), continent: .Europe),
        Currency(name: "HRK", fullName: "Croatian Kuna".localized(), continent: .Europe),
        Currency(name: "HUF", fullName: "Hungarian Forint".localized(), continent: .Europe),
        Currency(name: "ISK", fullName: "Icelandic Króna".localized(), continent: .Europe),
        Currency(name: "NOK", fullName: "Norwegian Krone".localized(), continent: .Europe),
        Currency(name: "PLN", fullName: "Polish Złoty".localized(), continent: .Europe),
        Currency(name: "RON", fullName: "Romanian Leu".localized(), continent: .Europe),
        Currency(name: "RUB", fullName: "Russian Ruble".localized(), continent: .Europe),
        Currency(name: "SEK", fullName: "Swedish Krona".localized(), continent: .Europe),
        Currency(name: "CNY", fullName: "Chinese Yuan".localized(), continent: .Asia),
        Currency(name: "HKD", fullName: "Hong Kong Dollar".localized(), continent: .Asia),
        Currency(name: "IDR", fullName: "Indonesian Rupiah".localized(), continent: .Asia),
        Currency(name: "ILS", fullName: "Israeli New Shekel".localized(), continent: .Asia),
        Currency(name: "INR", fullName: "Indian Rupee".localized(), continent: .Asia),
        Currency(name: "JPY", fullName: "Japanese Yen".localized(), continent: .Asia),
        Currency(name: "KRW", fullName: "South Korean Won".localized(), continent: .Asia),
        Currency(name: "MYR", fullName: "Malaysian Ringgit".localized(), continent: .Asia),
        Currency(name: "PHP", fullName: "Philippine Peso".localized(), continent: .Asia),
        Currency(name: "SGD", fullName: "Singapore Dollar".localized(), continent: .Asia),
        Currency(name: "THB", fullName: "Thai Baht".localized(), continent: .Asia),
        Currency(name: "TRY", fullName: "Turkish Lira".localized(), continent: .Asia),
        Currency(name: "AUD", fullName: "Australian Dollar".localized(), continent: .Australia),
        Currency(name: "NZD", fullName: "New Zealand Dollar".localized(), continent: .Australia),
        Currency(name: "BRL", fullName: "Brazilian Real".localized(), continent: .SouthAmerica),
        Currency(name: "ZAR", fullName: "South African Rand".localized(), continent: .Africa)
    ]

}
