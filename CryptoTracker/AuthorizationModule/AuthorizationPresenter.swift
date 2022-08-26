//
//  AuthorizationPresenter.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 23.08.2022.
//

import Foundation
import UIKit

final class AuthorizationPresenter: AuthorizationViewControllerProtocolOut {
    func createNewVC() {
        let newVC = ModelBuilder.createCryptoTableModule()
        let window = UIApplication.shared.connectedScenes.flatMap {($0 as? UIWindowScene)?.windows ?? []}.first {$0.isKeyWindow}
        let navBar = UINavigationController(rootViewController: newVC)
        window?.rootViewController = navBar
        window?.makeKeyAndVisible()
    }
}



