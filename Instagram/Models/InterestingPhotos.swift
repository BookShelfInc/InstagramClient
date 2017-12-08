//
//  InterestingPhotos.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/8/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import Foundation
import SwiftyJSON

class InterestingPhotos {
    let id: Int
    let userId: Int
    let imageLink: String
    let description: String?
    //let publishDate: String
    //let comments: [String]
    let numberOfLikes: Int
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.userId = json["user_id"].intValue
        self.imageLink = json["photo_path"].stringValue
        self.description = json["description"].stringValue
        let likes = json["likes"].arrayValue
        self.numberOfLikes = likes.count
    }
}
