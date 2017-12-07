//
//  LoginPage.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/7/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class LoginPage: BasePage {
    let username = UITextField()
    let password = UITextField()
    let loginButton = UIButton()
    let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
        
        configureSubviews()
        
        view.addSubview(username)
        view.addSubview(password)
        view.addSubview(loginButton)
        view.addSubview(footerView)
        
        addConstraints()
    }
    
    func addConstraints() {
        username.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(130)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        password.snp.makeConstraints { (make) in
            make.top.equalTo(username.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(password.snp.bottom).offset(35)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        footerView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
    }
    
    func configureSubviews() {
        username.placeholder = "Enter username"
        username.borderStyle = .roundedRect
        username.keyboardType = .default
        
        password.placeholder = "Enter password"
        password.borderStyle = .roundedRect
        password.keyboardType = .default
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    @objc func login() {
        print("Login tapped")
    }
}
