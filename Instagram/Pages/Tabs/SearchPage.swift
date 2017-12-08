//
//  SearchPage.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/3/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class SearchPage: BasePage, ImageCollectionViewControllerDelegate {
    let imageCollectionViewController = ImageCollectionViewController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        PhotoAPIManager.getInterestinImages(token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJlbWFpbCI6ImdtaXJ6aGFuQGdtYWlsLmNvbSIsInVzZXJuYW1lIjoibWlyemhhbi5ndW1hcm92IiwiZXhwIjoxNTQ0MjQzNjI4LCJvcmlnX2lhdCI6MTUxMjcwNzYyOH0.LgSEy8ntk_mplm9zKaJx0r-NiKYX9LYGxVFxvYZxqq8") { (photos) in
            
            self.imageCollectionViewController.photos = photos
            print(photos.count)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Discover"
        
        imageCollectionViewController.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(moveToSearchPage))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        view.addSubview(imageCollectionViewController.view)
        addConstraints()
    }
    
    func addConstraints(){
        imageCollectionViewController.view.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
        }
    }
    
    @objc func moveToSearchPage() {
        let viewController = SearchUserPage()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func cellTapped(photo: InterestingPhotos) {
        let viewController = UserPostPage()
        viewController.photo = photo
        navigationController?.pushViewController(viewController, animated: true)
    }
}
