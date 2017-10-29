//
//  EmptyMainView.swift
//  DogDay
//
//  Created by david on 2017. 10. 22..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class EmptyMainView: BaseView<MainViewController> {
//
//    let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
//
//    override func setupUI() {
//        //view controller
//        vc.navigationItem.title = "Dog-Day"
//
//        //tableview
//        tableView.register(DogDayTableViewCell.self, forCellReuseIdentifier: DogDayTableViewCell.identifier)
//        //        tableView.separatorColor = UIColor.clear
//
//        //데이터 피커 편집쪽에 옮겨야한다.
//        dateTextField.backgroundColor = UIColor.green
//        //        datePicker.datePickerMode = .date
//        datePicker.datePickerMode = .time
//        dateTextField.inputView = datePicker
//
//        // ToolBar
//        let toolBar = UIToolbar()
//        toolBar.barStyle = .default
//        toolBar.isTranslucent = true
//        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
//        toolBar.sizeToFit()
//
//        // Adding Button ToolBar
//        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: vc, action: #selector(vc.doneButtonDidTab))
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: vc, action: #selector(vc.cnacelButtonDidTab))
//        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
//        dateTextField.inputAccessoryView = toolBar
//
//        addSubviews([tableView, dateTextField])
//    }
//
//    override func setupBinding() {
//        //view controller
//        let settingButton = UIButton(type: .custom)
//        settingButton.setImage(#imageLiteral(resourceName: "test"), for: .normal)
//
//        let addDayButton = UIButton(type: .custom)
//        addDayButton.setImage(#imageLiteral(resourceName: "test"), for: .normal)
//        addDayButton.addTarget(vc, action: #selector(vc.addDayButtonDidTap(_:)), for: .touchUpInside)
//
//        vc.navigationItem.setRightBarButtonItems([UIBarButtonItem(customView:settingButton), UIBarButtonItem(customView:addDayButton)], animated: false)
//
//        datePicker.addTarget(vc, action: #selector(vc.datePickerDidChange(_:)), for: .valueChanged)
//
//        //table view
//        tableView.delegate = vc
//        tableView.dataSource = vc
//    }
}
