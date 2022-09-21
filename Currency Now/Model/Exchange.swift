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
    
    private let endpoint = URL(string: "https://api.apilayer.com/exchangerates_data")!

    // MARK: Properties
    var base: Currency
    var destination: Currency
    
    // init<T: Exchangeable>(base: T, destination: T)
    
    init(base: Currency, destination: Currency) {
        self.base = base
        self.destination = destination
    }
    
    func latest() -> [String: Any] {
        var components = URLComponents(url: self.endpoint.appendingPathComponent("latest"), resolvingAgainstBaseURL: false)!
        components.queryItems = [
            URLQueryItem(name: "symbols", value: self.destination.symbol),
            URLQueryItem(name: "base", value: self.base.symbol)
        ]

        guard let url = components.url else { return [:] }
        var currentRates: [String: Any] = [:]
        
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        guard let apiKey = ExchangeRatesService.apiKey else { return [:] }
        request.addValue(apiKey, forHTTPHeaderField: "apikey")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            do {
                let parsed = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                // print(parsed)
                if let parsed = parsed as? [String: Any] {
                    // print(parsed["base"] as? String)
                    // print(parsed["timestamp"] as? Int)
                    // print(parsed["date"] as? String)
                    if let rates = parsed["rates"] as? [String: Any] {
                        print(currentRates)
                    }
                }
                
            } catch {
                print("error")
            }
//                exchange.primaryRate = Rate.managedRateAsRate(rate: pmr, currencyRates: pmrRates)
        }

        task.resume()
        return currentRates
    }
    
    func date(_ date: Date) {
        
    }
    
    func timeSeries(base: Currency, symbols: [Currency] = []) {
        
    }
    
}

extension Exchange {

    // MARK: Transformations
    private func conversionRate() -> Decimal {
        return 0
    }

    mutating func clear() {
        
    }

}
