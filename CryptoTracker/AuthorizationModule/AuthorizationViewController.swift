//
//  AuthorizationViewController.swift
//  CryptoTracker
//
//  Created by Анна Иванова on 22.08.2022.
//

import UIKit
import SnapKit

class AuthorizationViewController: UIViewController {

    var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Crypto Tracker"
        title.font = .boldSystemFont(ofSize: 50)
        title.textAlignment = .center
        return title
    }()
    
    lazy var loginTF: UITextField = {
        let login = UITextField()
        login.borderStyle = .roundedRect
        login.backgroundColor = .white
        login.attributedPlaceholder = NSAttributedString(string: "Логин", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray4])
        return login
    } ()
    
    
    lazy var passwordTF: UITextField = {
        let password = UITextField()
        password.borderStyle = .roundedRect
        password.backgroundColor = .white
        password.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray4])
        return password
    } ()
    
    lazy var authorizationStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [loginTF, passwordTF])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 20
        return stack
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.layer.cornerRadius = 30
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.black , for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
    
    var presenter: AuthorizationViewControllerProtocolOut?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        setupView()
    }
    
    func setupView() {
        view.addSubview(titleLabel)
        view.addSubview(authorizationStackView)
        view.addSubview(loginButton)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.centerX.equalToSuperview()
             }
        
        authorizationStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-100)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc private func tappedButton() {
        print("tappedButtom")
        self.presenter?.createNewVC()
    }
}

    


