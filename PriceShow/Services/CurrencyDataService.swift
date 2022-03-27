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
    
    private func getCurrencies() {
        guard let url = URL(string: "https://ezbuild.website/api.php?goosnali=cj6b3zF2GPXxVs2DXAab")
            else { return }
        
        currencySubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                        throw URLError(.badServerResponse)
                }
                print("output.data: \(output.data)")
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [UnitData].self, decoder: JSONDecoder())
            .sink { Completion in
                switch Completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returenedCurrencies) in
                self?.allCurrencies = returenedCurrencies
                //print("allcurrrrrrr: \(self?.allCurrencies)")
                self?.currencySubscription?.cancel()
            }

    }
    
}
