//
//  CryptoModel.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 25.08.2022.
//

import Foundation
import UIKit

struct CryptoModel: Decodable {
    
    private enum CodingKeys: String, CodingKey { case data = "data"}
    let data : data?
}

struct data: Decodable {
    
    private enum CodingKeys : String, CodingKey {
        case name = "name"
        case symbol = "symbol"
        case marketData = "market_data"
    }
    
    let name: String?
    let symbol: String?
    let marketData: marketData?
}

struct marketData: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case priceUSD = "price_usd"
        case percentChangeUsdLast24Hours = "percent_change_usd_last_24_hours"
    }
    
    let priceUSD : Float?
    let percentChangeUsdLast24Hours : Float?
}

struct CryptoTableViewCellCryptoModel {
    let name: String
    let symbol: String
    let price: String
    let percent: String
}
