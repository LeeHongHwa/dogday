//
//  SettingTableViewCell.swift
//  DogDay
//
//  Created by david on 2017. 11. 16..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    func configureWith(title: String, description: String, detail: Bool) {
        self.textLabel?.text = title
        self.detailTextLabel?.text = description
        self.isUserInteractionEnabled = detail
        if detail {
            self.accessoryType = .disclosureIndicator
        } else {
            self.accessoryType = .none
        }
    }
}
