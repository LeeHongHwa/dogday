//
//  DetailLabel.swift
//  DogDay
//
//  Created by david on 2017. 11. 1..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class DetailLabel: UIView {
    
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = UIColor.textFieldBackGroundColor
        self.addSubviews([titleLabel, descriptionLabel])
        
        self.titleLabel.text = "title"
        self.titleLabel.font = UIFont.main0_regular
        self.titleLabel.textColor = UIColor.textFieldPlaceHolderColor
        self.descriptionLabel.textAlignment = .left
        
        self.descriptionLabel.text = "description"
        self.descriptionLabel.font = UIFont.main0_regular
        self.descriptionLabel.textColor = UIColor.white
        self.descriptionLabel.textAlignment = .right
    }
    
    private func setupConstraints() {
        self.titleLabel
            .centerXAnchor(to: self.centerXAnchor)
            .centerYAnchor(to: self.centerYAnchor)
            .leadingAnchor(to: self.leadingAnchor, constant: CGFloat(10))
            .activateAnchors()
        
        self.descriptionLabel
            .centerXAnchor(to: self.centerXAnchor)
            .centerYAnchor(to: self.centerYAnchor)
            .leadingAnchor(to: self.titleLabel.trailingAnchor, constant: CGFloat(10))
            .trailingAnchor(to: self.trailingAnchor, constant: CGFloat(-10))
            .activateAnchors()
    }
    
    public func configureLabelText(title: String, description: String) {
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
