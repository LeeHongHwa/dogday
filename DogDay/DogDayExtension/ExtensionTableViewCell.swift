//
//  ExtensionTableViewCell.swift
//  DogDayExtension
//
//  Created by david on 2017. 12. 10..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class ExtensionTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var remainingDaysLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.contentMode = .scaleAspectFit
        
        endDateLabel.font = UIFont.main3_regular
        endDateLabel.textColor = UIColor.subTextBlackColor
        
        nameLabel.font = UIFont.main0_regular
        nameLabel.textColor = UIColor.mainTextBlackColor
        
        remainingDaysLabel.font = UIFont.title1_regular
        remainingDaysLabel.textColor = UIColor.mainTextBlackColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWith(name: String, endDate: String, remainingDay: String, dogDayType: DogDayType) {
        nameLabel.text = name
        endDateLabel.text = endDate
        remainingDaysLabel.text = remainingDay
        let visualData = dogDayType.visualData()
        self.iconImageView.image = visualData.image
    }
    
}
