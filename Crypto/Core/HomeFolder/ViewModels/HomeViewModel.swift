//
//  HomeViewModel.swift
//  Crypto
//
//  Created by John Xavier  on 14/02/2024.
//

import Foundation
import Combine

class HomeViewModel : ObservableObject{
    
    @Published var allCoins : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    init(){
       addSubscribers()
    }
    
    func addSubscribers(){
        // this function updates all coins
        $searchText
            .combineLatest(dataService.$allcoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    private func filterCoins(text:String, coins:[CoinModel]) -> [CoinModel]{
        guard !text.isEmpty else { return coins }
        let lowercaseText = text.lowercased()
        return coins.filter { coin in
            return coin.name.lowercased().contains(lowercaseText) ||
            coin.symbol.lowercased().contains(lowercaseText) ||
            coin.id.lowercased().contains(lowercaseText)
        }
    }
}
