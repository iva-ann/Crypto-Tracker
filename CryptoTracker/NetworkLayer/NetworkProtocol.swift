//
//  NetworkProtocol.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 25.08.2022.
//

import Foundation

protocol NetworkProtocol: AnyObject {
    func getCrypto(completion: @escaping (Result<[CryptoModel]?, Error>) -> Void)
}
