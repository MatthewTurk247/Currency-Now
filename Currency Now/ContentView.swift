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
 
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var model: ViewModel = ViewModel()

    @State private var showCurrencySelection: Bool = false
    @State private var showErrorAlert: Bool = false
    @State private var exchange = Exchange(base: .GBP, destination: .USD)
    @State private var selection: String = "primary"

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                // Exchange
                    ExchangeView(exchange: self.$exchange, selection: self.$selection, showCurrencySelection: self.$showCurrencySelection, updateExchanges: self.updateExchanges)
                }

                Keypad(exchange: self.$exchange)
                    .background(Color.backgroundAccent)
                    .cornerRadius(Constants.large)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom)
            }
            .onAppear {
   
                
                let url = URL(string: "https://api.apilayer.com/exchangerates_data/latest?symbols=\(exchange.base.name)&base=\(exchange.destination.name)")!
                
                var request = URLRequest(url: url,timeoutInterval: Double.infinity)
                request.httpMethod = "GET"
                guard let apiKey = ExchangeRatesService.apiKey else { return }
                request.addValue(apiKey, forHTTPHeaderField: "apikey")

                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                  guard let data = data else {
                    print(String(describing: error))
                    return
                  }
                    do {
                        let parsed = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                        print(parsed)
                        if let parsed = parsed as? [String: Any] {
                            print(parsed["base"] as? String)
                            print(parsed["timestamp"] as? Int)
                            print(parsed["date"] as? String)
                            if let rates = parsed["rates"] as? [String: Any] {
                                print(rates["USD"])
                            }
                        }
                        
                    } catch {
                        print("error")
                    }
//                exchange.primaryRate = Rate.managedRateAsRate(rate: pmr, currencyRates: pmrRates)
                }

                task.resume()
            }
            .background(Color.background)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle("Currency Now")
        }
    }
}



struct Conversion {
        
}

struct Fluctuation: Exchangeable {
    var rates: [String : Any]
    var base: Currency
    var success: Bool

    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum Symbol {
    
}
