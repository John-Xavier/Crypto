//
//  SettingsView.swift
//  Crypto
//
//  Created by John Xavier  on 07/07/2024.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let youTubeURL = URL(string: "https://www.youtube.com/johnxavierk")
    let cofeeURL = URL(string: "https://www.buymeacofee.com")
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://www.github.com")
    
    var body: some View {
        NavigationView(content: {
            List {
                swiftdulThinkingSection
                coinGeckoSection
                developerSection
                applicationSection
            }
            .listStyle(.grouped)
            .navigationTitle("Settings")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    XmarkButton()
                }
            }
        })
    }
}

#Preview {
    SettingsView()
}
extension SettingsView{
    private var swiftdulThinkingSection : some View{
        Section {
            VStack(alignment: .leading, content: {
               Image("logo")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Thanks to @SwiftfulThinking for helping with the app creation. It uses MVVM architecture, Combine, and CoreData!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
                
            })
            .padding(.vertical)
            
        } header: {
            Text("Swiftful Thinking")
        }
    }
    private var coinGeckoSection : some View{
        Section {
            VStack(alignment: .leading, content: {
               Image("coingecko")
                    .resizable()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from a API from CoinGecko! prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
                
            })
            .padding(.vertical)
            Link("Visit CoinGecko", destination: coingeckoURL)
            
        } header: {
            Text("CoinGecko")
        }
    }
    private var developerSection : some View{
        Section {
            VStack(alignment: .leading, content: {
               Image("logo")
                    .resizable()
                    .frame(width:100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was developed by John Xavier. It uses Swift UI and it is written 100% in swift. The project benefites from multi-threading, publishers & subscribers and data persistence.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
                
            })
            .padding(.vertical)
            
        } header: {
            Text("Developer")
        }
    }
    private var applicationSection : some View{
        Section {
         Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)

            
        } header: {
            Text("Developer")
        }
    }

}
