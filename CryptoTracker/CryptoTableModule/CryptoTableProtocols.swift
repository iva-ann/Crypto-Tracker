//
//  CryptoTableProtocols.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 23.08.2022.
//

import Foundation

protocol CryptoTableProtocolOut: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol CryptoTableProtocolIn: AnyObject {
    init(view: CryptoTableProtocolOut, network: NetworkProtocol)
    
    func getCryptoCoins()
    var cryptoCoins: [CryptoModel]? { get set }
    
}
