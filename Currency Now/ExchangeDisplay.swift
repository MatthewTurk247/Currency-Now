//
//  ExchangeDisplay.swift
//  Currency Now
//
//  Created by Matthew Turk on 7/26/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation
import SwiftUI

struct ExchangeView: View {
    
    @Binding var exchange: Exchange
    @Binding var selection: String
    @Binding var showCurrencySelection: Bool
    var updateExchanges: () -> Void
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(spacing: 0) {
                
                // Primary
                HStack {
                    VStack {
                        
                        Spacer()
                        ExchangeDisplayDetail(value: "\(self.exchange.primaryValueDisplay)", name: self.exchange.primary.fullName, code: self.exchange.primary.name, top: true, selection: self.$selection, showCurrencySelection: self.$showCurrencySelection)
                        
                    }
                    Spacer()
                }
                .background(Color.backgroundAccent)
                HStack {
                    Spacer()
                        // Currency swap
                        CurrencySwap(
                            showCurrencySelection: self.$showCurrencySelection,
                            selection: self.$selection,
                            exchange: self.$exchange,
                            updateExchanges: self.updateExchanges)
                            .sheet(isPresented: self.$showCurrencySelection) {
                                CurrencySelectionView(
                                    showCurrencySelection: self.$showCurrencySelection,
                                    exchange: self.$exchange,
                                    selection: self.$selection)
                                    .onDisappear {
                                        DispatchQueue.main.async {
                                            self.updateExchanges()
                                            self.exchange.clear()
                                        }
                                }
                        }.padding(.horizontal)
                }.frame(height: 0)

                // Secondary
                HStack {
                    VStack {
                        
                        ExchangeDisplayDetail(value: "\(self.exchange.secondaryValueDisplay)", name: self.exchange.secondary.fullName, code: self.exchange.secondary.name, top: false, selection: self.$selection, showCurrencySelection: self.$showCurrencySelection)
                        Spacer()
                        
                    }
                    Spacer()
                }
                
            }
            
        }
        
    }
    
}

struct ExchangeDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeDisplay(
            exchange: .constant(Exchange(
                primary: Currency(name: "NOK", fullName: "Norwegian Krone", continent: .Europe),
                secondary: Currency(name: "USD", fullName: "United States Dollar", continent: .NorthAmerica)
            )), selection: .constant(""), showCurrencySelection: .constant(false), updateExchanges: {}
        )
            .background(Color.background)
    }
}
