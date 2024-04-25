//
//  DetailView.swift
//  Crypto
//
//  Created by John Xavier  on 06/04/2024.
//

import SwiftUI

struct DetailView: View {
    
     var coin:CoinModel
    init(coin: CoinModel) {
        self.coin = coin
        print("Initialise detailview for \(String(describing: coin.name))")
    }
    var body: some View {
        Text(coin.name)
    }
}

#Preview {
    DetailView(coin: DeveloperPreview.instance.coin)
}
