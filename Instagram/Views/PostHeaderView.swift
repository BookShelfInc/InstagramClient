//
//  PostHeaderView.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/7/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate: class {
    func sharedButtonTapped()
}

class PostHeaderView: UIView {
    //MARK: Header
    let headerView = UIView()
    let profileImageView = UIImageView()
    let username = UILabel()
    let shareButton = UIImageView()
    let gesture = UITapGestureRecognizer(target: self, action: #selector(shareTapped))
    
    weak var delegate: HeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(headerView)
        headerView.addSubview(profileImageView)
        headerView.addSubview(username)
        
        addSubviewConstraints()
    }
    
    private func addSubviewConstraints() {
        headerView.isUserInteractionEnabled = false
        headerView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
        }
        
        profileImageView.image = #imageLiteral(resourceName: "avatar_placeholder")
        profileImageView.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(10)
            make.height.width.equalTo(35)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        username.text = "[Username]"
        username.snp.makeConstraints { (make) in
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.centerY.equalTo(profileImageView)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func shareTapped() {
        print("BLEAAAAAAA")
        delegate?.sharedButtonTapped()
    }
}
