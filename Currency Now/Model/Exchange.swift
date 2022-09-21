//
//  Exchange.swift
//  Currency Now
//
//  Created by Matthew Turk on 7/26/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation

struct Exchange {

    // MARK: Static constants
    private static let primaryEmpty: String = "0"
    private static let secondaryEmpty: String = "0"

    // MARK: Properties
    var base: Currency
    var destination: Currency

    var primaryRate: Rate? = nil
    var secondaryRate: Rate? = nil
    
    // init<T: Exchangeable>(base: T, destination: T)
    
    init(base: Currency, destination: Currency) {
        self.base = base
        self.destination = destination
    }
    
    static func date(_ date: Date) {
        
    }
    
    static func timeSeries(base: Currency, symbols: [Currency] = []) {
        
    }
    
}

extension Exchange {

    // MARK: Transformations
    private func conversionRate() -> Decimal {
        guard let result = (primaryRate?.rates.first { rate in rate.key == secondary.name }?.value) else {
            return 0.0
        }
        return result
    }

    mutating func clear() {
        
    }

}
