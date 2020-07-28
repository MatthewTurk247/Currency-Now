//
//  ExchangeRatesService.swift
//  Currency Now
//
//  Created by Matthew Turk on 7/26/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation
import Combine

enum ExchangeRatesService {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://api.exchangeratesapi.io")!
}

enum ApiPath: String {
    case latest = "/latest"
}

extension ExchangeRatesService {

    static func request(_ path: ApiPath, parameters: [String: String]? = nil) -> AnyPublisher<Rate, Error> {

        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
                else { fatalError("Couldn't create URLComponents") }

        if let parameters = parameters {
            components.queryItems = parameters.map { key, value -> URLQueryItem in
                return URLQueryItem(name: key, value: value)
            }
        }

        guard let url = components.url else {
            fatalError("Couldn't create URL")
        }

        return apiClient.run(URLRequest(url: url))
            .map(\.value)
            .eraseToAnyPublisher()

    }

}
