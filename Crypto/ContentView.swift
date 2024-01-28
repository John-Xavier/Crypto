//
//  ContentView.swift
//  Crypto
//
//  Created by John Xavier  on 28/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            VStack(spacing:40){
                Text("Red")
                    .foregroundStyle(Color.theme.red)
                Text("Green")
                    .foregroundStyle(Color.theme.green)
                Text("Secondary Color")
                    .foregroundStyle(Color.theme.secondaryText)
                Text("Accent")
                    .foregroundStyle(Color.theme.accent)
                
                
            }.font(.headline)
        }
    }
}

#Preview {
    ContentView()
}
