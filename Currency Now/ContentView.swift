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
    @State private var exchange: Exchange = Exchange(
        primary: Currency(name: "USD", fullName: "United States Dollar".localized(), continent: .NorthAmerica),
        secondary: Currency(name: "GBP", fullName: "British Pound Sterling".localized(), continent: .Europe)
    )
    @State private var selection: String = "primary"

    @FetchRequest(entity: ManagedRate.entity(), sortDescriptors: []) var managedRates: FetchedResults<ManagedRate>
    @FetchRequest(entity: ManagedCurrencyRate.entity(), sortDescriptors: []) var managedCurrencyRates: FetchedResults<ManagedCurrencyRate>

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                // Exchange
                    ExchangeDisplay(exchange: self.$exchange, selection: self.$selection, showCurrencySelection: self.$showCurrencySelection, updateExchanges: self.updateExchanges)
                }

                // Keypad
                Keypad(exchange: self.$exchange)
                    .background(Color.backgroundAccent)
                    .cornerRadius(Constants.large)
                    .padding(.leading)
                    .padding(.trailing)
                     .padding(.bottom)
//                    .frame(
//                        width: geometry.size.width,
//                        height: geometry.size.height / Constants.keypadHeightRatio
//                    )
            }
            .onAppear {
   
                
                let url = URL(string: "https://api.apilayer.com/exchangerates_data/latest?symbols=\(exchange.primary.name)&base=\(exchange.secondary.name)")!
                
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
                            
                            
                        
                            
                            
//                            exchange.primaryRate = Rate(base: base, date: date, rates: [:])
                            
                        
                            
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

extension ContentView {
    private func decodeData<T>(_ decodeObject: T.Type, _ data: Data) -> T? where T: Codable {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(decodeObject.self, from: data)
        } catch let jsonErr {
            print("Error decoding JSON.", jsonErr)
            return nil
        }
    }
    
    private func updateExchanges() {
        updatePrimaryExchangeRate()
        updateSecondaryExchangeRate()
    }

    private func updatePrimaryExchangeRate() {
//        guard let pmr = (self.managedRates.first { r in r.base == exchange.primary.name}) else {
//            return
//        }
//        let pmrRates = self.managedCurrencyRates.filter { cr in cr.rateId == pmr.id }
        
//        exchange.primaryRate = Rate.managedRateAsRate(rate: pmr, currencyRates: pmrRates)
    }

    private func updateSecondaryExchangeRate() {
        guard let smr = (self.managedRates.first { r in r.base == exchange.secondary.name}) else {
            return
        }
        let smrRates = self.managedCurrencyRates.filter { cr in cr.rateId == smr.id }
        exchange.secondaryRate = Rate.managedRateAsRate(rate: smr, currencyRates: smrRates)
    }
    
    private func clearExistingRates() {
        managedRates.forEach { rate in
            managedObjectContext.delete(rate)
        }

        do {
            try managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    private func storeRatesLocally() {
        model.fetchedRates.forEach { rate in
            let managedRate = ManagedRate(context: managedObjectContext)
            managedRate.id = rate.id
            managedRate.base = rate.base

            rate.rates.forEach { key, value in
                let managedCurrencyRate = ManagedCurrencyRate(context: managedObjectContext)
                managedCurrencyRate.ofRate = managedRate
                managedCurrencyRate.name = key
                managedCurrencyRate.value = NSDecimalNumber(decimal: value)
                managedCurrencyRate.rateId = rate.id
            }

            do {
                try self.managedObjectContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct Conversion {
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
