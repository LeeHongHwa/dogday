//
//  MainView.swift
//  DogDay
//
//  Created by david on 2017. 10. 14..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class MainView: BaseView<MainViewController> {

    private let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
    private let settingButton = UIButton(type: .custom)
    private let addDayButton = UIButton(type: .custom)
    
    override func setupUI() {
        //view controller
        vc.navigationController?.setNavigationBarHidden(false, animated: false)
        vc.navigationItem.title = "DogDay"
        settingButton.setImage(#imageLiteral(resourceName: "main_setting"), for: .normal)
        addDayButton.setImage(#imageLiteral(resourceName: "main_plus"), for: .normal)
        
        //tableview
        tableView.register(DogDayTableViewCell.self, forCellReuseIdentifier: DogDayTableViewCell.identifier)
        tableView.separatorColor = UIColor.clear
        
        addSubview(tableView)
    }

    override func setupBinding() {
        //bar button
        settingButton.addTarget(vc, action: #selector(vc.settingButtonDidTab(_:)), for: .touchUpInside)
        addDayButton.addTarget(vc, action: #selector(vc.addDayButtonDidTab(_:)), for: .touchUpInside)
        vc.navigationItem.setRightBarButtonItems([UIBarButtonItem(customView:settingButton), UIBarButtonItem(customView:addDayButton)], animated: false)

        //table view
        tableView.delegate = vc
        tableView.dataSource = vc
    }
}

