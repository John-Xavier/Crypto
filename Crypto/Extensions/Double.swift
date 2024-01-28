//
//  Double.swift
//  Crypto
//
//  Created by John Xavier  on 06/02/2024.
//

import Foundation
extension Double {
    
    ///Converts a double into  a currency with 2 decimal places
    ///```
    /// Convert 1234.56 to $1,234.56

    ///```
    private var currencyFormatter2: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .currency
        //formatter.locale = .current
       // formatter.currencyCode = "gbp"
       // formatter.currencySymbol = "£"
        return formatter
    }
    
    ///Converts a double as a String with 2 decimal places
    ///```
    /// Convert 1234.56 to "$1,234.56"
    ///```
    func asCurrencyWith2Decimals() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    ///Converts a double into  a currency with 2 to 6 decimal places
    ///```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    ///```
    private var currencyFormatter6: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        formatter.numberStyle = .currency
        //formatter.locale = .current
       // formatter.currencyCode = "gbp"
       // formatter.currencySymbol = "£"
        return formatter
    }
    
    ///Converts a double as a String with 2-6 decimal places
    ///```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.3456"
    /// Convert 0.123456 to "$0.123456"
    ///```
    func asCurrencyWith6Decimals() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    ///Converts a double as a String
    ///```
    /// Convert 12.3456 to "12.34"
    ///```
    func asNumberString() -> String{
        return String(format:"%2f",self)
    }
    
    ///Converts a double as a String with % symbol
    ///```
    /// Convert 12.34 to "12.34%"
    ///```
    func asPercentString() -> String{
        return asNumberString() + "%"
    }
}
