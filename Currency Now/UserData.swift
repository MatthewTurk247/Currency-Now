//
//  UserData.swift
//  Currency Now
//
//  Created by Matthew Turk on 2/1/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

private let defaultCurrencies: [Currency] = [Currency(name: "US dollar", rate: 1.0, symbol: "US", code: "USD"), Currency(name: "Canadian dollar", rate: 1.0, symbol: "CA", code: "CAD"), Currency(name: "Euro", rate: 1.0, symbol: "EU", code: "EUR"), Currency(name: "Pound sterling", rate: 1.0, symbol: "GB", code: "GBP"), Currency(name: "Japanese yen", rate: 1.0, symbol: "JP", code: "JPY"), Currency(name: "Australian dollar", rate: 1.0, symbol: "AU", code: "AUD"), Currency(name: "Swiss franc", rate: 1.0, symbol: "CH", code: "CHF"), Currency(name: "New Zealand dollar", rate: 1.0, symbol: "NZ", code: "NZD")]

@propertyWrapper

struct UserDefaultValue<Value: Codable> {
    let key: String
    var wrappedValue: Value
    
    var value: Value {
        get {
            let data = UserDefaults.standard.data(forKey: key)
            let value = data.flatMap { try? JSONDecoder().decode(Value.self, from: $0) }
            return value ?? wrappedValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

final class UserData: ObservableObject {
    let didChange = PassthroughSubject<UserData, Never>()
    
    @UserDefaultValue(key: "allCurrencies", wrappedValue: defaultCurrencies)
    var allCurrencies: [Currency] {
        didSet {
            didChange.send(self)
        }
    }
    
    @UserDefaultValue(key: "baseCurrency", wrappedValue: defaultCurrencies[0])
    var baseCurrency: Currency {
        didSet {
            didChange.send(self)
        }
    }
    
    @UserDefaultValue(key: "userCurrency", wrappedValue: defaultCurrencies)
    var userCurrency: [Currency] {
        didSet {
            didChange.send(self)
        }
    }
}
