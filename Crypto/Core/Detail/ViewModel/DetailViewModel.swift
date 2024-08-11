//
//  DetailViewModel.swift
//  Crypto
//
//  Created by John Xavier  on 26/04/2024.
//

import Foundation
import Combine


class DetailViewModel:ObservableObject{
    
    @Published var overvewStatstics : [StatisticModel] = []
    @Published var additionalStatstics : [StatisticModel] = []
    @Published var coinDescription : String? = nil
    @Published var websiteURL : String? = nil
    @Published var redditURL : String? = nil
    
    @Published var coin:CoinModel
    private let coinDetailService : CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin:CoinModel){
        self.coin = coin
        self.coinDetailService = CoinDetailDataService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers(){
        coinDetailService.$coinDetail
            .combineLatest($coin)
            .map(mapDataToStatistics)
            .sink { [weak self] (returnedArrays) in
                self?.overvewStatstics = returnedArrays.overview
                self?.additionalStatstics = returnedArrays.additional
            }
            .store(in: &cancellables)
        
        coinDetailService.$coinDetail
            .sink { [weak self] (returnedCoinDetails) in
                self?.coinDescription = returnedCoinDetails?.readableDescription
                self?.websiteURL = returnedCoinDetails?.links?.homepage?.first
                self?.redditURL = returnedCoinDetails?.links?.subredditURL
            }
            .store(in: &cancellables)
    }
    
    private func mapDataToStatistics(coinDetailModel:CoinDetailModel?, coinModel:CoinModel) -> (overview:[StatisticModel],additional:[StatisticModel]){
        
  
    let overViewArray = createOverviewArray(coinModel: coinModel)
   let additionalArray = createAdditionalArray(coinModel: coinModel, coinDetailModel: coinDetailModel)
    
    return(overViewArray,additionalArray)
    }
    
    private func createOverviewArray(coinModel:CoinModel) -> [StatisticModel]{
        //OverView
    let price = coinModel.currentPrice.asCurrencyWith6Decimals()
    let pricePercentageChange = coinModel.priceChangePercentage24H
    let priceStat = StatisticModel(title: "Current Price", value: price, percentageChange: pricePercentageChange)
    
    let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
    let marketCapPercentChange = coinModel.marketCapChangePercentage24H
    let marketCapStat = StatisticModel(title: "Market Capitalisation", value: marketCap, percentageChange: marketCapPercentChange)
    
    let rank = "\(coinModel.rank)"
    let rankStat = StatisticModel(title: "Rank", value: rank)
    
    let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
    let volumeStat = StatisticModel(title: "Volume", value: volume)
    
     return [priceStat, marketCapStat, rankStat, volumeStat]
    }
    
    private func createAdditionalArray(coinModel:CoinModel, coinDetailModel:CoinDetailModel?)-> [StatisticModel]{
        //additional
        let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? "n/a"
        let highStat = StatisticModel(title: "24h High", value: high)
        
        let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? "n/a"
        let lowStats = StatisticModel(title: "24h Low", value: low)
        
        let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimals() ?? ""
        let pricePercentageChange2 = coinModel.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24h Price Change", value: priceChange, percentageChange: pricePercentageChange2)
        
        let marketCapChange = "$" + (coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapChangeStat = StatisticModel(title: "24H Market Cap Change", value: marketCapChange, percentageChange: marketCapPercentChange)
        
        let blockTime = coinDetailModel?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
        let blockstat = StatisticModel(title: "Block Time", value: blockTimeString)
        
        let hashing = coinDetailModel?.hashingAlgorithm ?? "n/a"
        let hashingStat = StatisticModel(title: "Hashing Algorithm", value: hashing)
        
        return [highStat, lowStats, priceChangeStat, marketCapChangeStat, blockstat, hashingStat]
    }
    
}
