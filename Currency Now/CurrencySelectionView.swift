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
    
    // private let currencies = Currency.currencySections
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                List {
                    ForEach(Array(groupedCurrencies.keys), id: \.self) { key in
                        Section {
                            ForEach(groupedCurrencies[key] ?? [], id: \.self) { currency in
                                Button {
                                    print(currency.name)
                                    if self.selection == "primary" {
                                        // update base currency
                                    } else {
                                        // update destination currency
                                    }
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
