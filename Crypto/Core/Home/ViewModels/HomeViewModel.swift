//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Yuri Petrosyan on 29/11/2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let dataSerive = CoinDataService()
    
    
    private var cancellables = Set<AnyCancellable>()
    init(){
        addSubscriber()
        
    }
    
    func addSubscriber() {
        
        dataSerive.$allCoins
            .sink { [weak self](returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
}
