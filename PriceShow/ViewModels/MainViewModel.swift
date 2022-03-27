//
//  MainViewModel.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/13/22.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    
    @Published var Currencies: [UnitData] = []
    private var dataService = CurrencyDataService()
    private var cancallables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCurrencies
            .sink { [weak self] (returenedCurrencies) in
                self?.Currencies = returenedCurrencies
            }
            .store(in: &cancallables)
        print("allcurrencies: \(dataService.$allCurrencies)")
    }
}
