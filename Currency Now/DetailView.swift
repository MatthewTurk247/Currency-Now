//
//  DetailView.swift
//  Currency Now
//
//  Created by Matthew Turk on 2/8/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftDate
import SwiftUICharts

struct DetailView: View {

    var fromCurrency: Currency
    var toCurrency: Currency
    @State var keys = [String]()
    @State var exchangeRates = [Double]()
//    var vals: [(key: String, value: Double)] {
//        zip(keys, exchangeRates).map { ($0, $1) }
//    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            LineChart(data: $exchangeRates)
//            LineView(data: exchangeRates, title: String((exchangeRates.last ?? 0)/10), legend: "Down _% today", style: Styles.lineChartStyleOne, valueSpecifier: "%.12f")
//            LineView(data: exchangeRates, title: "Chart", valueSpecifier: "%.12f").padding()
//            Chart(data: exchangeRates)
//            .chartStyle(
//                LineChartStyle(.line, lineColor: .blue, lineWidth: 5)
//            )

            Spacer(minLength: 150)
            Text("Stats").font(.title).bold()
            HStack {
                List {
                    Text("hello")
                }
                List {
                    Text("hello")
                }
            }
            }.onAppear(perform: loadData).navigationBarTitle(Text("\(fromCurrency.code) to \(toCurrency.code)")).padding()
        }
    
    private func loadData() {
        // Check if last updated is the same date
        // if not the same pull from remote with base currency
        
        let weekAgo = Date() - 1.weeks
        let url = URL(string: "https://api.exchangeratesapi.io/history?symbols=\(fromCurrency.code),\(toCurrency.code)&start_at=\(weekAgo.year)-\(weekAgo.month)-\(weekAgo.day)&end_at=\(Date().year)-\(Date().month)-\(Date().day)")!

        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
            if let data = data {
                if let decoded: CurrencyRates = self.decodeData(CurrencyRates.self, data) {
                    //
                    print(decoded.rates)
                    
                    
                    for rate in decoded.rates.sorted(by: { $0.key < $1.key }) {
                        let exchangeRate = Double(rate.value[self.fromCurrency.code]!)/Double(rate.value[self.toCurrency.code]!)
//                        print(exchangeRate)
                        self.keys.append(rate.key)
                        self.exchangeRates.append(exchangeRate)
                        print((rate.key, exchangeRate))
                    }
                }
            }
        })
        task.resume()
    }
    
}

extension DetailView {
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
