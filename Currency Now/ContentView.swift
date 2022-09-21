//
//  ContentView.swift
//  Currency Now
//
//  Created by Matthew Turk on 2/1/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import SwiftUI
import Foundation

extension Color {

    static let background = Color("background")
    static let backgroundAccent = Color("backgroundAccent")
    
    static let textBody = Color("textBody")
    static let textSecondary = Color("textSecondary")
    static let textStrong = Color("textStrong")
    static let keypadKey = Color("keypadKey")
    
    static let button = Color("button")
    static let buttonSecondary = Color("buttonSecondary")
    static let primary = Color("primary")
    static let secondary = Color("secondary")
    
}

struct ContentView: View {
 
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var model: ViewModel = ViewModel()

    @State private var showCurrencySelection: Bool = false
    @State private var showErrorAlert: Bool = false
    @State private var exchange = Exchange(base: .GBP, destination: .USD)
    @State private var selection: String = "primary"

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                // Exchange
                    // ExchangeView(exchange: self.$exchange, selection: self.$selection, showCurrencySelection: self.$showCurrencySelection, updateExchanges: self.updateExchanges)
                }

                Keypad(exchange: self.$exchange)
                    .background(Color.backgroundAccent)
                    .cornerRadius(Constants.large)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom)
            }
            .onAppear {
                print(Exchange(base: .GBP, destination: .USD).latest())
            }
            .background(Color.background)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle("Currency Now")
        }
    }
}



struct Conversion {
        
}

struct Fluctuation: Exchangeable {
    var rates: [String : Any]
    var base: Currency
    var success: Bool

    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum Symbol {
    
}
