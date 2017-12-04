//
//  CustomTabBarController.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/2/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController, CustomTabBarDataSource, CustomTabBarDelegate {
    
    let feedPage = UINavigationController(rootViewController: FeedPage())
    let searchPage = UINavigationController(rootViewController: SearchPage())
    let uploadImagePage = UINavigationController(rootViewController: UploadImagePage())
    let notificationsPage = UINavigationController(rootViewController: NotificationsPage())
    let profilePage = UINavigationController(rootViewController: ProfilePage())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.isHidden = true
        self.selectedIndex = 1
        
        setTabBarImages()
        
        viewControllers = [feedPage, searchPage, uploadImagePage, notificationsPage, profilePage]
        
        let customTabBar = CustomTabBar(frame: self.tabBar.frame)
        
        customTabBar.dataSource = self
        customTabBar.delegate = self
        
        customTabBar.setTabBarColor(of: Constants.tabBarColor)
        setConstraints()
        view.addSubview(customTabBar)
        customTabBar.setup()
    }
    
    func tabBarItemsInCustomTabBar(tabBarItems: CustomTabBar) -> [UITabBarItem] {
        return tabBar.items!
    }
    
    func didSelectViewController(tabBarView: CustomTabBar, atIndex index: Int) {
        self.selectedIndex = index
    }
    
    private func setConstraints() {
        let lineView = UIView()
        
        tabBar.addSubview(lineView)
        lineView.backgroundColor = .lightGray
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(tabBar.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    private func setTabBarImages(){
        feedPage.tabBarItem.image = UIImage(named: "house")
        searchPage.tabBarItem.image = UIImage(named: "search")
        uploadImagePage.tabBarItem.image = UIImage(named: "add")
        notificationsPage.tabBarItem.image = UIImage(named: "heart")
        profilePage.tabBarItem.image = UIImage(named: "user")
    }
}
