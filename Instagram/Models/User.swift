//
//  User.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/7/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class User {
    let username: String
    var email: String
    var bio: String?
    var isPrivate: Bool
    var photoLink: String?
    
    init(username: String, email: String, bio: String, isPrivate: Bool = false, photoLink: String?) {
        self.username = username
        self.email = email
        self.bio = bio
        self.isPrivate = isPrivate
        self.photoLink = photoLink
    }
    
    func getProfileImage() -> UIImage {
        let defaultImage = UIImage(named: "avatar_placeholder")!
        
        if let photo = self.photoLink {
            let url = URL(string: photo)
            let data = try? Data(contentsOf: url!)
            return UIImage(data: data!) ?? defaultImage
        } else {
            return defaultImage
        }
    }
}
