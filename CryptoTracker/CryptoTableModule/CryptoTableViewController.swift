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
        tableView.dataSource = self
        tableView.delegate = self
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Crypto Tracker"
        view.addSubview(tableView)
    }
}

extension CryptoTableViewController: CryptoTableProtocolOut {
    func succes() {
        guard let cryptoCoins = presenter?.cryptoCoins else { return }
        self.cryptoViewModel = cryptoCoins.compactMap({
            let price = $0.data?.marketData?.priceUSD ?? 0
            let formatter = CryptoTableViewController.numberFormatter
            let priceString = formatter.string(from: NSNumber(value: price))
            let percent = $0.data?.marketData?.percentChangeUsdLast24Hours ?? 0
            let percentString = "\(String(format: "%.4f", percent))%"
            
            return  CryptoTableViewCellCryptoModel(
                name: $0.data?.name ?? "Not found",
                symbol: $0.data?.symbol ?? "Not found",
                price: priceString ?? "Not found",
                percent: percentString
            )})
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

extension CryptoTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.cryptoCoins?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath) as? CryptoTableViewCell else { fatalError() }
        cell.configure(with: self.cryptoViewModel[indexPath.row])
        cell.backgroundColor = .secondarySystemBackground
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension CryptoTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cryptoCoin = presenter?.cryptoCoins?[indexPath.row] else { return }
        let cryptoInformationViewController = ModelBuilder.createCryptoInformationModule(cryptoInformation: cryptoCoin)
        navigationController?.pushViewController(cryptoInformationViewController, animated: true)
        
    }
}


