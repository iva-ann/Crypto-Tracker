//
//  CryptoInformationPresenter.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 26.08.2022.
//

import Foundation

class CryptoInformationPresenter: CryptoInformationProtocolIn {
    weak var view: CryptoInformationProtocolOut?
    let network: NetworkProtocol?
    let cryptoInformation: CryptoModel?
    
    required init(view: CryptoInformationProtocolOut, network: NetworkProtocol, cryptoInformation: CryptoModel?) {
        self.view = view
        self.network = network
        self.cryptoInformation = cryptoInformation
    }
    
   public func getCryptoInformation() {
       self.view?.setCryptoInformation(cryptoInform: cryptoInformation)
    }
    
    
}
