//
//  CryptoInformationViewController.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 26.08.2022.
//

import UIKit
import SnapKit

class CryptoInformationViewController: UIViewController {

    var presenter: CryptoInformationProtocolIn?
    
    var nameLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 35)
        title.textAlignment = .center
        return title
    }()
    
    var symbolLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 20)
        title.textAlignment = .center
        return title
    }()
    
    var priceLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 20)
        title.textAlignment = .center
        return title
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.getCryptoInformation()
    }
    
    func setupView() {
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(nameLabel)
        view.addSubview(symbolLabel)
        view.addSubview(priceLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            make.centerX.equalToSuperview()
        }
        
        symbolLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(symbolLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}

extension CryptoInformationViewController: CryptoInformationProtocolOut {
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = .currency
        formatter.formatterBehavior = .default
        return formatter
    }()
    
    func setCryptoInformation(cryptoInform: CryptoModel?) {
        
        let price = cryptoInform?.data?.market_data?.price_usd ?? 0
        let formatter = CryptoInformationViewController.numberFormatter
        let priceString = formatter.string(from: NSNumber(value: price))
        
        nameLabel.text = cryptoInform?.data?.name
        symbolLabel.text = cryptoInform?.data?.symbol
        priceLabel.text = priceString
    }
    
    
    
}
