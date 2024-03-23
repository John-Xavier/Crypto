//
//  HapticManager.swift
//  Crypto
//
//  Created by John Xavier  on 23/03/2024.
//

import Foundation
import SwiftUI

class HapticManager{
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type:UINotificationFeedbackGenerator.FeedbackType){
        generator.notificationOccurred(type)
    }
}
