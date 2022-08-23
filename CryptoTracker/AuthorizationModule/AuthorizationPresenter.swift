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
        let newVC = AuthtorizationBuilder.createCryptoTableModule()
        print("Creat new VC")
        let window = UIApplication.shared.connectedScenes.flatMap {($0 as? UIWindowScene)?.windows ?? []}.first {$0.isKeyWindow}
        window?.rootViewController = UINavigationController(rootViewController: newVC)
        window?.makeKeyAndVisible()
        print("Change root VC")
    }
}



