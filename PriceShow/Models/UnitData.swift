//
//  UnitData.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/13/22.
//

import Foundation

struct UnitData: Identifiable, Codable {
    
    let id, Symbol, Image : String
    let SellPrice, BuyPrice : Double
    
    enum CodingKeys: String, CodingKey {
        case id, SellPrice, BuyPrice
        case Symbol = "symbol_name"
        case Image = "image"
    }
}
