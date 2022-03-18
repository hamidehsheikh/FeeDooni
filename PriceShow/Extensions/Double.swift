//
//  Double.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/17/22.
//

import Foundation

extension Double {
    
    /// Converts a Double into a Currency with 2-6 decimal places
    /// ```
    /// Converts 1234.56 to $1,234.56
    /// ```
    private var currencyformatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current
//        formatter.currencyCode = "usd"
        formatter.currencySymbol = ""
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Converts a Double into a Currency as a String with 2-6 decimal places
    /// ```
    /// Converts 1234.56 to "$1,234.56"
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyformatter2.string(from: number) ?? "0.00"
    }
}

