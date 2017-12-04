//
//  TestAPIManager.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/4/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TestAPIManager {
    
    //Simple example of get request
    static func testAPIGetRequest(url: String, completion: @escaping([String: Any]?) -> Void) {
        Alamofire.request(url).responseJSON { (response) in
            let json = JSON(response)
            print(json)
            
            completion(json.dictionaryObject)
        }
    }
    
    //Simple example of post request
    //Если header не нужен, просто убери с параметров или дай значение nil
    //Функция вызывается в ProfilePage
    static func testAPIPostRequest(url: String, completion: @escaping([String: Any]?) -> Void) {
        let headers: HTTPHeaders = [
            "access_token": "6574365739463465978436978346762596"
        ]
        
        let params: [String: Any] = [
            "name": "Sanzhar",
            "age": 20,
            "isStudent": true
        ]
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: headers).validate().responseJSON { (response) in
            let json = JSON(response)
            print(json)
            
            completion(json.dictionaryObject)
        }
    }
    
}
