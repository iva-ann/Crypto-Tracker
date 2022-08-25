//
//  CryptoTableViewCell.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 24.08.2022.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    static let identifier = "CryptoTableViewCell"

    
//    SubviewsCryptoTableViewCellCryptoModel
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .medium)
        return label
    }()
    
    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 22, weight: .semibold )
        return label
    }()
    
//    Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(priceLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
//    Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    
//    Configure
    
    func configure(with viewModel: CryptoTableViewCellCryptoModel) {
        nameLabel.text = viewModel.name
        symbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.price
    }
    
    func setupView() {
        nameLabel.sizeToFit()
        symbolLabel.sizeToFit()
        priceLabel.sizeToFit()
        
        nameLabel.frame = CGRect(x: 35,
                                 y: 0,
                                 width: contentView.frame.size.width/2,
                                 height: contentView.frame.size.height/2)
        
        symbolLabel.frame = CGRect(x: 35,
                                 y: contentView.frame.size.height/2 ,
                                 width: contentView.frame.size.width/2,
                                 height: contentView.frame.size.height/2)
        
        priceLabel.frame = CGRect(x: contentView.frame.size.width/2,
                                 y: 0,
                                 width: (contentView.frame.size.width/2)-35,
                                 height: contentView.frame.size.height)
    }

}
