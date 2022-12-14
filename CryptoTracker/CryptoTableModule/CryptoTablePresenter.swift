//
//  CryptoTablePresenter.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 23.08.2022.
//

import Foundation
import UIKit

class CryptoTablePresenter: CryptoTableProtocolIn {
    
    weak var view: CryptoTableProtocolOut?
    weak var network: NetworkProtocol?
    var cryptoCoins: [CryptoModel]?
    
    required init(view: CryptoTableProtocolOut, network: NetworkProtocol) {
        self.view = view
        self.network = network
        getCryptoCoins()
    }
    
    func getCryptoCoins() {
        network?.getCrypto(completion: { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let cryptoCoins):
                    self.cryptoCoins = cryptoCoins
                    self.cryptoCoins?.sort(by: { firstCoin, secondCoin in
                        return firstCoin.data?.marketData?.priceUSD ?? 0 > secondCoin.data?.marketData?.priceUSD ?? 0
                    })
                    self.view?.succes()
                case.failure(let error):
                    self.view?.failure(error: error)
                }
            }
        })
    }
}

