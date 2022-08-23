//
//  CryptoTableViewController.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 23.08.2022.
//

import UIKit

class CryptoTableViewController: UIViewController {

    var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Hi"
        title.font = .boldSystemFont(ofSize: 50)
        title.textAlignment = .center
        return title
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        setupView()
    }
    
    func setupView() {
        view.addSubview(titleLabel)
        
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.centerX.equalToSuperview()
             }

    

}
}
