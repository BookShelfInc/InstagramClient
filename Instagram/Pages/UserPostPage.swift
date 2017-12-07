//
//  UserPostPage.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/7/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class UserPostPage: BasePage {
    
    let widthHeight = UIScreen.main.bounds.width
    
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
    
    let username = UILabel()
    let imageView = UIImageView()
    let image = UIImage(named: "mountains")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photo"

        view.addSubview(headerView)
        view.addSubview(imageView)
        addConstraints()
    }
    
    private func addConstraints() {
        headerView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.width)
        }
        
        imageView.image = UIImage.resizedCroppedImage(image: image!, newSize: CGSize(width: widthHeight, height: widthHeight))
    }
    
    func cropImage(image: UIImage, rect: CGRect) -> UIImage {
        
        
        return UIImage()
    }
}
