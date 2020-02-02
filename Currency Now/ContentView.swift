//
//  ContentView.swift
//  Currency Now
//
//  Created by Matthew Turk on 2/1/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    @State var baseAmount: String = "1.0"
    @State var isEditing: Bool = false
    @State var lastUpdated: String = ""
 
    var body: some View {
        ZStack {
           VStack(alignment: .leading) {
            Text("From:").bold().foregroundColor(.gray)
            HStack {
                // Flag
                    Text("\(userData.baseCurrency.flag)").padding(5)
                    // Code and name
                    VStack(alignment: .leading){
                        Text(userData.baseCurrency.code).foregroundColor(.white)
                        Text(userData.baseCurrency.name).foregroundColor(.white)
                    }
                    Spacer()
                    // Amount and conversion
                TextField("1.0", text: $baseAmount)
                    .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 5).foregroundColor(.clear)
                )
                }.background(Color.blue).cornerRadius(5)
            Text("To:").bold().foregroundColor(.gray)
            List {
                ForEach(userData.userCurrency) { currency in
                    CurrencyItemView(currency: currency, baseAmount: Double(self.baseAmount) ?? 1.0, isEditing:             self.$isEditing).onTapGesture {
                            self.userData.baseCurrency = currency
                    }
                    }
            }.onAppear(perform: loadCurrencies).navigationBarTitle(Text("Currencies")).navigationBarItems(trailing: Button(action: { self.isEditing.toggle() }) {
                if !self.isEditing {
                    Text("Edit")
                } else {
                    Text("Done").bold()
                }
            })
            Text("Last updated: \(self.lastUpdated)").foregroundColor(.gray).bold()
            }
            NavigationLink(destination: AddCurrencyView().environmentObject(self.userData)) {
                Text("💰")
            }.frame(width: 46, height: 46, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 23).foregroundColor(.blue))
            .foregroundColor(.white).font(.largeTitle)
        }.padding()
    }
    
    private func loadCurrencies() {
        // Check if last updated is the same date
        // if not the same pull from remote with base currency
        let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!

        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
            if let data = data {
                if let decoded: CurrencyList = self.decodeData(CurrencyList.self, data){
                    //
                    self.lastUpdated = decoded.date
                    
                    // generate currency data
                    var newCurrencies = [Currency]()
                    for key in decoded.rates.keys {
                        let newCurrency = Currency(name: supportedCurrencies[key]?[0] ?? "Unknown", rate: 1.0 / (decoded.rates[key] ?? 1.0), symbol: supportedCurrencies[key]?[1] ?? "", code: key)
                        newCurrencies.append(newCurrency)
                    }
                    
                    DispatchQueue.main.async {
                        self.userData.allCurrencies = newCurrencies
                        
                        if let base = self.userData.allCurrencies.filter({ $0.symbol == self.userData.baseCurrency.symbol }).first {
                            self.userData.baseCurrency = base
                        }
                        
                        var tempNewUserCurrency = [Currency]()
                        let userCurrencies = self.userData.userCurrency.map{ $0.code }
                        for c in self.userData.allCurrencies {
                            if userCurrencies.contains(c.code){
                                tempNewUserCurrency.append(c)
                            }
                        }
                        
                        self.userData.userCurrency = tempNewUserCurrency
                    }
                }
            }
        })
        task.resume()
    }
    
}

extension ContentView {
    private func decodeData<T>(_ decodeObject: T.Type, _ data: Data) -> T? where T: Codable {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(decodeObject.self, from: data)
        } catch let jsonErr {
            print("Error decoding Json ", jsonErr)
            return nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
