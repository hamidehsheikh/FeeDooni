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
    let MainTopTab = TopTabViewModel()
    
    let SampleData = UnitData(
        id: 566474,
        sell: "20344",
        buy: "23454",
        name: "BTC",
        type: TypeEnum(rawValue: "gold")!
    )

}
