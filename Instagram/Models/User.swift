//
//  User.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/7/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Image {
    let id: Int
    let photoPath: String
}

class User {
    let userId: Int
    let username: String
    let bio: String?
    let followerCount: Int
    let followingCount: Int
    let imageLink: String
    //let owner: [String]
    
    init(json: JSON) {
        self.userId = json["id"].intValue
        self.username = json["username"].stringValue
        self.bio = json["bio"].stringValue
        self.followerCount = json["count_followers"].intValue
        self.followingCount = json["profile"]["following"].intValue
        self.imageLink = json["photo"]["photo_path"].stringValue
    }
}
