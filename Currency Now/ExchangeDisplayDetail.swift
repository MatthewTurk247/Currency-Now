//
//  ExchangeDisplayDetail.swift
//  Currency Now
//
//  Created by Matthew Turk on 7/26/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation
import SwiftUI

struct ExchangeDisplayDetail: View {
    let value: String
    let name: String
    let code: String
    let top: Bool
    @Binding var selection: String
    @Binding var showCurrencySelection: Bool
    @State var primaryOffsetX: CGFloat = 0
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("\(value)")
                    .font(.system(
                        size: Constants.primaryDisplaySize,
                        weight: .semibold,
                        design: .rounded)
                    )
                    .foregroundColor(Color.textBody)
                Text("\(name)")
                    .font(.system(
                        size: Constants.primaryDisplayNameSize,
                        weight: .semibold,
                        design: .rounded)
                    )
                    .foregroundColor(Color.textBody)
            }
            .padding(Constants.large)
            Spacer()
            Button(action: {
                self.selection = self.top ? "primary" : "secondary"
                print(self.selection)
                self.showCurrencySelection.toggle()
            }) {
                HStack {
                    Image(code.lowercased()).resizable().frame(width: Constants.buttonHeight, height: Constants.buttonHeight)
                    Image(systemName: "chevron.down")
                }.padding(Constants.small).padding(.leading)
                
            }.buttonStyle(PlainButtonStyle())
            
        }.frame(maxWidth: .infinity)
    }
}

struct ExchangeDisplayDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeDisplayDetail(value: "0", name: "Norwegian Krone", code: "NOK", top: true, selection: .constant(""), showCurrencySelection: .constant(false))
    }
}
