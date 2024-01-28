//
//  CryptoApp.swift
//  Crypto
//
//  Created by John Xavier  on 28/01/2024.
//

import SwiftUI

@main
struct CryptoApp: App {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                HomeView()
                .toolbar(.hidden)   
            }.environmentObject(vm)
        }
    }
}
