//
//  MainViewController.swift
//  DogDay
//
//  Created by david on 2017. 10. 14..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    var dogDayDatas = DogDays.sharedInstance
    //CHCK: view로 변경
    let viewRatio = UIScreen.main.bounds.width/320.0
    lazy var v = MainView(controlBy: self)
    
    override func loadView() {
        self.view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if dogDayDatas.isEmpty {
            let navigationController = UINavigationController(rootViewController: EmptyViewController())
            self.present(navigationController, animated: false, completion: nil)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.showBackgroundColor()
        //CHECK: reloadTableView 모델에 변경이 있을경우에만 reload
        self.reloadTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func reloadTableView() {
        self.v.tableView.reloadData()
    }
}

//Action
extension MainViewController {
    @objc func addDayButtonDidTab(_ sender:Any) {
        let editViewController = EditViewController()
        self.navigationController?.pushViewController(editViewController, animated: true)
    }
    
    @objc func settingButtonDidTab(_ sender:Any) {
        self.navigationController?.pushViewController(SettingViewController(), animated: true)
    }
}

//UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(92) * viewRatio
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //CHECK: custom 사용하기
        let moreRowAction = UITableViewRowAction(style: .default, title: "편집") {[weak self] (rowAction, indexPath) in
            guard let `self` = self else { return }
            let editViewController = EditViewController()
            editViewController.dogDayData = self.dogDayDatas.items[indexPath.row]
            editViewController.dogDayDataIndex = indexPath.row
            self.navigationController?.pushViewController(editViewController, animated: true)
        }
        moreRowAction.backgroundColor = UIColor(red: 254, green: 59, blue: 47)
        
        let deleteRowAction = UITableViewRowAction(style: .default, title: "삭제") {[weak self] (rowAction, indexPath) in
            guard let `self` = self else { return }
            self.dogDayDatas.removeDogDayElement(at: indexPath.row)
            self.reloadTableView()
            if self.dogDayDatas.isEmpty {
                let navigationController = UINavigationController(rootViewController: EmptyViewController())
                self.present(navigationController, animated: true, completion: nil)
            }
        }
        deleteRowAction.backgroundColor = UIColor(red: 89, green: 89, blue: 211)
        
        return [moreRowAction, deleteRowAction];
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController(with: self.dogDayDatas.items[indexPath.row])
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogDayDatas.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DogDayTableViewCell.identifier, for: indexPath) as! DogDayTableViewCell
        let dogDayData = dogDayDatas.items[indexPath.row]
        
        cell.configureWith(name: dogDayData.title!, endDate: dogDayData.fullEndDateString, remainingDay: dogDayData.shortRemainDayString, dogDayType: dogDayData.dogDayType!)
        
        return cell
    }
}
