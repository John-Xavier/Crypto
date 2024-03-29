//
//  MarketDataService.swift
//  Crypto
//
//  Created by John Xavier  on 21/02/2024.
//

import Foundation
import Combine

class MarketDataService{
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscribtion : AnyCancellable?
    
    init(){
        getData()
    }
    
     func getData(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global")
        else { return }
        
        marketDataSubscribtion =  NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self](returnedData) in
                self?.marketData = returnedData.data
                self?.marketDataSubscribtion?.cancel()
            })
           

        
    }
}
