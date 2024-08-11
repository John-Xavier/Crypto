//
//  CoinDetailDataServices.swift
//  Crypto
//
//  Created by John Xavier  on 26/04/2024.
//

import Foundation
import Combine

class CoinDetailDataService{
    
    @Published var coinDetail: CoinDetailModel? = nil
    
    var coinDetailSubscribtion : AnyCancellable?
    let coin:CoinModel
    
    init(coin:CoinModel){
        self.coin = coin
        getCoinDetail()
    }
    
     func getCoinDetail(){
         guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false")
        else { return }
        
         coinDetailSubscribtion =  NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self](returnedCoinDetails) in
                self?.coinDetail = returnedCoinDetails
                self?.coinDetailSubscribtion?.cancel()
            })
           

        
    }
}
