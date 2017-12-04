//
//  FeedPage.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/2/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class FeedPage: BasePage {
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Instagram"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "camera"), style: .done, target: self, action: #selector(cameraButton))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "paper_plane"), style: .done, target: self, action: #selector(directButton))
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        addConstraints()
    }
    
    func addConstraints() {
        tableView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                make.top.equalTo(topLayoutGuide.snp.bottom)
            }
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc func cameraButton(){
        print("Camera")
    }
    
    @objc func directButton(){
        print("Direct")
    }
}

extension FeedPage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
