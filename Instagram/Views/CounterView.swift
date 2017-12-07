//
//  CounterView.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/6/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class CounterView: UIView {
    let numberOfCounter = UILabel()
    let titleOfCounter = UILabel()
    
    init(number: Int, title: String) {
        super.init(frame: CGRect.zero)
        
        numberOfCounter.text = String(number)
        titleOfCounter.text = title
        
        configureSubviews()
        
        addSubview(numberOfCounter)
        addSubview(titleOfCounter)
        
        addSubviewConstraints()
    }
    
    private func addSubviewConstraints(){
        numberOfCounter.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(3)
            make.centerX.equalToSuperview()
        }
        
        titleOfCounter.snp.makeConstraints { (make) in
            make.top.equalTo(numberOfCounter.snp.bottom).offset(2)
            //make.leading.equalToSuperview().offset(3)
            make.centerX.equalTo(numberOfCounter)
            //make.trailing.equalToSuperview().offset(-3)
            make.bottom.equalToSuperview().offset(-2)
        }
    }
    
    private func configureSubviews(){
        titleOfCounter.font = titleOfCounter.font.withSize(10)
        titleOfCounter.textColor = .lightGray
        titleOfCounter.adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
