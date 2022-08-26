//
//  CryptoInformationProtocol.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 26.08.2022.
//

import Foundation

protocol CryptoInformationProtocolOut: AnyObject {
    func setCryptoInformation(cryptoInform: CryptoModel?)
}

protocol CryptoInformationProtocolIn: AnyObject {
    init(view: CryptoInformationProtocolOut, network: NetworkProtocol, cryptoInformation: CryptoModel?)
    func getCryptoInformation()
}
