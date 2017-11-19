//
//  SettingTableViewCell.swift
//  DogDay
//
//  Created by david on 2017. 11. 16..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: SettingTableViewCell.self)
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
    }
    
    func configureWith(title: String, description: String) {
        self.textLabel?.text = title
        self.detailTextLabel?.text = description
    }
}
