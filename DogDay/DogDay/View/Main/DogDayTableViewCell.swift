//
//  DogDayTableViewCell.swift
//  DogDay
//
//  Created by david on 2017. 10. 15..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class DogDayTableViewCell: UITableViewCell {
    
    private let deadlineDateLabel = UILabel()
    private let remainingDaysLabel = UILabel()
    private let nameLabel = UILabel()
    private let iconImageView = UIImageView(image: #imageLiteral(resourceName: "test"))
    
    static let identifier = String(describing: DogDayTableViewCell.self)
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    // UI Metrics
    private struct UI {
        static let baseMargin = CGFloat(16)
        static let imageSize = CGSize(width: 15, height: 15)
        static let countLabelSize = CGSize(width: 50, height: UI.imageSize.height)
    }
    
    private func setupUI() {
        deadlineDateLabel.font = .preferredFont(forTextStyle: .caption1)
        deadlineDateLabel.text = "2017.1.1"
        nameLabel.font = .preferredFont(forTextStyle: .headline)
        nameLabel.text = "약"
        remainingDaysLabel.font = .preferredFont(forTextStyle: .caption1)
        remainingDaysLabel.text = "D-75"
        contentView.addSubviews([deadlineDateLabel, remainingDaysLabel, nameLabel, iconImageView])
    }
    
    private func setupConstraints() {
        deadlineDateLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(UI.baseMargin)
            make.leading.equalTo(contentView.snp.leading).offset(UI.baseMargin)
        }
        
        remainingDaysLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(UI.baseMargin)
            make.trailing.equalTo(contentView.snp.trailing).inset(UI.baseMargin)
        }
        
        nameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(deadlineDateLabel.snp.bottom).offset(UI.baseMargin)
            make.leading.equalTo(deadlineDateLabel.snp.leading).offset(0)
        }
        
        iconImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(deadlineDateLabel.snp.bottom).offset(UI.baseMargin)
            make.trailing.equalTo(remainingDaysLabel.snp.trailing).offset(0)
        }
        
    }
}
