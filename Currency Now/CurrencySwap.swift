//
//  CurrencySwap.swift
//  Currency Now
//
//  Created by Matthew Turk on 7/26/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation
import SwiftUI

struct CurrencySwap: View {
    
    @Binding var showCurrencySelection: Bool
    @Binding var selection: String
    @ObservedObject var exchange: Exchange
    @State var swapped: Bool = false
    
    var body: some View {
        
        HStack(spacing: Constants.small) {
            
            // Swap
//            Button(action: {
//                withAnimation(.easeInOut(duration: 0.2), {
//                    if !self.swapped {
//                        self.primaryOffsetX = 144
//                        self.swapped = true
//                    } else {
//                        self.primaryOffsetX = 0
//                        self.swapped = false
//                    }
//                })
//                // Update exchange rates here
//                (self.exchange.primary, self.exchange.secondary) = (self.exchange.secondary, self.exchange.primary)
//                self.updateExchanges()
//                self.exchange.clear() // until we figure out a way to update the values real-time, we'll have to make this move
//            }) {
//                Image(systemName: "arrow.2.circlepath")
//                    .font(.system(size: Constants.swapIconSize, weight: .black))
//                    .foregroundColor(Color.buttonSecondary)
//            }
//            .frame(width: Constants.buttonHeight, height: Constants.buttonHeight)
//            .background(Color.button)
//            .cornerRadius(Constants.large)
//            .overlay(
//                RoundedRectangle(cornerRadius: Constants.large)
//                    .stroke(Color.buttonSecondary, lineWidth: Constants.buttonBorderWidth)
//            )
//            .zIndex(1.0)
//            //Image(systemName: "chevron.down").foregroundColor(.clear) This would be to offset the button, but it looks worse that way
            
        }
        
    }
}
/*
struct CurrencySwap_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySwap(
            showCurrencySelection: .constant(false),
            selection: .constant("primary"),
            exchange: .constant(
                Exchange(
                    primary: Currency(name: "NOK", fullName: "", continent: .Europe),
                    secondary: Currency(name: "USD", fullName: "", continent: .NorthAmerica))), updateExchanges: {})
    }
}
*/
