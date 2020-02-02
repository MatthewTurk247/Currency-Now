//
//  CurrencyItemView.swift
//  Currency Now
//
//  Created by Matthew Turk on 2/1/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation
import SwiftUI

struct CurrencyItemView: View {
    @EnvironmentObject var userData: UserData
    let currency: Currency
    let baseAmount: Double
    @Binding var isEditing: Bool
    
    var body: some View {
        let currency = self.currency
        let converstionRate = String(format: "%.4f", currency.rate / userData.baseCurrency.rate)
        let totalAmount = String(format: "%.3f", baseAmount * ( userData.baseCurrency.rate / currency.rate))

            // This is normal mode
            return HStack{
                // Flag
                Text(currency.flag).font(.largeTitle)
                // Code and name
                VStack(alignment: .leading){
                    Text(currency.code).font(.headline)
                    Text(currency.name).font(.footnote).foregroundColor(.gray)
                }
                Spacer()
                // Amount and conversion
                VStack(alignment: .trailing){
                    Text("\(totalAmount)")
                    // Would be 1 this currency = xxx base currency
                    Text("1 \(currency.code) = \(converstionRate) \(userData.baseCurrency.code)").foregroundColor(.gray)
                }
        }
    }
    
    private func delete() {
    }
    
}
