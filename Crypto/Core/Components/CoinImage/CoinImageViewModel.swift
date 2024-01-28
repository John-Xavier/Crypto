//
//  CoinImageViewModel.swift
//  Crypto
//
//  Created by John Xavier  on 14/02/2024.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject{
    
    @Published var image :UIImage?
    @Published var isloading: Bool = false
    private let coin:CoinModel
    private let dataservice : CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin:CoinModel){
        self.coin = coin
        self.dataservice = CoinImageService(coin: coin)
        self.addSubscribers()
        
    }
    
    
    
    private func addSubscribers(){
        dataservice.$image
            .sink {[weak self] (_) in
                self?.isloading = false
            } receiveValue: {[weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

    }
}
