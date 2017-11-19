//
//  DetailView.swift
//  DogDay
//
//  Created by david on 2017. 10. 30..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class DetailView: BaseView<DetailViewController> {
    private let baseScrollView = UIScrollView()
    private let contentsView = UIView()
    let backgroundView = UIView()
    let iconImageView = UIImageView()
    let smallNowDayLabel = UILabel()
    let titleLabel = UILabel()
    let shortRemainDayLabel = UILabel()
    let nowDayLabel = DetailLabel()
    let remainDayLabel = DetailLabel()
    let endDayLabel = DetailLabel()
    let remainDayPercentageView = UIView()
    let remainDayPercentageBackgroundView = UIView()
    let remainDayPercentageLabel = UILabel()
    
    private struct UI {
        static let baseMargin = CGFloat(26)
        static let iconImageViewSize = CGSize(width: 72, height: 72)
    }
    
    override func setupUI() {
        baseScrollView.backgroundColor = UIColor.white
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.clipsToBounds = true
        
        smallNowDayLabel.textAlignment = .left
        smallNowDayLabel.font = UIFont.main3_regular
        smallNowDayLabel.textColor = UIColor.subTextWhiteColor
        
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.main0_regular
        titleLabel.textColor = UIColor.white
        
        shortRemainDayLabel.textAlignment = .right
        shortRemainDayLabel.font = UIFont.title1_medium
        shortRemainDayLabel.textColor = UIColor.white
        
        remainDayPercentageLabel.textAlignment = .left
        remainDayPercentageLabel.font = UIFont.title0_medium
        remainDayPercentageLabel.textColor = UIColor.subTextBlackColor
        
        remainDayPercentageBackgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        
        remainDayPercentageBackgroundView.addSubview(remainDayPercentageView)
        contentsView.addSubviews([backgroundView,
                                  iconImageView,
                                  smallNowDayLabel,
                                  titleLabel,
                                  shortRemainDayLabel,
                                  nowDayLabel,
                                  remainDayLabel,
                                  endDayLabel,
                                  remainDayPercentageLabel,
                                  remainDayPercentageBackgroundView])
        baseScrollView.addSubview(contentsView)
        addSubview(baseScrollView)
        setupConstraints()
    }
    
    func setupConstraints() {
        baseScrollView
            .topAnchor(to: self.topAnchor)
            .leadingAnchor(to: self.leadingAnchor)
            .trailingAnchor(to: self.trailingAnchor)
            .bottomAnchor(to: self.bottomAnchor)
            .activateAnchors()
        
        contentsView
            .topAnchor(to: baseScrollView.topAnchor)
            .leadingAnchor(to: baseScrollView.leadingAnchor)
            .trailingAnchor(to: baseScrollView.trailingAnchor)
            .bottomAnchor(to: baseScrollView.bottomAnchor)
            .equalWidthAnchor(to: baseScrollView.widthAnchor)
            .equalHeightAnchorContentsView(to: baseScrollView.heightAnchor)
            .activateAnchors()
        
        backgroundView
            .topAnchor(to: contentsView.topAnchor)
            .leadingAnchor(to: contentsView.leadingAnchor)
            .trailingAnchor(to: contentsView.trailingAnchor)
            .heightAnchor(constant: CGFloat(472))
            .activateAnchors()
        
        iconImageView
            .topAnchor(to: backgroundView.topAnchor, constant: CGFloat(104))
            .leadingAnchor(to: backgroundView.leadingAnchor, constant: UI.baseMargin)
            .dimensionAnchors(size: UI.iconImageViewSize)
            .activateAnchors()
        
        smallNowDayLabel
            .topAnchor(to: iconImageView.topAnchor)
            .leadingAnchor(to: iconImageView.trailingAnchor, constant: CGFloat(10))
            .trailingAnchor(to: backgroundView.trailingAnchor, constant: -UI.baseMargin)
            .activateAnchors()
        
        titleLabel
            .topAnchor(to: smallNowDayLabel.bottomAnchor, constant: CGFloat(4))
            .leadingAnchor(to: smallNowDayLabel.leadingAnchor)
            .trailingAnchor(to: shortRemainDayLabel.leadingAnchor, constant: CGFloat(-10))
            .activateAnchors()
        
        shortRemainDayLabel
            .centerYAnchor(to: iconImageView.centerYAnchor)
            .trailingAnchor(to: backgroundView.trailingAnchor, constant: -UI.baseMargin)
            .activateAnchors()
        
        nowDayLabel
            .topAnchor(to: iconImageView.bottomAnchor, constant: CGFloat(40))
            .leadingAnchor(to: iconImageView.leadingAnchor)
            .trailingAnchor(to: backgroundView.trailingAnchor, constant: -UI.baseMargin)
            .heightAnchor(constant: CGFloat(42))
            .activateAnchors()
        
        remainDayLabel
            .topAnchor(to: nowDayLabel.bottomAnchor, constant: CGFloat(24))
            .leadingAnchor(to: nowDayLabel.leadingAnchor)
            .trailingAnchor(to: nowDayLabel.trailingAnchor)
            .heightAnchor(constant: CGFloat(42))
            .activateAnchors()
        
        endDayLabel
            .topAnchor(to: remainDayLabel.bottomAnchor, constant: CGFloat(24))
            .leadingAnchor(to: nowDayLabel.leadingAnchor)
            .trailingAnchor(to: nowDayLabel.trailingAnchor)
            .heightAnchor(constant: CGFloat(42))
            .activateAnchors()
        
        remainDayPercentageLabel
            .topAnchor(to: backgroundView.bottomAnchor, constant: CGFloat(18))
            .leadingAnchor(to: endDayLabel.leadingAnchor)
            .trailingAnchor(to: endDayLabel.trailingAnchor)
            .activateAnchors()
        
        remainDayPercentageBackgroundView
            .topAnchor(to: remainDayPercentageLabel.bottomAnchor, constant: CGFloat(10))
            .leadingAnchor(to: remainDayPercentageLabel.leadingAnchor)
            .trailingAnchor(to: remainDayPercentageLabel.trailingAnchor)
            .heightAnchor(constant: CGFloat(10))
            .activateAnchors()
        
        remainDayPercentageView.frame = CGRect(x: 0, y: 0, width: 0, height: 10)
    }
    override func setupBinding() {
        vc.navigationItem.setBarButtonItem(buttonDatas: [(.backWhite, #selector(vc.popButtonDidTab(_:)))],
                                           itemLocation: .left,
                                           target: vc)
    }
    
    func configureWith(name: String,
                       endDate: String,
                       nowDay: String,
                       shortRemainDay: String,
                       detailRemainDay: String,
                       remainDayPercentage: Int,
                       dogDayType: DogDayType) {
        
        let nowDayString = DogDay.nowDateSting
        
        vc.navigationItem.title = name
        
        smallNowDayLabel.text = nowDayString
        
        titleLabel.text = name
        
        shortRemainDayLabel.text = shortRemainDay
        
        nowDayLabel.titleLabel.text = "Now"
        nowDayLabel.descriptionLabel.text = nowDayString
        
        remainDayLabel.titleLabel.text = "D-Day"
        remainDayLabel.descriptionLabel.text = detailRemainDay
        
        endDayLabel.titleLabel.text = "End"
        endDayLabel.descriptionLabel.text = endDate
        
        remainDayPercentageLabel.text =  "\(remainDayPercentage)%"

        let visualData = dogDayType.visualData()
        self.backgroundView.backgroundColor = visualData.color
        self.remainDayPercentageView.backgroundColor = visualData.color
        self.iconImageView.image = visualData.image
        
        let remainDayPercentageViewWidth = (UIScreen.main.bounds.size.width - CGFloat((UI.baseMargin * 2))) * (CGFloat(remainDayPercentage) / 100.0)
        UIView.animate(withDuration: 1) {
            self.remainDayPercentageView.frame = CGRect(x: 0, y: 0, width: remainDayPercentageViewWidth, height: 10)
        }
    }
}
