//
//  CryptoModel.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 25.08.2022.
//

import Foundation

struct CryptoModel: Decodable {
    
    private enum CodingKeys: String, CodingKey { case data = "data"}
    let data : data?
}

struct data: Decodable {
    
    private enum CodingKeys : String, CodingKey {
        case name = "name"
        case symbol = "symbol"
        case market_data = "market_data"
    }
    
    let name: String?
    let symbol: String?
    let market_data: market_data?
}

struct market_data: Decodable {
    
    private enum CodingKeys: String, CodingKey { case price_usd = "price_usd"}
    let price_usd : Float?
}

struct CryptoTableViewCellCryptoModel {
    let name: String
    let symbol: String
    let price: String
}
