//
//  DetailView.swift
//  Crypto
//
//  Created by John Xavier  on 06/04/2024.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject private var vm: DetailViewModel
    @State private var showFullDescription : Bool = false
    private let columns : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())]
    
    private let spacing: CGFloat = 30
        
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        
    }
    var body: some View {
        ScrollView{
            VStack{
                ChartView(coin: vm.coin)
                    .padding(.vertical)
                VStack(spacing:20){
       
                   overViewTitle
                    Divider()
                  descriptionSection
                    
                   overViewGrid
                    
                 additionalTitle
                    Divider()
                    additionalGrid
                   websiteSection
                }
                .padding()
            }
         
            
        }
        .navigationTitle(vm.coin.name)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
               navigationBarTrailingItems
            }
        }
    }
}

#Preview {
    DetailView(coin: DeveloperPreview.instance.coin)
}

extension DetailView{
    
    private var navigationBarTrailingItems : some View{
        HStack {
            Text(vm.coin.symbol.uppercased())
                .font(.headline)
            .foregroundStyle(Color.theme.secondaryText)
            CoinImageView(coin: vm.coin)
                .frame(width: 25, height: 25)
        }
    }
    
    private var overViewTitle: some View{
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundStyle(Color.theme.accent)
            .frame(maxWidth: .infinity,alignment: .leading)
    }
    private var additionalTitle: some View{
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundStyle(Color.theme.accent)
            .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    private var descriptionSection : some View{
        ZStack{
            if let coinDescription = vm.coinDescription, !coinDescription.isEmpty{
                VStack{
                    Text(coinDescription)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.callout)
                        .foregroundStyle(Color.theme.secondaryText)
                    Button {
                        withAnimation(.easeInOut) {
                            showFullDescription.toggle()
                        }
                    } label: {
                        Text(showFullDescription ? "Less" : "Read More")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.vertical, 4)
                            .foregroundStyle(.blue)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    

                }
              
                
            }
        }
    }
    
    private var overViewGrid: some View{
        LazyVGrid(columns: columns,
                  alignment: .leading,
                  spacing: spacing,
                  content: {
            ForEach(vm.overvewStatstics) { stat in
                StatistcisView(stat: stat)
                    
            }
        })
    }
    private var additionalGrid: some View{
        LazyVGrid(columns: columns,
                  alignment: .leading,
                  spacing: spacing,
                  content: {
            ForEach(vm.additionalStatstics) { stat in
                StatistcisView(stat: stat)
                    
            }
        })

    }
    
    private var websiteSection:some View{
        VStack(alignment:.leading, spacing: 20){
            if let websiteString = vm.websiteURL, let url = URL(string: websiteString){
                Link("Website", destination: url)
            }
            if let redditString = vm.redditURL,
               let url = URL(string: redditString){
                Link("Reddit", destination: url)
            }
        }
        .font(.headline)
        .frame(maxWidth: .infinity, alignment: .leading)
        .accentColor(.blue)
    }
    
}
