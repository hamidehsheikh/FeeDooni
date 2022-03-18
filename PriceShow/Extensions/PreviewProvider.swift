//
//  PreviewProvider.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/17/22.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var Dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {
        
    }
    
    let MainVM = MainViewModel()
    
    let SampleData = UnitData(
        id: "Bitcoin",
        Symbol: "BTC",
        Image: "bitcoinsign.square",
        SellPrice: 26420,
        BuyPrice: 26320)
}
