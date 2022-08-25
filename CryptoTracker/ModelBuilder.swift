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
    
}
