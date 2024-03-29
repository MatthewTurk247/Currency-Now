//
//  ExchangeView.swift
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
    @State private var isPrimarySelection: Bool = false
    @State private var showCurrencySelection: Bool = false
    @State private var didChange: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(spacing: 0) {
                
                // Primary
                HStack {
                    VStack {
                        
                        Spacer()
                        ExchangeDisplayDetail(value: didChange ? "Loading..." : input > 0 ? String(describing: input) : input.withoutTrailingZeros(), name: exchange.base.name, code: exchange.base.symbol, top: true, selection: $isPrimarySelection, showCurrencySelection: $showCurrencySelection)
                        
                        
                    }
                    Spacer()
                }
                .background(Color.backgroundAccent)
                HStack {
                    Spacer()
                    CurrencySwap(showCurrencySelection: $showCurrencySelection, selection: $isPrimarySelection, exchange: exchange)
                        .sheet(isPresented: self.$showCurrencySelection) {
                            CurrencySelectionView(
                                showCurrencySelection: self.$showCurrencySelection,
                                exchange: exchange, selection: $isPrimarySelection, isLoading: $didChange)
                        }
                        .frame(height: 0)

                    // Secondary
                    HStack {
                        VStack {
                            // String(describing: baseValue*rate)
                            ExchangeDisplayDetail(value: didChange ? "Loading..." : input > 0 ? String(format: "%.2f", input*exchange.rate) : (input*exchange.rate).withoutTrailingZeros(), name: exchange.destination.name, code: exchange.destination.symbol, top: false, selection: self.$isPrimarySelection, showCurrencySelection: self.$showCurrencySelection)
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

extension Double {
    func withoutTrailingZeros() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16
        return String(formatter.string(from: number) ?? "")
    }
}
