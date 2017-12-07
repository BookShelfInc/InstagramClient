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
    
    func cellTapped() {
        let viewController = UserPostPage()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
