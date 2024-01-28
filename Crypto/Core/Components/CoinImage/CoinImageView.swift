//
//  CoinImageView.swift
//  Crypto
//
//  Created by John Xavier  on 14/02/2024.
//

import SwiftUI

struct CoinImageView: View {

    @StateObject var vm : CoinImageViewModel
    
    init(coin:CoinModel){
      _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack{
            if let image = vm.image{
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isloading{
                ProgressView()
            } else{
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.secondaryText)
            }
        }
    }
}

#Preview {
    CoinImageView(coin: DeveloperPreview.instance.coin)
        .padding()
        .previewLayout(.sizeThatFits)
}
