//
//  ContentView.swift
//  Currency Now
//
//  Created by Matthew Turk on 2/1/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import SwiftUI
import Foundation

extension Color {

    static let background = Color("background")
    static let backgroundAccent = Color("backgroundAccent")
    
    static let textBody = Color("textBody")
    static let textSecondary = Color("textSecondary")
    static let textStrong = Color("textStrong")
    static let keypadKey = Color("keypadKey")
    
    static let button = Color("button")
    static let buttonSecondary = Color("buttonSecondary")
    static let primary = Color("primary")
    static let secondary = Color("secondary")
    
}

struct ContentView: View {
    @State private var showCurrencySelection: Bool = false
    @State private var showErrorAlert: Bool = false
    @State private var exchange = Exchange(base: .GBP, destination: .USD)
    @State private var selection: String = "primary"
    @State private var baseValue: Double = 0
    @State private var goingRate: Double = 1

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ExchangeView(exchange: $exchange, input: $baseValue, rate: $goingRate)
                Keypad(exchange: $exchange)
                    .background(Color.backgroundAccent)
                    .cornerRadius(Constants.large)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom)
            }
            .task {
                do {
                    let conversion = try await exchange.convert(12.3)
                    
                    if let info = conversion["info"] as? [String: Any], let results = info["rate"] as? Double {
                        print(results)
                        exchange.rate = results
                        goingRate = results
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }
            .background(Color.background)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle("Currency Now")
        }
    }
}

struct Conversion: Codable {
    let date, historical: String
    let info: Info
    let query: Query
    let result: Double
    let success: Bool
    
    enum CodingKeys: String, CodingKey {
        case date, historical
        case info
        case query
        case result
        case success
    }
    
    struct Info: Codable {
        let rate: Double
        let timestamp: Int
    }

    struct Query: Codable {
        let amount: Int
        let from, to: String
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
