//
//  EmptyMainView.swift
//  DogDay
//
//  Created by david on 2017. 10. 22..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class EmptyView: BaseView<EmptyViewController> {

    private let titleLabel = UILabel()
    private let mainLabel = UILabel()
    private let addDayButton = HHOButton(type: .custom)
    
    private struct UI {
        static let addDayButtonSize = CGSize(width: 116, height: 46)
    }
    
    override func setupUI() {
        //root view
        backgroundColor = UIColor.emptyBackgroundColor
        
        //label
        titleLabel.attributedText = UIFont.title2Text("반려견의 일정을\n등록해 보세요!")
        titleLabel.font = UIFont.title2
        titleLabel.textColor = UIColor.white
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        mainLabel.attributedText = UIFont.main1Text("효율적인 일정 관리\n쉬운 일정 등록\n위젯 설정으로 스케줄 관리까지")
        mainLabel.font = UIFont.main1
        mainLabel.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
        mainLabel.numberOfLines = 0
        mainLabel.textAlignment = .center
        
        //button
        addDayButton.setTitle("등록하기", for: .normal)
        addDayButton.setTitleColor(UIColor.emptyAddButtonColor, for: .normal)
        addDayButton.setTitleColor(UIColor.darkerColor(currentColor: UIColor.emptyAddButtonColor), for: .highlighted)
        addDayButton.titleLabel?.textAlignment = .center
        addDayButton.titleLabel?.font = UIFont.main0_medium
        addDayButton.setImage(#imageLiteral(resourceName: "add_day_btn"), for: .normal)
        
        addDayButton.defaultBackgroundColor = UIColor.white
        addDayButton.highlightedBackgroundColor = UIColor.darkerColor(currentColor: UIColor.white)
        addDayButton.backgroundColor = addDayButton.defaultBackgroundColor
        
        addDayButton.layer.cornerRadius = 9.0
        addDayButton.layer.shadowColor = UIColor.black.cgColor
        addDayButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        addDayButton.layer.shadowOpacity = 0.14;
        addDayButton.layer.shadowRadius = 4.0;
        
        addSubviews([titleLabel, mainLabel, addDayButton])
        setupConstraints()
    }

    func setupConstraints() {
        titleLabel
            .topAnchor(to: self.topAnchor, constant: CGFloat(163))
            .centerXAnchor(to: self.centerXAnchor)
            .activateAnchors()
        
        mainLabel
            .topAnchor(to: titleLabel.bottomAnchor, constant: CGFloat(18))
            .centerXAnchor(to: self.centerXAnchor)
            .activateAnchors()
        
        addDayButton
            .topAnchor(to: mainLabel.bottomAnchor, constant: CGFloat(52))
            .widthAnchor(constant: UI.addDayButtonSize.width)
            .heightAnchor(constant: UI.addDayButtonSize.height)
            .centerXAnchor(to: self.centerXAnchor)
            .activateAnchors()
    }
    
    override func setupBinding() {
        addDayButton.addTarget(vc, action: #selector(vc.addDayButtonDidTab(_:)), for: .touchUpInside)
    }
}
