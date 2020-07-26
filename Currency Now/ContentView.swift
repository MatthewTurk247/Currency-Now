//
//  ContentView.swift
//  Currency Now
//
//  Created by Matthew Turk on 2/1/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    @State var baseAmount: String = "1.0"
    @State var isEditing: Bool = false
    @State var lastUpdated: String = ""
    @State var showingDetail = false
    @State private var triggerAnimation = false
    @State private var showNewCoinPicker = false
    @State private var editButton = "Constants.editText.localizedString()"
    @State private var showCoinComparison: Bool = false
    @ObservedObject var rates = Rates()
    @EnvironmentObject var mainVM: MainViewModel
    @Environment(\.editMode) var editMode
 
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                    List {
                        
                            ForEach(mainVM.userChosenCoins ?? [], id: \.self) { item in
                                NavigationLink(destination: Calculator(showModel: self.$showCoinComparison, toggle: self.$triggerAnimation, coinIhave: item[arrayIndex.left], coinIwant: item[arrayIndex.right]).animation(.spring()).transition(.move(edge: .top)).environment(\.layoutDirection, .leftToRight)) {
                                    
                                    Button(action: {
                                        self.mainVM.coinIHave.coinCode = item[arrayIndex.left]
                                        self.mainVM.coinIWant.coinCode = item[arrayIndex.right]
                                        self.editMode?.wrappedValue = EditMode.inactive
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                            self.triggerAnimation = true
                                        }
                                        self.showCoinComparison = true
                                    }) {
                                        HStack  {
                                            VStack (alignment: .leading) {
                                                HStack {
                                                    Coin(coinCode: item[arrayIndex.left]).coinImage
                                                        .resizable()
                                                        .frame(width: 25, height: 25)
                                                        .cornerRadius(90)
                                                    Text(Coin(coinCode: item[arrayIndex.left]).coinCode)
                                                    
                                                    self.rates.returnRateChange(coinCode: item[arrayIndex.left])
                                                    Spacer(minLength: 1)
                                                }
                                                Text(Coin(coinCode: item[arrayIndex.left]).coinName)
                                                    .foregroundColor(.gray)
                                            }.padding(.leading, 10)
                                            
                                            Image(systemName: "arrow.right.arrow.left").resizable()
                                                .frame(width: 20, height: 20)
                                            
                                            VStack (alignment: .trailing) {
                                                HStack {
                                                    Spacer(minLength: 1)
                                                    self.rates.returnRateChange(coinCode: item[1])
                                                    Text(Coin(coinCode: item[arrayIndex.right]).coinCode)
                                                        .foregroundColor(.red)
                                                    Coin(coinCode: item[arrayIndex.right]).coinImage
                                                        .resizable()
                                                        .frame(width: 25, height: 25)
                                                        .cornerRadius(90)
                                                }
                                                Text(Coin(coinCode: item[arrayIndex.right]).coinName)
                                                    .foregroundColor(.gray)
                                            }.padding(.trailing, 10)
                                                .frame(height: 80)
                                        }
                                    }
                        }
                            }.onDelete(perform: mainVM.delete(at:))
                                .onMove(perform: mainVM.move)
                        
                    }
                }
                .animation(Animation.spring())
                .transition(.move(edge: .bottom))
                .onAppear() {
                    DispatchQueue.global().async {
                        self.mainVM.firstAppLaunch()
                        if self.mainVM.coinList == [] {
                            self.mainVM.callService()
                            self.rates.callService()
                        }
                    }
                }.navigationBarTitle("Currency Now").navigationBarItems(leading: Button(action: {
                                        self.mainVM.coinIHave = Coin(coinCode: Locale.current.currencyCode ?? "")
                self.mainVM.coinIWant = Coin(coinCode: "")
                self.showingDetail = true
                self.editMode?.wrappedValue = EditMode.inactive
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title)}, trailing: EditButton())
        }.sheet(isPresented: $showingDetail, content: {
            NewCoinPicker(showModel: self.$showingDetail).environmentObject(self.mainVM)
        })
        }
    }

struct DismissingKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                let keyWindow = UIApplication.shared.connectedScenes
                        .filter({$0.activationState == .foregroundActive})
                        .map({$0 as? UIWindowScene})
                        .compactMap({$0})
                        .first?.windows
                        .filter({$0.isKeyWindow}).first
                keyWindow?.endEditing(true)
        }
    }
}

private struct arrayIndex  {
    static let left = 0
    static let right = 1
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
