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
    private var isLoading: Bool = false
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCurrencies
            .sink { [weak self] (returenedCurrencies) in
                self?.Currencies = returenedCurrencies
                self?.isLoading = false
            }
            .store(in: &cancallables)
    }
    
    func ReloadData() {
        isLoading = true
        dataService.getCurrencies()
    }
    
}
