//
//  ProfileAPIManager.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/7/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ProfileAPIManager {
    static let baseURL: String = Constants.baseURL
    
    static let getUserLink: String = baseURL + "/auth/user/"
    
    
    static func getUser(userId: Int, token: String, completion: @escaping(User) -> Void){
        let headers = getHeaders(with: token)
        
        Alamofire.request(getUserLink + "\(userId)/", method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).validate().responseJSON { (response) in
            
            let json = JSON(response.data!)
            let user = User(json: json)
            
            completion(user)
        }
    }
    
    static private func getHeaders(with token: String) -> [String: String] {
        return [
            "Content-Type": "application/json",
            "Authorization": "JWT " + token
        ]
    }
}
