//
//  UnitData.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/13/22.
//

import Foundation


struct UnitData: Codable, Identifiable {
    let id: Int
    let sell, buy: String?
    let name: String
    let type: TypeEnum
    //let histories: [History]?
}

enum TypeEnum: String, Codable {
    case crypto = "crypto"
    case currency = "currency"
    case gold = "gold"
}

//struct UnitData: Identifiable, Codable {
//
//    let id, Symbol: String
//    let SellPrice, BuyPrice : Double
//
//    enum CodingKeys: String, CodingKey {
//        case id = "slug"
//        case Symbol = "title"
//        case SellPrice = "sell"
//        case BuyPrice = "buy"
//    }
//}



//struct History: Codable {
//    let date, sellMinPrice, sellMaxPrice, buyMinPrice: String?
//    let buyMaxPrice: String?
//
//    enum CodingKeys: String, CodingKey {
//        case date
//        case sellMinPrice = "sell_min_price"
//        case sellMaxPrice = "sell_max_price"
//        case buyMinPrice = "buy_min_price"
//        case buyMaxPrice = "buy_max_price"
//    }
//}



//typealias Unit = [UnitData]
