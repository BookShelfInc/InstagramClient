//
//  BasePage.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/2/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class BasePage: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    func showAlertController(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
