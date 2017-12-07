//
//  UploadImagePage.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/3/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class UploadImagePage: BasePage {
    let testLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(testLabel)
        testLabel.text = "UploadImagePage"
        testLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
}
