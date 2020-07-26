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
    @State private var selectKeeper = 0
    let newsAPIKey = "127f06e85b3a49bf91ac8e3ce8ace028"
    @State var articles = [Article]()
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
//            LineChart(data: $exchangeRates, interval: $selectKeeper)
//            LineView(data: exchangeRates, title: String(exchangeRates.last ?? 0), legend: "Down _% today", style: Styles.lineChartStyleOne, valueSpecifier: "%.12f")
//            LineView(data: exchangeRates, title: "Chart", valueSpecifier: "%.12f").padding()
//            Chart(data: exchangeRates)
//            .chartStyle(
//                LineChartStyle(.line, lineColor: .blue, lineWidth: 5)
//            )

            Picker(selection: $selectKeeper, label: Text("What is your favorite color?")) {
                Text("1D").tag(0)
                Text("1W").tag(1)
                Text("1M").tag(2)
                Text("1Y").tag(3)
            }.pickerStyle(SegmentedPickerStyle())
            
            Spacer(minLength: 20)
            Text("Stats").font(.title).bold()
            HStack {
                List {
                    Text("High")
                    Text("Low")
                }.disabled(true)
                List {
                    Text("Average")
                    Text("Volatility")
                }.disabled(true)
            }
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(articles, id: \.self) { article in
                        Text("Item")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: 200, height: 100)
                            .background(Color.blue)
                    }
                }
            }
            }.onAppear(perform: loadData).navigationBarTitle(Text("\(fromCurrency.code) per \(toCurrency.code)")).padding()
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
        
        let newsURL = URL(string: "https://newsapi.org/v2/everything?q=\(toCurrency.name)&sortBy=popularity&apiKey=\(newsAPIKey)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!

        let newsCall = URLSession.shared.dataTask(with: newsURL, completionHandler: { (data, response, error) in
          if let data = data {
          if let decoded: NetworkResponse = self.decodeData(NetworkResponse.self, data) {
            print(decoded.articles)
            self.articles = decoded.articles ?? []
            }
            }
        })

        newsCall.resume()
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
