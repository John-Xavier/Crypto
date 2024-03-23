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
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]

    }
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                HomeView()
                .toolbar(.hidden)   
            }.environmentObject(vm)
        }
    }
}
