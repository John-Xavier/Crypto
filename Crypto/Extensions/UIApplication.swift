//
//  UIApplication.swift
//  Crypto
//
//  Created by John Xavier  on 19/02/2024.
//

import Foundation
import SwiftUI

extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
