//
//  CurrencyList.swift
//  Currency-SwiftUI
//
//  Created by Alex Liu on 2019-06-21.
//  Copyright © 2018 Alex Liu <alexliubo@gmail.com> All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

struct CurrencyList: Codable{
    let base: String
    let date: String
    let rates: [String: Double]
}

struct CurrencyRates: Codable {
    let rates: [String: [String: Double]]
    let startAt, base, endAt: String

    enum CodingKeys: String, CodingKey {
        case rates
        case startAt = "start_at"
        case base
        case endAt = "end_at"
    }
}

/// All supported currencies
let supportedCurrencies: [String: [String]] = [
    "THB": ["Thai baht", "TH"],
    "PHP": ["Philippine peso", "PH"],
    "CZK": ["Czech koruna", "CZ"],
    "BRL": ["Brazilian real", "BR"],
    "CHF": ["Swiss franc", "CH"],
    "INR": ["Indian rupee", "IN"],
    "ISK": ["Icelandic króna", "IS"],
    "HRK": ["Croatian kuna", "HR"],
    "PLN": ["Polish złoty", "PL"],
    "NOK": ["Norwegian krone", "NO"],
    "USD": ["US dollar", "US"],
    "CNY": ["Chinese Renminbi", "CN"],
    "RUB": ["Russian ruble", "RU"],
    "SEK": ["Swedish krona", "SE"],
    "MYR": ["Malaysian ringgit", "MY"],
    "SGD": ["Singapore dollar", "SG"],
    "ILS": ["Israeli new shekel", "IL"],
    "TRY": ["Turkish lira", "TR"],
    "BGN": ["Bulgarian lev", "BG"],
    "NZD": ["New Zealand dollar", "NZ"],
    "HKD": ["Hong Kong dollar", "HK"],
    "RON": ["Romanian leu", "RO"],
    "EUR": ["Euro", "EU"],
    "MXN": ["Mexican peso", "MX"],
    "CAD": ["Canadian dollar", "CA"],
    "AUD": ["Australian dollar", "AU"],
    "GBP": ["Pound sterling", "GB"],
    "KRW": ["South Korean won", "KR"],
    "IDR": ["Indonesian rupiah", "ID"],
    "JPY": ["Japanese yen", "JP"],
    "DKK": ["Danish krone", "DK"],
    "ZAR": ["South African rand", "ZA"],
    "HUF": ["Hungarian forint", "HU"]
]
