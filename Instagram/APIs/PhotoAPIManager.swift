//
//  PhotoAPIManager.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/7/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct CommentBody {
    let comment: String
    let userId: Int
    let photoId: Int
}

class PhotoAPIManager {
    static let baseURL: String = Constants.baseURL
    
    private static let userImagesLink: String = baseURL + "/photo/my/"
    private static let feedLink: String = baseURL + "/photo/feed/"
    private static let interestingImagesLink: String = baseURL + "/photo/interesting/"
    private static let getImagesLink: String = baseURL + "/photo/userphotos/"
    private static let uploadImageLink: String = baseURL + "/photo/uploadimage/"
    private static let leaveCommentLink: String = baseURL + "/photo/createcomment/"
    private static let deleteCommentLink: String = baseURL + "/photo/deletecomment/"
    private static let putLikeLink: String = baseURL + "/photo/like/"
    
    static func getUserImages(token: String, completion: @escaping(Bool) -> Void) {
        
        let headers = getHeaders(with: token)
        
        Alamofire.request(userImagesLink, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).validate().responseJSON { (response) in
            
            
        }
        
        completion(true)
    }
    
    static func getFeedImages(token: String, completion: @escaping(Bool) -> Void) {
        let headers = getHeaders(with: token)
        
        Alamofire.request(feedLink, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).validate().responseJSON { (response) in
            
            
        }
        
        completion(true)
    }
    
    static func getInterestinImages(token: String, completion: @escaping(Bool) -> Void) {
        let headers = getHeaders(with: token)
        
        Alamofire.request(interestingImagesLink, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).validate().responseJSON { (response) in
            
            
        }
        
        completion(true)
    }
    
    static func getImages(ofUser userId: Int, token: String, completion: @escaping(Bool) -> Void) {
        
        let headers = getHeaders(with: token)
        
        Alamofire.request(getImagesLink + "\(userId)/", method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).validate().responseJSON { (response) in
            
            
        }
        
        completion(true)
    }
    
    static func uploadImage(token: String, completion: @escaping(Bool) -> Void) {
        
        let headers = getHeaders(with: token)
        
        Alamofire.request(uploadImageLink, method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers).validate().responseJSON { (response) in
            
            
        }
        
        completion(true)
        
    }
    
    static func leaveComment(with commentBody: CommentBody, token: String, completion: @escaping(Bool) -> Void) {
        let headers = getHeaders(with: token)
        
        let params: InstaParams = [
            "comment": commentBody.comment,
            "author": commentBody.userId,
            "photo": commentBody.photoId
        ]
        
        Alamofire.request(leaveCommentLink, method: .post, parameters: params, encoding: URLEncoding.default, headers: headers).validate().responseJSON { (response) in
            
            
        }
        
        completion(true)
        
    }
    
    static func deleteComment(id: Int, token: String, completion: @escaping(Bool) -> Void) {
        let headers = getHeaders(with: token)
        
        Alamofire.request(deleteCommentLink + "\(id)/", method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers).validate().responseJSON { (response) in
            
            
        }
        
        completion(true)
        
        
    }
    
    static func putLike(id: Int, token: String, completion: @escaping(Bool) -> Void) {
        let headers = getHeaders(with: token)
        
        Alamofire.request(putLikeLink + "\(id)/", method: .post, parameters: nil, encoding: URLEncoding.default, headers: headers).validate().responseJSON { (response) in
            
            
        }
        
        completion(true)
    }
    
    static private func getHeaders(with token: String) -> [String: String] {
        return [
            "Content-Type": "application/json",
            "Authorization": "JWT " + token
        ]
    }
}
