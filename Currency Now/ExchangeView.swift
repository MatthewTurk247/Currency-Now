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
    
    @ObservedObject var exchange: Exchange
    @Binding var input: Double
    @Binding var rate: Double
    @State private var selection = ""
    @State private var showCurrencySelection: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(spacing: 0) {
                
                // Primary
                HStack {
                    VStack {
                        
                        Spacer()
                        ExchangeDisplayDetail(value: String(describing: input), name: exchange.base.name, code: exchange.base.symbol, top: true, selection: $selection, showCurrencySelection: $showCurrencySelection)
                        
                        
                    }
                    Spacer()
                }
                .background(Color.backgroundAccent)
                HStack {
                    Spacer()
//                    CurrencySwap(showCurrencySelection: $showCurrencySelection, selection: $selection, exchange: $exchange)
//                        .sheet(isPresented: self.$showCurrencySelection) {
//                            CurrencySelectionView(
//                                showCurrencySelection: self.$showCurrencySelection,
//                                exchange: self.$exchange, selection: $selection)
//                }.frame(height: 0)

                // Secondary
                HStack {
                    VStack {
                        // String(describing: baseValue*rate)
                        ExchangeDisplayDetail(value: "\(input*exchange.rate)", name: exchange.destination.name, code: exchange.destination.symbol, top: true, selection: self.$selection, showCurrencySelection: self.$showCurrencySelection)
                        Spacer()
                        
                    }
                    Spacer()
                }
                
            }
            
        }
        
    }
    
    }
    
}

/*struct ExchangeDisplay_Previews: PreviewProvider {
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
*/
