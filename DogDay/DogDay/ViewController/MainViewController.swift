//
//  MainViewController.swift
//  DogDay
//
//  Created by david on 2017. 10. 14..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import SwipeCellKit

class MainViewController: BaseViewController {
    
    var dogDayDatas = DogDays.sharedInstance {
        didSet {
            if oldValue.items.count <= dogDayDatas.items.count {
                self.reloadTableView()
            }
        }
    }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
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
        cell.delegate = self
        return cell
    }
}

extension MainViewController: SwipeTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        let moreRowAction = SwipeAction(style: .default, title: "편집") {[weak self] action, indexPath in
            guard let `self` = self else { return }
            let editViewController = EditViewController()
            editViewController.dogDayData = self.dogDayDatas.items[indexPath.row]
            editViewController.dogDayDataIndex = indexPath.row
            self.navigationController?.pushViewController(editViewController, animated: true)
        }
        
        moreRowAction.backgroundColor = UIColor(red: 89, green: 89, blue: 211)
        
    
        let deleteAction = SwipeAction(style: .destructive, title: "삭제") {[weak self] action, indexPath in
            guard let `self` = self else { return }
            self.dogDayDatas.removeDogDayElement(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            if self.dogDayDatas.isEmpty {
                let navigationController = UINavigationController(rootViewController: EmptyViewController())
                self.present(navigationController, animated: true, completion: nil)
            }
        }
        deleteAction.backgroundColor = UIColor(red: 254, green: 59, blue: 47)
        
        return [deleteAction, moreRowAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
        var options = SwipeTableOptions()
        options.expansionStyle = .destructive(automaticallyDelete: false)
        options.transitionStyle = .border
        return options
    }
}
