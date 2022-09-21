//
//  ViewModel.swift
//  Currency Now
//
//  Created by Matthew Turk on 7/26/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ViewModel: ObservableObject {
    
    var cancellationToken: Set<AnyCancellable?> = []
    var fetchedRates: Set<Rate> = []
    @Published private(set) var error: Error? = nil
    @Published private(set) var ratesFetched: Bool = false
    
    init() {
        fetchCurrencyRates()
    }
    
}

extension ViewModel {
    
    func reFetchCurrencyRates() {
        ratesFetched = false
        error = nil
        fetchCurrencyRates()
    }
    
    private func fetchCurrencyRates() {
        
    }
    
    private func getLatestRateForBase(base: String) {
        
    }
    
}
