//
//  ExchangeRatesService.swift
//  Currency Now
//
//  Created by Matthew Turk on 7/26/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation
import Combine

class ExchangeRatesService {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://api.apilayer.com/exchangerates_data")!
    static let apiKey: String? = ProcessInfo.processInfo.environment["APIKEY"]
}

enum ApiPath: String {
    case latest = "/latest"
    case convert = "/convert"
}

extension ExchangeRatesService {
    
    static func latest() {
        
    }
    
    static func convert(_ amount: Float, from base: Currency, to destination: Currency) {
        let semaphore = DispatchSemaphore(value: 0)

        guard let url = URL(string: "convert", relativeTo: baseUrl) else { return }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        components.queryItems?.append(URLQueryItem(name: "from", value: base.name))
        components.queryItems?.append(URLQueryItem(name: "to", value: destination.name))

        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        guard let apiKey = apiKey else { return }
        request.addValue(apiKey, forHTTPHeaderField: "apikey")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
    
    
}
