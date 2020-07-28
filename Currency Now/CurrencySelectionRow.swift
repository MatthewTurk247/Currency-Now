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
            Text("\(currency.fullName)")
                .font(.system(
                    size: Constants.fontBody,
                    weight: .medium,
                    design: .rounded)
                )
                .foregroundColor(Color.textBody)
            Image("\(currency.name.lowercased())")
                .resizable()
                .frame(width: 16, height: 16)
        }
        .contentShape(Rectangle())
    }
}

struct CurrencySelectionRow_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelectionRow(currency: Currency(name: "NOK", fullName: "Norwegian Krone", continent: .Europe))
            .previewLayout(.fixed(width: 400, height: 50))
    }
}
