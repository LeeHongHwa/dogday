//
//  SettingViewController.swift
//  DogDay
//
//  Created by david on 2017. 11. 5..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//
//
import UIKit
import SafariServices

class SettingViewController: BaseViewController {
    
    var settingDatas = DogDaySetting()
    lazy var v = SettingView(controlBy: self)
    
    override func loadView() {
        self.view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.showBackgroundColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//Action
extension SettingViewController {
    @objc func popButtonDidTab(_ sender:Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SettingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let url = URL(string: "https://www.naver.com")!
        let viewController = SFSafariViewController(url: url)
        self.present(viewController, animated: true, completion: nil)
    }
}

extension SettingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingDatas.allValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        let (title, description) = settingDatas.allValues[indexPath.row]
        cell.configureWith(title: title, description: description)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
}
