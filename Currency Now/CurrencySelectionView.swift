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
    
    // private let currencies = Currency.currencySections
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                List {
                    /*ForEach(currencies) { section in
                        Section(header:
                            Text(section.title)
                                .padding(.top, section.title == "Africa" ? Constants.medium : 0)
                        ) {
                            ForEach(section.currencies) { currency in
                                Button(action: {
                                    if self.selection == "primary" {
                                        self.exchange.primary = currency
                                    } else {
                                        self.exchange.secondary = currency
                                    }
                                    self.showCurrencySelection.toggle()
                                }) {
                                    CurrencySelectionRow(currency: currency)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }*/
                    
                }
                .onAppear {
                    print(Dictionary(grouping: Currency.allCases, by: { $0.home }))
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
            }
            .navigationBarTitle(Text("Select Currency"))
        }
    }
}
/*
struct CurrencySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelectionView(
            showCurrencySelection: .constant(true),
            exchange: .constant(
                Exchange(
                    primary: Currency(name: "", fullName: "", continent: .Australia),
                    secondary: Currency(name: "", fullName: "", continent: .Australia))),
            selection: .constant("primary"))
    }
}
*/
