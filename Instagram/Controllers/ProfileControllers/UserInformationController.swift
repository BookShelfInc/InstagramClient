//
//  UserInformationController.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/3/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class UserInformationController: UIViewController {
    let userImageView = UIImageView()
    let usernameLabel = UILabel()
    
    let posts = CountIndicatorView()
    let followers = CountIndicatorView()
    let following = CountIndicatorView()
    
    let editProfileButton = UIButton()
    let settingsButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
