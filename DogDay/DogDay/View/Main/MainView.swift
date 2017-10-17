//
//  MainView.swift
//  DogDay
//
//  Created by david on 2017. 10. 14..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class MainView: BaseView<MainViewController> {
    
    let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
    
    override func setupUI() {
        //view controller
        vc.navigationItem.title = "Dog-Day"
        
        //tableview
        tableView.register(DogDayTableViewCell.self, forCellReuseIdentifier: DogDayTableViewCell.identifier)
//        tableView.separatorColor = UIColor.clear
        addSubview(tableView)
    }
    
    override func setupBinding() {
        //view controller
        let settingButton = UIButton(type: .custom)
        settingButton.setImage(#imageLiteral(resourceName: "test"), for: .normal)
        
        let addDayButton = UIButton(type: .custom)
        addDayButton.setImage(#imageLiteral(resourceName: "test"), for: .normal)
        
        vc.navigationItem.setRightBarButtonItems([UIBarButtonItem(customView:settingButton), UIBarButtonItem(customView:addDayButton)], animated: false)
        
        //table view
        tableView.delegate = vc
        tableView.dataSource = vc
    }
}
