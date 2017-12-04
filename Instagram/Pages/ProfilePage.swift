//
//  ProfilePage.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/2/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class ProfilePage: BasePage {    
    let testAPIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "[username]"
        
        view.addSubview(testAPIButton)
        testAPIButton.setTitle("Click me", for: .normal)
        testAPIButton.setTitleColor(.black, for: .normal)
        testAPIButton.addTarget(self, action: #selector(testRequest), for: .touchUpInside)
        
        addConstraints()
    }
    
    private func addConstraints() {
        testAPIButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    @objc func testRequest() {
        //put postRequest or getRequest func here
        print("Tapped")
    }

    func postRequest() {
        TestAPIManager.testAPIPostRequest(url: "paste your URL here") { (dictionary) in
            print("Completed")
        }
    }
    
    func getRequest() {
        TestAPIManager.testAPIGetRequest(url: "paste your URL here") { (dictionary) in
            print("Completed")
        }
    }
}
