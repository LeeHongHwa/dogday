//
//  SettingView.swift
//  DogDay
//
//  Created by david on 2017. 11. 16..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class SettingView: BaseView<SettingViewController> {
    
    public let tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
    
    private struct UI {
        static let cellHeight = CGFloat(44)
    }
    
    override func setupUI() {
        //view controller
        vc.navigationItem.title = "설정"
        
        //tableview
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        tableView.rowHeight = UI.cellHeight
        tableView.sectionHeaderHeight = UI.cellHeight
        addSubview(tableView)
    }
    
    override func setupBinding() {
        //bar button
        vc.navigationItem.setBarButtonItem(buttonDatas: [(.backBlack, #selector(vc.popButtonDidTab(_:)))],
                                           itemLocation: .left,
                                           target: vc)
        //table view
        tableView.delegate = vc
        tableView.dataSource = vc
    }
}
