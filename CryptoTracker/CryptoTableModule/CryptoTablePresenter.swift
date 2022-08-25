//
//  CryptoTablePresenter.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 23.08.2022.
//

import Foundation

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
                    self.view?.succes()
                case.failure(let error):
                    self.view?.failure(error: error)
                }
            }
        })
    }
}
        
 /*
        Network.shared.getCrypto { [ weak self ]result in
            switch result{
            case .success(let coins):
                guard let coins = coins else { return }
                print(coins)
                self?.viewModels = coins.compactMap({
                    CryptoTableViewCellCryptoModel(
                        name: $0.data?.name ?? "Not found",
                        symbol: $0.data?.symbol ?? "Not found",
                        price: String($0.data?.market_data?.price_usd ?? 0)
                )})
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                print("evrething work")
                print(self?.viewModels.count)
            case .failure(let error):
                print("not good, \(error)")
            }
        
//        network?.getCrypto { [weak self] result in
//            guard let self = self else { return }
//
//            DispatchQueue.main.async {
//                switch result{
//                case .success(let cryptoCoins):
//                    self.cryptoCoins = cryptoCoins
//                    self.view?.succes()
//
//                case .failure(let error):
//                    self.view?.failure(error: error)
                }
            }
        }
    }
    
   
}
  */
