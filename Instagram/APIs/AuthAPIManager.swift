//
//  AuthAPIManager.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/7/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias InstaParams = [String: Any]

class AuthAPIManager {
    static let baseURL: String = Constants.baseURL
    
    private static let signUpLink: String = baseURL + "/auth/register/"
    private static let signInLink: String = baseURL + "/auth/login/"
    private static let getInfoLink: String = baseURL + "/auth/info/"
    
    
    static func signUp(username: String, email: String, password: String, completion: @escaping(Bool) -> Void) {
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let params: InstaParams = [
            "username": username,
            "email": email,
            "password": password
        ]
        
        Alamofire.request(signUpLink, method: .post, parameters: params, encoding: URLEncoding.default, headers: headers).validate().responseJSON { (response) in
            
            
            
        }
    }
    
    static func signIn(username: String, password: String, completion: @escaping(_ token: String?) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let params: InstaParams = [
            "username": username,
            "password": password
        ]
        
        Alamofire.request(signInLink, method: .post, parameters: params, encoding: URLEncoding.default, headers: headers).validate().responseJSON { (response) in
            let json = JSON(response.data!)
            switch response.result {
                case .success(let value):
                    print(json["token"])
                    print(value)
                    completion(json["token"].stringValue)
                case .failure(let error):
                    print(error)
                    completion(nil)
            }
        }
    }
    
    static func getInfo(token: String, completion: @escaping(Bool) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "JWT" + token
        ]
        
        Alamofire.request(getInfoLink, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).validate().responseJSON { (response) in
            
            var json: JSON?
            
            switch response.result {
                case .success(let value):
                    json = JSON(response.data!)
                    print(value)
                    print(json!)
                    completion(true)
                case .failure(let error):
                    print(error)
                    completion(false)
            }
        }
        
    }
}
