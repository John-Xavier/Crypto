//
//  CoinRowView.swift
//  Crypto
//
//  Created by John Xavier  on 03/02/2024.
//

import SwiftUI

struct CoinRowView: View {
    let showHoldingsColumn: Bool
    let coin : CoinModel
    
    var body: some View {
        HStack(spacing:0){
            leftColumn
            Spacer()
            if showHoldingsColumn{
               centerColumn
            }
           rightColumn
        }
        .font(.subheadline)
        .background{
            Color.theme.background.opacity(0.001)
        }
    }
}

#Preview {
    Group{
        CoinRowView(showHoldingsColumn: true, coin: DeveloperPreview.instance.coin)
            .previewLayout(.sizeThatFits)
        CoinRowView(showHoldingsColumn: true, coin: DeveloperPreview.instance.coin)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
   
}
extension CoinRowView{
    private var leftColumn: some View{
        HStack(spacing:0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .frame(minWidth:30)
            CoinImageView(coin: coin)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 30)
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .padding(.leading,6)
                .foregroundStyle(Color.theme.accent)
        }
    }
    private var centerColumn: some View{
        VStack{
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .foregroundStyle(Color.theme.accent)
                .bold()
            
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundStyle((coin.priceChangePercentage24H ?? 0) > 0 ? Color.theme.green :
            Color.theme.red)
        
    }
    private var rightColumn : some View{
        VStack(alignment: .trailing){
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundStyle(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "0.00%")
                .foregroundStyle(
                    (coin.priceChangePercentage24H ?? 0 >= 0) ? Color.theme.green : Color.theme.red
                )
        }
        .frame(width: (UIScreen.main.bounds.width) / 3.5, alignment: .trailing)
    }
}
