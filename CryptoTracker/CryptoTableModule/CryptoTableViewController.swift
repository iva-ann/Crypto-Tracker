//
//  CryptoTableViewController.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 23.08.2022.
//

import UIKit

class CryptoTableViewController: UIViewController {
    var presenter: CryptoTableProtocolIn?
    private var cryptoViewModel = [CryptoTableViewCellCryptoModel]()
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = .currency
        formatter.formatterBehavior = .default
        return formatter
    }()

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CryptoTableViewCell.self,
                           forCellReuseIdentifier: CryptoTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Crypto Tracker"
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    func setupView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        }
}

extension CryptoTableViewController: CryptoTableProtocolOut {
    func succes() {
        guard let cryptoCoins = presenter?.cryptoCoins else { return }
        self.cryptoViewModel = cryptoCoins.compactMap({
            let price = $0.data?.market_data?.price_usd ?? 0
            let formatter = CryptoTableViewController.numberFormatter
            let priceString = formatter.string(from: NSNumber(value: price))
            
           return  CryptoTableViewCellCryptoModel(
                name: $0.data?.name ?? "Not found",
                symbol: $0.data?.symbol ?? "Not found",
                price: priceString ?? "Not found"
        )})
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func failure(error: Error) {
//        здесь можно вывести на экран алерт 
        print(error.localizedDescription)
    }
}

extension CryptoTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.cryptoCoins?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath) as? CryptoTableViewCell else { fatalError() }
        cell.configure(with: self.cryptoViewModel[indexPath.row])
//        cell.backgroundColor = .secondarySystemBackground
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 
    }
    
    
    
}
