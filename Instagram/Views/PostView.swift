//
//  PostView.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/3/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

protocol PostViewDelegate: class {
    func moveToProfile()
    func moveToLocation()
    func likePost()
    func leaveComment()
}

class PostView: UIView {
    let profileImageView = UIImageView()
    let profileNameLabel = UILabel()
    let locationLabel = UILabel()
    let imageView = UIImageView()
    
    private let likeImageView = UIImageView()
    private let commentImageView = UIImageView()
    
    let numberOfLikesLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
