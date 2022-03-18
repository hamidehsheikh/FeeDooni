//
//  MainViewModel.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/13/22.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var Currencies: [UnitData] = []
    @Published var Coins: [UnitData] = []
    @Published var Cryptos: [UnitData] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.Currencies.append(DeveloperPreview.instance.SampleData)
            self.Coins.append(DeveloperPreview.instance.SampleData)
            self.Cryptos.append(DeveloperPreview.instance.SampleData)
        }
    }
}
