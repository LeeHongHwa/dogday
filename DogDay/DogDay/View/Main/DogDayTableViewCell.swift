//
//  DogDayTableViewCell.swift
//  DogDay
//
//  Created by david on 2017. 10. 15..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import SwipeCellKit

class DogDayTableViewCell: SwipeTableViewCell {
    
    static let identifier = String(describing: DogDayTableViewCell.self)
    
    private let endDateLabel = UILabel()
    private let remainingDaysLabel = UILabel()
    private let nameLabel = UILabel()
    private let iconImageView = UIImageView()
    private let highlightView = UIView()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    private struct UI {
        static let baseMargin = CGFloat(26)
        static let imageSize = CGSize(width: 48, height: 48)
    }
    
    private func setupUI() {
        self.selectionStyle = .none
        
        iconImageView.contentMode = .scaleAspectFit
        
        endDateLabel.font = UIFont.main3_regular
        endDateLabel.textColor = UIColor.subTextWhiteColor
        endDateLabel.textAlignment = .left
        
        nameLabel.font = UIFont.main0_regular
        nameLabel.textColor = UIColor.white
        nameLabel.textAlignment = .left
        
        remainingDaysLabel.font = UIFont.title1_regular
        remainingDaysLabel.textColor = UIColor.white
        remainingDaysLabel.textAlignment = .right
        
        highlightView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        highlightView.isHidden = true
        
        contentView.addSubviews([endDateLabel, remainingDaysLabel, nameLabel, iconImageView, highlightView])
        setupConstraints()
    }
    
    private func setupConstraints() {
        iconImageView
            .centerYAnchor(to: contentView.centerYAnchor)
            .leadingAnchor(to: contentView.leadingAnchor, constant: UI.baseMargin)
            .dimensionAnchors(size: UI.imageSize)
            .activateAnchors()
        
        endDateLabel
            .topAnchor(to: iconImageView.topAnchor)
            .leadingAnchor(to: iconImageView.trailingAnchor, constant: CGFloat(10))
            .activateAnchors()
        endDateLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        nameLabel
            .topAnchor(to: endDateLabel.bottomAnchor, constant: CGFloat(4))
            .leadingAnchor(to: endDateLabel.leadingAnchor)
            .trailingAnchor(to: endDateLabel.trailingAnchor)
            .activateAnchors()
        
        remainingDaysLabel
            .centerYAnchor(to: contentView.centerYAnchor)
            .trailingAnchor(to: contentView.trailingAnchor, constant: CGFloat(-26))
            .activateAnchors()
        
        highlightView
            .topAnchor(to: contentView.topAnchor)
            .bottomAnchor(to: contentView.bottomAnchor)
            .trailingAnchor(to: contentView.trailingAnchor)
            .leadingAnchor(to: contentView.leadingAnchor)
            .activateAnchors()
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            highlightView.isHidden = false
        }
        else {
            highlightView.isHidden = true
        }
    }
    
    func configureWith(name: String, endDate: String, remainingDay: String, dogDayType: DogDayType) {
        nameLabel.text = name
        endDateLabel.text = endDate
        remainingDaysLabel.text = remainingDay

        let visualData = dogDayType.visualData()
        self.backgroundColor = visualData.color
        self.iconImageView.image = visualData.image
    }
}
