//
//  FeedPage.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/2/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class FeedPage: BasePage, ImageCollectionViewControllerDelegate {
    //let tableView = UITableView()
    let imageCollectionViewController = ImageCollectionViewController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Add
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Instagram"
        
        imageCollectionViewController.delegate = self
        
        //tableView.dataSource = self
        //tableView.delegate = self
        
        //view.addSubview(tableView)
        
        view.addSubview(imageCollectionViewController.view)
        addConstraints()
    }

    func addConstraints() {
        imageCollectionViewController.view.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
        }
        
        /*tableView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                make.top.equalTo(topLayoutGuide.snp.bottom)
            }
            make.leading.trailing.bottom.equalToSuperview()
        }*/
    }
    
    func cellTapped(photo: InterestingPhotos) {
        let viewController = UserPostPage()
        viewController.photo = photo
        navigationController?.pushViewController(viewController, animated: true)
    }
}

/*extension FeedPage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}*/
