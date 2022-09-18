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
    
    static func convert(_ amount: Float, from base: Currency, to destination: Currency) {
        var semaphore = DispatchSemaphore (value: 0)

        guard let url = URL(string: "convert", relativeTo: baseUrl) else { return }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        components.queryItems?.append(URLQueryItem(name: "from", value: base.name))
        components.queryItems?.append(URLQueryItem(name: "to", value: destination.name))
        print(components.url)
        
        "https://api.apilayer.com/exchangerates_data/convert?to=\(destination)&from=\(base)&amount=\(amount)"
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        guard let apiKey = apiKey else { return }
        request.addValue(apiKey, forHTTPHeaderField: "apikey")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }

    static func request(_ path: ApiPath, parameters: [String: String]? = nil) -> AnyPublisher<Rate, Error> {

        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
                else { fatalError("Couldn't create URLComponents") }

        if let parameters = parameters {
            components.queryItems = parameters.map { key, value -> URLQueryItem in
                return URLQueryItem(name: key, value: value)
            }
        }
//
//        guard let url = components.url else {
//            fatalError("Couldn't create URL")
//        }
        
        let url = URL(string: "https://api.apilayer.com/exchangerates_data/latest?symbols=GBP&base=USD")!
        
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        return apiClient.run(request).map(\.value).eraseToAnyPublisher()

        return apiClient.run(URLRequest(url: url))
            .map(\.value)
            .eraseToAnyPublisher()

    }

}

//private enum Currency {
//    case USD
//}
//
//Currencyy.USD
