//
//  HomeView.swift
//  Crypto
//
//  Created by John Xavier  on 28/01/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var showPortfolio:Bool = false// animate right
    @State private var showPortfolioView: Bool = false // new sheet
    
    @EnvironmentObject private var vm: HomeViewModel
    var body: some View {
        ZStack{
            //background layer
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView, content: {
                    PortfolioView()
                        .environmentObject(vm)
                })
            //content layer
            VStack{
               homeHeader
                HomeStatsView(showPortfolio: $showPortfolio)
                SearchBarView(searchText: $vm.searchText)
               columnTitles
                if !showPortfolio{
                   allcoinsList
                    .transition(.move(edge: .leading))
                }
                if showPortfolio{
                    portfolioCoinList
                        .transition(.move(edge: .trailing))
                }
                
                
                Spacer(minLength: 0)
            }
            
        }
    }
}

#Preview {
    NavigationStack{
        HomeView()
            .toolbar(.hidden)
    }
    .environmentObject(DeveloperPreview.instance.homeVm)
}
extension HomeView{
    private var homeHeader: some View{
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: 0)
                .onTapGesture {
                    if showPortfolio{
                        showPortfolioView.toggle()
                    }
                }
                .background(
                CircleButtonAnimationView(animate: $showPortfolio))
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    private var allcoinsList : some View{
        List{
            ForEach(vm.allCoins) { coin in
                CoinRowView(showHoldingsColumn:false , coin: coin)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    private var portfolioCoinList : some View{
        List{
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(showHoldingsColumn:true , coin: coin)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View{
        HStack{
            Text("Coins")
            Spacer()
            if showPortfolio{
                Text("Holdings")
            }
            Text("Price")
                .frame(width: (UIScreen.main.bounds.width) / 3.5, alignment: .trailing)
            Button(action: {
                withAnimation(.linear(duration: 2.0)) {
                    vm.reloadData()
                }
            }, label: {
                Image(systemName: "goforward")
            })
            .rotationEffect(Angle(degrees: (vm.isLoading ? 360 : 0)),anchor:.center)

        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryText)
        .padding(.horizontal)
    }
    
}
