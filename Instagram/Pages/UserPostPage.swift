//
//  UserPostPage.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/7/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class UserPostPage: BasePage {
    let currentToken = Constants.testToken
    var postId: Int?
    var commentBody: CommentBody?
    
    
    var isLiked: Bool = false
    var likeCount: Int?
    
    let widthHeight = UIScreen.main.bounds.width
    
    var userImage: UIImage? {
        didSet {
            imageView.image = UIImage.resizedCroppedImage(image: userImage!, newSize: CGSize(width: widthHeight, height: widthHeight))
        }
    }
    
    
    var photo: InterestingPhotos? {
        didSet {
            print(photo!.numberOfLikes)
            postId = photo!.id
            commentBody = CommentBody(comment: "", userId: photo!.userId, photoId: photo!.id)
            likeCount = photo!.numberOfLikes
            numberOfLikes.text = String(likeCount!) + " likes"
            imageFromServerURL(urlString: photo!.imageLink)
            ProfileAPIManager.getUser(userId: photo!.userId, token: currentToken) { (valid) in
                
                self.username.text = valid.username
                if valid.imageLink.isEmpty {
                    self.userImageView.image = #imageLiteral(resourceName: "avatar_placeholder")
                } else {
                    self.userImageView.imageFromServerURL(urlString: valid.imageLink)
                }
            }
        }
    }
    
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    let testView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    let userImageView = UIImageView()
    let username = UILabel()
    let likes = UILabel()
    let imageView = UIImageView()
    let numberOfLikes = UILabel()
    
    let likeButton = UIButton()
    let commentButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photo"

        view.addSubview(headerView)
        headerView.addSubview(userImageView)
        headerView.addSubview(username)
        
        view.addSubview(imageView)
        view.addSubview(likeButton)
        view.addSubview(commentButton)
        view.addSubview(numberOfLikes)
        
        addConstraints()
    }
    
    private func addConstraints() {
        headerView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        
        userImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.height.equalToSuperview().multipliedBy(0.8)
            make.width.equalTo(userImageView.snp.height)
        }
        
        username.snp.makeConstraints { (make) in
            make.leading.equalTo(userImageView.snp.trailing).offset(10)
            make.centerY.equalTo(userImageView)
        }
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.width)
        }
        
        (isLiked) ? likeButton.setTitle("Unlike", for: .normal) : likeButton.setTitle("Like", for: .normal)
        likeButton.setTitleColor(.black, for: .normal)
        likeButton.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)
        likeButton.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.leading.equalToSuperview()
        }
        
        commentButton.setTitleColor(.black, for: .normal)
        commentButton.addTarget(self, action: #selector(commentTapped), for: .touchUpInside)
        commentButton.setTitle("Comment", for: .normal)
        commentButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(likeButton)
            make.leading.equalTo(likeButton.snp.trailing).offset(10)
        }
        
        numberOfLikes.textColor = .black
        numberOfLikes.snp.makeConstraints { (make) in
            make.top.equalTo(commentButton.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
        }
        
        imageView.image = #imageLiteral(resourceName: "avatar_placeholder")
    }
    
    @objc private func likeTapped() {
        isLiked = !isLiked
        (isLiked) ? likeButton.setTitle("Unlike", for: .normal) : likeButton.setTitle("Like", for: .normal)
        
        likeCount! += (isLiked) ? 1 : -1
        numberOfLikes.text = String(likeCount!) + " likes"
        likeThisPhoto()
    }
    
    @objc private func commentTapped() {
        let viewController = CommentPage()
        viewController.commentBody = commentBody!
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func imageFromServerURL(urlString: String) {
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                print("I am here imageFromServerURL")
                self.userImage = image
            })
        }).resume()
    }
    
    private func likeThisPhoto() {
        PhotoAPIManager.putLike(id: postId!, token: currentToken) { (isValid) in
            if isValid {
                print("Liiiiiiiiiked")
            } else {
                print("Errooooooooor")
            }
        }
    }
}
