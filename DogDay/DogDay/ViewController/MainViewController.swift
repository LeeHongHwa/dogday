//
//  MainViewController.swift
//  DogDay
//
//  Created by david on 2017. 10. 14..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    var dogDayDatas = DogDays.decode()
    var v: UIView!
    
    override func loadView() {
        
        if dogDayDatas.isEmpty {
            v = EmptyMainView(controlBy: self)
        } else {
            v = MainView(controlBy: self)
        }
        self.view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func addDayButtonDidTab(_ sender:Any) {
        let editViewController = EditViewController()
        self.navigationController?.pushViewController(editViewController, animated: true)
    }
    
    @objc func settingButtonDidTab(_ sender:Any) {
        let settingViewController = SettingViewController(nibName: "SettingViewController", bundle: nil)
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let moreRowAction = UITableViewRowAction(style: .default, title: "편집") { (rowAction, indexPath) in
            
        }
        moreRowAction.backgroundColor = UIColor.green
        let deleteRowAction = UITableViewRowAction(style: .default, title: "삭제") { (rowAction, indexPath) in
            
        }
        
        return [deleteRowAction, moreRowAction];
    }
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DogDayTableViewCell.identifier, for: indexPath)
        return cell
    }
}
