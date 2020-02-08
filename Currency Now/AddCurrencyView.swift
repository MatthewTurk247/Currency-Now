//
//  AddCurrencyView.swift
//  Currency Now
//
//  Created by Matthew Turk on 2/1/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation
import SwiftUI

struct AddCurrencyView : View {
    @EnvironmentObject var userData: UserData
    @Binding var isPresented: Bool
    @State var selectKeeper = Set<Currency>()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userData.allCurrencies) { currency in
                    return HStack {
//                        SelectableRow(currency: currency, selectedItems: self.$selectKeeper)
                        Button(action: { self.select(currency) }) {
                            Text("\(currency.code) - \(currency.name)")
                        }
                        Spacer()
                        if self.isSelected(currency) {
                            Image(systemName: "checkmark").foregroundColor(.blue)
                        }
                    }
                }
            }.navigationBarTitle(Text("Add Currency"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.isPresented.toggle()
            }) {
                Text("Done").bold()
            })
        }
    }
    
    private func select(_ currency: Currency) {
        if userData.userCurrency.map({ $0.code }).contains(currency.code) {
            userData.userCurrency.removeAll{$0.code == currency.code}
        }
        else {
            userData.userCurrency.append(currency)
        }
    }
    
    private func isSelected(_ currency: Currency) -> Bool {
        return userData.userCurrency.map({ $0.code }).contains(currency.code)
    }
}

struct SelectableRow: View {
    var currency: Currency

    @Binding var selectedItems: Set<Currency>
    var isSelected: Bool {
        selectedItems.contains(currency)
    }

    var body: some View {
        GeometryReader { geo in
            HStack {
                Text("\(self.currency.code) - \(self.currency.name)").frame(width: geo.size.width, height: geo.size.height, alignment: .leading)
            }.background(self.isSelected ? Image(systemName: "checkmark").foregroundColor(.blue) : Image(systemName: "").foregroundColor(.blue))
            .onTapGesture {
                if self.isSelected {
                    self.selectedItems.remove(self.currency)
                } else {
                    self.selectedItems.insert(self.currency)
                }

            }
        }
    }
}
