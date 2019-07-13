//
//  MainView.swift
//  DogDay
//
//  Created by david on 2017. 10. 14..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class MainView: BaseView<MainViewController> {

    public let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
    
    override func setupUI() {
        //view controller
        vc.navigationItem.title = "DogDay"
        
        //tableview
        tableView.register(type: DogDayTableViewCell.self)
        tableView.separatorStyle = .none
        
        addSubview(tableView)
    }

    override func setupBinding() {
        //bar button
        vc.navigationItem.setBarButtonItem(buttonDatas: [(.add,  #selector(vc.addDayButtonDidTab(_:))),
                                                         (.setting, #selector(vc.settingButtonDidTab(_:)))],
                                           itemLocation: .right,
                                           target: vc)
        //table view
        tableView.delegate = vc
        tableView.dataSource = vc
    }
}
