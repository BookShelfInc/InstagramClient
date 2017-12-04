//
//  CountIndicatorVIew.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/3/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

protocol CountIndicatorDelegate: class {
    func didTap()
}

class CountIndicatorView: UIView {
    let countLabel = UILabel()
    let titleLabel = UILabel()
    
    private let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
    
    weak var delegate: CountIndicatorDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addGestureRecognizer(tapGesture)
        
        addSubview(countLabel)
        addSubview(titleLabel)
        
        addConstraints()
    }
    
    func setValues(title: String, count: Int){
        titleLabel.text = title
        countLabel.text = String(count)
    }
    
    private func addConstraints() {
        countLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(2)
            make.centerX.equalTo(titleLabel)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(countLabel.snp.bottom)
            make.bottom.equalToSuperview().offset(2)
        }
    }
    
    @objc func tapped(){
        print("Tapped")
        delegate?.didTap()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
