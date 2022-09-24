//
//  CurrencySelectionView.swift
//  Currency Now
//
//  Created by Matthew Turk on 7/26/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation
import SwiftUI

struct CurrencySelectionView: View {
    
    @Binding var showCurrencySelection: Bool
    @ObservedObject var exchange: Exchange
    @Binding var selection: String
    private let groupedCurrencies = Dictionary(grouping: Currency.allCases, by: { $0.home })
    @Binding var didChange: Bool
    
    // private let currencies = Currency.currencySections
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                List {
                    ForEach(Array(groupedCurrencies.keys), id: \.self) { key in
                        Section {
                            ForEach(groupedCurrencies[key] ?? [], id: \.self) { currency in
                                Button {
                                    async {print(currency.name)
                                    if self.selection == "primary" {
                                        print("update base currency")
                                        self.exchange.base = currency
                                    } else {
                                        print("update destination currency")
                                        self.exchange.destination = currency
                                    }
                                    do {
                                        exchange.clear()
                                        let conversion = try await exchange.convert(12.3)
                                        
                                        if let info = conversion["info"] as? [String: Any], let results = info["rate"] as? Double {
                                            print(results)
                                            exchange.rate = results
                                            didChange = true
                                        }
                                    } catch let error {
                                        print(error.localizedDescription)
                                    }}
                                } label: {
                                    CurrencySelectionRow(currency: currency)
                                }
                            }.buttonStyle(PlainButtonStyle())
                        } header: {
                            Text(verbatim: String(describing: key))
                        }
                    }
                }
                .onAppear {
                    print(groupedCurrencies)
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
            }
            .navigationBarTitle(Text("Select Currency"))
        }
    }
}
