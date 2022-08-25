//
//  CryptoTableProtocols.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 23.08.2022.
//

import Foundation

// протокол для VC. если сак - отображаем, если фейл - ничего
protocol CryptoTableProtocolOut: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol CryptoTableProtocolIn: AnyObject {
    init(view: CryptoTableProtocolOut, network: NetworkProtocol)
    
//    запрашивает комменты из сети
    func getCryptoCoins()
//    сохранение данных из инета 
    var cryptoCoins: [CryptoModel]? { get set }
    
}
