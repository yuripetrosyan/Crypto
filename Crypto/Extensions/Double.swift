//
//  Double.swift
//  Crypto
//
//  Created by Yuri Petrosyan on 29/11/2024.
//

import Foundation
import SwiftUI

extension Double {
    
    ///Convert a double into a Currency with 2-6 decumal places
    ///```
    ///Convert 1234.56 to $1,234.56
    ///Convert 12.3456 to $12.3456
    ///
    ///
    ///```
    ///
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current
       // formatter.currencyCode = "USD"
       // formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    func asPercentString() -> String {
        return String(format: "%.2f%%", self)
    }
}
