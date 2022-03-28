//
//  CurrencyDataService.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/19/22.
//

import Foundation
import Combine

class CurrencyDataService {
    
    @Published var allCurrencies: [UnitData] = []
    var currencySubscription: AnyCancellable?
        
    init() {
        getCurrencies()
    }
    
    func getCurrencies() {
        guard let url = URL(string: "https://ezbuild.website/api.php?goosnali=cj6b3zF2GPXxVs2DXAab")
            else { return }
        currencySubscription = NetworkingManager.download(url: url)
            .decode(type: [UnitData].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returenedCurrencies) in
                self?.allCurrencies = returenedCurrencies
                self?.currencySubscription?.cancel()
            })
    }
    
}
