//
//  DetailView.swift
//  Crypto
//
//  Created by John Xavier  on 06/04/2024.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var coin:CoinModel?
    init(coin: Binding<CoinModel?>) {
        self._coin = coin
        print("Initialise detailview for \(String(describing: coin.wrappedValue?.name))")
    }
    var body: some View {
        Text(coin?.name ?? "")
    }
}

#Preview {
    DetailView(coin: .constant(DeveloperPreview.instance.coin))
}
