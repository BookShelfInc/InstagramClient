//
//  ProfilePage.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/2/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class ProfilePage: BasePage, ImageCollectionViewControllerDelegate {
    let stackView = UIStackView()
    
    let posts = CounterView(number: 0, title: "Posts")
    let followers = CounterView(number: 1, title: "Followers")
    let following = CounterView(number: 2, title: "Following")
    
    let editProfileButton = UIButton()
    let settingsButton = UIButton()
    
    let imageViewWrapperView = UIView()
    let imageView = UIImageView()
    
    let usernameLabel = UILabel()
    let bioLabel = UILabel()
    
    let imageCollectionViewController = ImageCollectionViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "[username]"
        
        imageCollectionViewController.delegate = self
        
        view.addSubview(stackView)
        view.addSubview(editProfileButton)
        view.addSubview(settingsButton)
        view.addSubview(imageViewWrapperView)
        imageViewWrapperView.addSubview(imageView)
        imageViewWrapperView.addSubview(usernameLabel)
        view.addSubview(bioLabel)
        view.addSubview(imageCollectionViewController.view)
        
        addConstraints()
        configureButtons()
        setupStackView()
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        
        stackView.addArrangedSubview(posts)
        stackView.addArrangedSubview(followers)
        stackView.addArrangedSubview(following)
        
    }
    
    private func addConstraints() {
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.trailing.equalToSuperview().offset(-15)
            make.width.equalToSuperview().multipliedBy(0.6)
        }
        
        editProfileButton.snp.makeConstraints { (make) in
            make.top.equalTo(stackView.snp.bottom).offset(10)
            make.left.equalTo(stackView.snp.left)
            make.width.equalTo(stackView.snp.width).multipliedBy(0.7)
        }
        
        settingsButton.snp.makeConstraints { (make) in
            make.top.equalTo(stackView.snp.bottom).offset(10)
            make.leading.equalTo(editProfileButton.snp.trailing).offset(2)
            make.right.equalTo(stackView.snp.right)
        }
        
        imageViewWrapperView.backgroundColor = .red
        imageViewWrapperView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalTo(stackView.snp.leading)
            make.height.equalTo(imageViewWrapperView.snp.width)
        }
        
        
        //imageView.image = #imageLiteral(resourceName: "avatar_placeholder")
        
        let url = URL(string: "https://s3.us-east-2.amazonaws.com/insta-project-photo-s3bucket/san/2017_12_07_09_11_40_small.jpg")
        let data = try? Data(contentsOf: url!)
        let imagee = UIImage(data: data!)
        imageView.image = imagee
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(imageView.snp.width)
        }
        
        usernameLabel.text = "user Full name"
        usernameLabel.font = usernameLabel.font.withSize(14)
        usernameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageView.snp.left)
            make.bottom.equalToSuperview()
        }
        
        bioLabel.numberOfLines = 3
        bioLabel.font = bioLabel.font.withSize(14)
        bioLabel.adjustsFontSizeToFitWidth = true
        bioLabel.text = "Here is the place where you will place your bio and other long stuff that increase size dynamically"
        bioLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageViewWrapperView.snp.bottom).offset(5)
            make.left.equalTo(usernameLabel.snp.left)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        imageCollectionViewController.view.snp.makeConstraints { (make) in
            make.top.equalTo(bioLabel.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func configureButtons() {
        editProfileButton.setTitle("Edit Profile", for: .normal)
        editProfileButton.backgroundColor = .lightGray
        editProfileButton.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        
        settingsButton.setTitle("S", for: .normal)
        settingsButton.backgroundColor = .lightGray
        settingsButton.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    @objc private func tapped() {
        print("Tapped")
    }
    
    func cellTapped() {
        let viewController = UserPostPage()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
