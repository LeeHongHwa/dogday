//
//  DetailView.swift
//  DogDay
//
//  Created by david on 2017. 10. 30..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class DetailView: BaseView<DetailViewController> {

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
    
    override func setupUI() {
        //view controller
        vc.navigationController?.setNavigationBarHidden(false, animated: false)
        vc.navigationController?.navigationBar.backgroundColor = UIColor.clear
        
        //base View
        let baseScrollView = UIScrollView()
        let contentsView = UIView()
        
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
        
        self.addSubview(baseScrollView)
        
        baseScrollView.backgroundColor = UIColor.white
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.clipsToBounds = true
        
        smallNowDayLabel.text = "2018.12.10 / 11:24am"
        smallNowDayLabel.textAlignment = .left
        smallNowDayLabel.font = UIFont.main3_regular
        smallNowDayLabel.textColor = UIColor.subTextWhiteColor
        
        titleLabel.text = "예뱡접종"
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.main0_regular
        titleLabel.textColor = UIColor.white
        
        shortRemainDayLabel.text = "D-100"
        shortRemainDayLabel.textAlignment = .right
        shortRemainDayLabel.font = UIFont.title1_medium
        shortRemainDayLabel.textColor = UIColor.white
        
        remainDayPercentageLabel.text = "10%"
        remainDayPercentageLabel.textAlignment = .left
        remainDayPercentageLabel.font = UIFont.title0_medium
        remainDayPercentageLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.45)
        
        remainDayPercentageBackgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        
        
        backgroundView.backgroundColor = UIColor(red: 128, green: 203, blue: 196)//
        iconImageView.image = #imageLiteral(resourceName: "detail_Vaccination")//
        
        // MARK: Constraints
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
            .heightAnchor(constant: CGFloat(408))
            .activateAnchors()
        
        iconImageView
            .topAnchor(to: backgroundView.topAnchor, constant: CGFloat(40))
            .leadingAnchor(to: backgroundView.leadingAnchor, constant: CGFloat(28))
            .dimensionAnchors(width: CGFloat(72), height: CGFloat(72))
            .activateAnchors()

        smallNowDayLabel
            .topAnchor(to: iconImageView.topAnchor)
            .leadingAnchor(to: iconImageView.trailingAnchor, constant: CGFloat(10))
            .trailingAnchor(to: backgroundView.trailingAnchor, constant: CGFloat(-28))
            .activateAnchors()

        titleLabel
            .topAnchor(to: smallNowDayLabel.bottomAnchor, constant: CGFloat(4))
            .leadingAnchor(to: smallNowDayLabel.leadingAnchor)
            .trailingAnchor(to: shortRemainDayLabel.leadingAnchor, constant: CGFloat(-10))
            .activateAnchors()

        shortRemainDayLabel
            .centerYAnchor(to: iconImageView.centerYAnchor)
            .trailingAnchor(to: backgroundView.trailingAnchor, constant: CGFloat(-28))
            .activateAnchors()

        nowDayLabel
            .topAnchor(to: iconImageView.bottomAnchor, constant: CGFloat(40))
            .leadingAnchor(to: iconImageView.leadingAnchor)
            .trailingAnchor(to: backgroundView.trailingAnchor, constant: CGFloat(-28))
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
        
    }
}
