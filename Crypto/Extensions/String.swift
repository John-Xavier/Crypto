//
//  String.swift
//  Crypto
//
//  Created by John Xavier  on 04/07/2024.
//

import Foundation

extension String{
    var removingHTMLOccurrences: String{
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
