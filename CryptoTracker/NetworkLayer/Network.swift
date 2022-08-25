//
//  Network.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 23.08.2022.
//

import Foundation

class Network: NetworkProtocol {

    static var shared = Network()
    
    func getCrypto(completion: @escaping (Result<[CryptoModel]?, Error>) -> Void) {
        var arrayOfCoins = [CryptoModel]()
        
//        URL
        guard let urlBTC = URL(string: "https://data.messari.io/api/v1/assets/btc/metrics") else { return }
        guard let urlETH = URL(string: "https://data.messari.io/api/v1/assets/eth/metrics") else { return }
        guard let urlTRON = URL(string: "https://data.messari.io/api/v1/assets/tron/metrics") else { return }
        guard let urlLUNA = URL(string: "https://data.messari.io/api/v1/assets/luna/metrics") else { return }
        guard let urlPOLKADOT = URL(string: "https://data.messari.io/api/v1/assets/polkadot/metrics") else { return }
        guard let urlDOGECOIN = URL(string: "https://data.messari.io/api/v1/assets/dogecoin/metrics") else { return }
        guard let urlTETHER = URL(string: "https://data.messari.io/api/v1/assets/tether/metrics") else { return }
        guard let urlSTELLAR = URL(string: "https://data.messari.io/api/v1/assets/stellar/metrics") else { return }
        guard let urlCARDANO = URL(string: "https://data.messari.io/api/v1/assets/cardano/metrics") else { return }
        guard let urlXRP = URL(string: "https://data.messari.io/api/v1/assets/xrp/metrics") else { return }
        
        
        let networkQueue = DispatchQueue(label: "networkQueue", attributes: .concurrent)
        let networkTaskGroup = DispatchGroup()
        
        networkQueue.async(group: networkTaskGroup)  {
            let taskBTC = URLSession.shared.dataTask(with: urlBTC) { data, response, error in
                  guard let data = data else { return }
                  if let error = error {
                      completion(.failure(error))
                  }
                  
                  do {
                      let jsonResult = try JSONDecoder().decode(CryptoModel?.self, from: data)
                      guard let jsonResult = jsonResult else { return }
                      arrayOfCoins.append(jsonResult)
                      completion(.success(arrayOfCoins))
                  } catch {
                      completion(.failure(error))
                  }
              }.resume()
        }
        
        networkQueue.async(group: networkTaskGroup)  {
              let taskETH = URLSession.shared.dataTask(with: urlETH) { data, response, error in
                    guard let data = data else { return }
                    if let error = error {
                        completion(.failure(error))
                    }
                    
                    do {
                        let jsonResult = try JSONDecoder().decode(CryptoModel?.self, from: data)
                        guard let jsonResult = jsonResult else { return }
                        arrayOfCoins.append(jsonResult)
                        completion(.success(arrayOfCoins))
                    } catch {
                        completion(.failure(error))
                    }
                }.resume()
        }
        
        networkQueue.async(group: networkTaskGroup)  {
              let taskXRP = URLSession.shared.dataTask(with: urlXRP) { data, response, error in
                    guard let data = data else { return }
                    if let error = error {
                        completion(.failure(error))
                    }
                    
                    do {
                        let jsonResult = try JSONDecoder().decode(CryptoModel?.self, from: data)
                        guard let jsonResult = jsonResult else { return }
                        arrayOfCoins.append(jsonResult)
                        completion(.success(arrayOfCoins))
                    } catch {
                        completion(.failure(error))
                    }
                }.resume()
        }
        networkQueue.async(group: networkTaskGroup)  {
              let taskLUNA = URLSession.shared.dataTask(with: urlLUNA) { data, response, error in
                    guard let data = data else { return }
                    if let error = error {
                        completion(.failure(error))
                    }
                    
                    do {
                        let jsonResult = try JSONDecoder().decode(CryptoModel?.self, from: data)
                        guard let jsonResult = jsonResult else { return }
                        arrayOfCoins.append(jsonResult)
                        completion(.success(arrayOfCoins))
                    } catch {
                        completion(.failure(error))
                    }
                }.resume()
        }
        
        networkQueue.async(group: networkTaskGroup)  {
              let taskTRON = URLSession.shared.dataTask(with: urlTRON) { data, response, error in
                    guard let data = data else { return }
                    if let error = error {
                        completion(.failure(error))
                    }
                    
                    do {
                        let jsonResult = try JSONDecoder().decode(CryptoModel?.self, from: data)
                        guard let jsonResult = jsonResult else { return }
                        arrayOfCoins.append(jsonResult)
                        completion(.success(arrayOfCoins))
                    } catch {
                        completion(.failure(error))
                    }
                }.resume()
        }
        
        networkQueue.async(group: networkTaskGroup)  {
              let taskTETHER = URLSession.shared.dataTask(with: urlTETHER) { data, response, error in
                    guard let data = data else { return }
                    if let error = error {
                        completion(.failure(error))
                    }
                    
                    do {
                        let jsonResult = try JSONDecoder().decode(CryptoModel?.self, from: data)
                        guard let jsonResult = jsonResult else { return }
                        arrayOfCoins.append(jsonResult)
                        completion(.success(arrayOfCoins))
                    } catch {
                        completion(.failure(error))
                    }
                }.resume()
        }
        
        networkQueue.async(group: networkTaskGroup)  {
              let taskCARDANO = URLSession.shared.dataTask(with: urlCARDANO) { data, response, error in
                    guard let data = data else { return }
                    if let error = error {
                        completion(.failure(error))
                    }
                    
                    do {
                        let jsonResult = try JSONDecoder().decode(CryptoModel?.self, from: data)
                        guard let jsonResult = jsonResult else { return }
                        arrayOfCoins.append(jsonResult)
                        completion(.success(arrayOfCoins))
                    } catch {
                        completion(.failure(error))
                    }
                }.resume()
        }
        
        networkQueue.async(group: networkTaskGroup)  {
              let taskSTELLAR = URLSession.shared.dataTask(with: urlSTELLAR) { data, response, error in
                    guard let data = data else { return }
                    if let error = error {
                        completion(.failure(error))
                    }
                    
                    do {
                        let jsonResult = try JSONDecoder().decode(CryptoModel?.self, from: data)
                        guard let jsonResult = jsonResult else { return }
                        arrayOfCoins.append(jsonResult)
                        completion(.success(arrayOfCoins))
                    } catch {
                        completion(.failure(error))
                    }
                }.resume()
    }
        networkQueue.async(group: networkTaskGroup)  {
              let taskDOGECOIN = URLSession.shared.dataTask(with: urlDOGECOIN) { data, response, error in
                    guard let data = data else { return }
                    if let error = error {
                        completion(.failure(error))
                    }
                    
                    do {
                        let jsonResult = try JSONDecoder().decode(CryptoModel?.self, from: data)
                        guard let jsonResult = jsonResult else { return }
                        arrayOfCoins.append(jsonResult)
                        completion(.success(arrayOfCoins))
                    } catch {
                        completion(.failure(error))
                    }
                }.resume()
        }
        
        networkQueue.async(group: networkTaskGroup)  {
              let taskPOLKADOT = URLSession.shared.dataTask(with: urlPOLKADOT) { data, response, error in
                    guard let data = data else { return }
                    if let error = error {
                        completion(.failure(error))
                    }
                    
                    do {
                        let jsonResult = try JSONDecoder().decode(CryptoModel?.self, from: data)
                        guard let jsonResult = jsonResult else { return }
                        arrayOfCoins.append(jsonResult)
                        completion(.success(arrayOfCoins))
                    } catch {
                        completion(.failure(error))
                    }
                }.resume()
        }
        
        networkTaskGroup.notify(queue: .main) {
            print("get Crypto")
        }
    }
    
}
