//
//  CurrencySelectionRow.swift
//  Currency Now
//
//  Created by Matthew Turk on 7/26/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation
import SwiftUI

struct CurrencySelectionRow: View {
    
    var currency: Currency
    
    var body: some View {
        HStack {
            Text("\(currency.name)")
            .font(.system(
                size: Constants.fontBody,
                weight: .bold,
                design: .rounded)
            )
            .foregroundColor(Color.textStrong)
            Spacer()
//            Text("\(currency.fullName)")
//                .font(.system(
//                    size: Constants.fontBody,
//                    weight: .medium,
//                    design: .rounded)
//                )
//                .foregroundColor(Color.textBody)
            Image(currency.symbol.lowercased())
                .resizable()
                .frame(width: 32, height: 32)
        }
        .contentShape(Rectangle())
    }
}
