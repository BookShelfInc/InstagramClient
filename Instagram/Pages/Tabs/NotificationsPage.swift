//
//  NotificationsPage.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/3/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class NotificationsPage: BasePage {
    let segmentedControl = UISegmentedControl()
    let userRequestViewController = UserRequestViewController()
    let userActionViewController = UserActionViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notifications"
        
        configureSegmentedController()
        
        view.addSubview(segmentedControl)
        view.addSubview(userRequestViewController.view)
        view.addSubview(userActionViewController.view)
        
        initialStateOfHomePage()
        addConstraints()
    }
    
    func addConstraints(){
        segmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
        }
        
        userRequestViewController.view.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(3)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        userActionViewController.view.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(3)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func configureSegmentedController() {
        segmentedControl.addTarget(self, action: #selector(segmentTapped(_ :)), for: .valueChanged)
        segmentedControl.tintColor = .black
        segmentedControl.insertSegment(withTitle: "Request", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Actions", at: 1, animated: true)
        
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @objc func segmentTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            initialStateOfHomePage()
        case 1:
            userRequestViewController.view.isHidden = false
            userActionViewController.view.isHidden = true
        default:
            print("OMG")
        }
    }
    
    func initialStateOfHomePage(){
        userRequestViewController.view.isHidden = true
        userActionViewController.view.isHidden = false
    }
}
