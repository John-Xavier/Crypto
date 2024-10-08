//
//  PortfolioView.swift
//  Crypto
//
//  Created by John Xavier  on 22/02/2024.
//

import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject private var vm : HomeViewModel
    @State var selectedCoin: CoinModel? = nil
    @State private var quantityText : String = ""
    @State private var showCheckmark : Bool = false
    //consider for pull request
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment:.leading,spacing: 0.0){
                    SearchBarView(searchText: $vm.searchText)
                    coinLogoList
                    if selectedCoin != nil {
                       portfolioInputSection
                    }
                    
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar{
                ToolbarItem(placement:.topBarLeading){
                   XmarkButton()
                }
                ToolbarItem(placement: .topBarTrailing){
                   trailingNavBarButtons
                    
                }
            }
            .onChange(of: vm.searchText) { oldValue, newValue in
                if newValue == ""{
                    removeSelectedCoin()
                }
            }
        }
    }
}

#Preview {
    PortfolioView()
        .environmentObject(DeveloperPreview.instance.homeVm)
}

extension PortfolioView{
    private var coinLogoList : some View{
        ScrollView(.horizontal, showsIndicators: true){
            LazyHStack(spacing:10){
                ForEach(vm.searchText.isEmpty ? vm.portfolioCoins : vm.allCoins){coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture{
                            withAnimation (.easeIn){
                                updateSelectedCoin(coin: coin)
                            }
                        }
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear,lineWidth:1)
                        )
                }
            }
            .padding(.vertical,4)
            .padding(.leading)
        }
    }
    private func updateSelectedCoin(coin:CoinModel){
        selectedCoin = coin
        if let portfoliocoin = vm.portfolioCoins.first(where: {$0.id == coin.id}){
            if let amount = portfoliocoin.currentHoldings{
                quantityText = "\(amount)"
            }else{
                quantityText = ""
            }
        }
        
    }
    
    private func getCurrentValues() -> Double{
        if let quantity = Double(quantityText){
            return (quantity * (selectedCoin?.currentPrice ?? 0))
        }
        return 0
    }
    
    private var portfolioInputSection : some View{
        VStack(spacing:20){
            HStack{
                Text("Current Price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            Divider()
            HStack{
                Text("Amount in your portfolio:")
                Spacer()
                TextField("Ex: 1.4",text:$quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
                Divider()
               
            }
            HStack{
                Text("Current Value:")
                Spacer()
                Text(getCurrentValues().asCurrencyWith2Decimals())
            }
        }.animation(.none,value: 0)
            .padding()
            .font(.headline)
        
    }
    
    private var trailingNavBarButtons : some View{
        HStack(spacing:10){
            Image(systemName: "checkmark")
                .opacity(showCheckmark ? 1.0 : 0.0)
            Button {
                saveButtonPressed()
            } label: {
                Text("Save".uppercased())

            }
            .opacity((selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText)) ? 1.0 : 0.0)

        }
        .font(.headline)
    }
    
    private func saveButtonPressed(){
        guard let coin = selectedCoin,
              let amount = Double(quantityText)
        else {return}
        //save portfolio
        vm.updatePortfolio(coin: coin, amount: amount)
        //
        withAnimation(.easeIn){
            showCheckmark = true
            removeSelectedCoin()
        }
        //hide keyboard
        UIApplication.shared.endEditing()
        
        //hide check mark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            withAnimation(.easeOut) {
                showCheckmark = false
            }
        }
    }
    
    private func removeSelectedCoin(){
        selectedCoin = nil
        vm.searchText = ""
    }
}
