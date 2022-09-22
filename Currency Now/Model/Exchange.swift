//
//  Exchange.swift
//  Currency Now
//
//  Created by Matthew Turk on 7/26/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation

class Exchange: ObservableObject {
    
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
    
    func latest() async throws -> [String: Any] {
        var components = URLComponents(url: self.endpoint.appendingPathComponent("latest"), resolvingAgainstBaseURL: false)!
        components.queryItems = [
            URLQueryItem(name: "symbols", value: Currency.allCases.map { $0.symbol }.joined(separator: ",")),
            URLQueryItem(name: "base", value: self.base.symbol)
        ]
        
        guard let url = components.url else { return [:] }
        
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        guard let apiKey = ExchangeRatesService.apiKey else { return [:] }
        request.addValue(apiKey, forHTTPHeaderField: "apikey")
        
        return try await withCheckedThrowingContinuation { continuation in
            var currentRates: [String: Any] = [:]
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else { return }
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    if let parsed = parsed as? [String: Any] {
                        // print(parsed["base"] as? String)
                        // print(parsed["timestamp"] as? Int)
                        // print(parsed["date"] as? String)
                        if let rates = parsed["rates"] as? [String: Any] {
                            currentRates = rates
                            print(currentRates)
                        }
                    }
                    
                } catch let error {
                    continuation.resume(throwing: error)
                }
                //                exchange.primaryRate = Rate.managedRateAsRate(rate: pmr, currencyRates: pmrRates)
            }
            
            task.resume()
            continuation.resume(returning: currentRates)
        }
    }
    
    func date(_ date: Date) {
        
    }
    
    func timeSeries(base: Currency, symbols: [Currency] = []) {
        
    }
}

struct Latest: Codable {
    // var rates: [String : Double]
    var base: String
    var success: Bool
    let date: Date
    let timestamp: Int
    
    enum CodingKeys: String, CodingKey {
        // case rates
        case base
        case success
        case date
        case timestamp
    }
}

struct Post: Codable {
    let id: Int
    let slug: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case slug
    }
}

extension Exchange {
    
    // MARK: Transformations
    private func conversionRate() -> Decimal {
        return 0
    }
    
    func clear() {
        
    }
    
}
