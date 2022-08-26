//
//  ModelBuilder.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 23.08.2022.
//

import UIKit

protocol Builder {
    static func createAuthorizationModule() -> UIViewController
    static func createCryptoTableModule() -> UIViewController
    static func createCryptoInformationModule(cryptoInformation: CryptoModel?) -> UIViewController
}

class ModelBuilder: Builder {
   
    static func createAuthorizationModule() -> UIViewController {
        let view = AuthorizationViewController()
        let presenter = AuthorizationPresenter()
        view.presenter = presenter
        return view
    }
    
    static func createCryptoTableModule() -> UIViewController {
        let view = CryptoTableViewController()
        let network = Network()
        let presenter = CryptoTablePresenter(view: view, network: network)
        view.presenter = presenter
        return view 
    }
    
    static func createCryptoInformationModule(cryptoInformation: CryptoModel?) -> UIViewController {
        let view = CryptoInformationViewController()
        let network = Network()
        let presenter = CryptoInformationPresenter(view: view, network: network, cryptoInformation: cryptoInformation)
        view.presenter = presenter
        return view
    }
}
