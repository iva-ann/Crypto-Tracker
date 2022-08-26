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
    
//    Views
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 35)
        label.textAlignment = .center
        return label
    }()
    
    lazy var symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .systemGreen
        label.textAlignment = .right
        return label
    }()
    
    lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray3
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 18, weight: .semibold )
        return label
    }()
    
    lazy var  parametrPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        label.text = "Price USD"
        return label
    }()
    
  lazy var parametrPercentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "Percent change last 24 hours"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        addViews()
        presenter?.getCryptoInformation()
    }
    
    override func viewDidLayoutSubviews() {
        setupView()
    }
    
    func addViews() {
        view.addSubview(nameLabel)
        view.addSubview(symbolLabel)
        view.addSubview(priceLabel)
        view.addSubview(percentLabel)
        view.addSubview(parametrPriceLabel)
        view.addSubview(parametrPercentLabel)
    }
    
    func setupView() {
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.leading.equalToSuperview().offset(35)
        }
        
        symbolLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(35)
        }
        
        parametrPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(symbolLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(35)
            make.width.equalTo(120)
        }
        
        parametrPercentLabel.snp.makeConstraints { make in
            make.top.equalTo(parametrPriceLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(35)
            make.width.equalTo(140)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(symbolLabel.snp.bottom).offset(30)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(120)
        }
        
        percentLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(100)
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
        
        let price = cryptoInform?.data?.marketData?.priceUSD ?? 0
        let formatter = CryptoInformationViewController.numberFormatter
        let priceString = formatter.string(from: NSNumber(value: price))
        let percent = cryptoInform?.data?.marketData?.percentChangeUsdLast24Hours ?? 0
        let percentString = "\(String(format: "%.4f", percent))%"
        
        nameLabel.text = cryptoInform?.data?.name
        symbolLabel.text = cryptoInform?.data?.symbol
        priceLabel.text = priceString
        percentLabel.text = percentString
    }
}
