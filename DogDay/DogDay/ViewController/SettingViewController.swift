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
    
    let dogDaySettings = DogDaySettings().settings
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
        
        let dogDaySetting = dogDaySettings[indexPath.row]
        
        if dogDaySetting.isContainDetailInfo {
            guard let urlString = dogDaySetting.url, let url = URL(string: urlString) else {
                guard let licenseDatas = dogDaySetting.detail else { return }
                self.navigationController?.pushViewController(LicenseListViewController(with: licenseDatas), animated: true)
                return
            }
            self.present(SFSafariViewController(url: url), animated: true, completion: nil)
            
        } else {
            return
        }
    }
}

extension SettingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogDaySettings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        let dogDaySetting = dogDaySettings[indexPath.row]
        
        let title = dogDaySetting.title
        let description = dogDaySetting.description ?? ""
        
        cell.configureWith(title: title,
                           description: description,
                           detail: dogDaySetting.isContainDetailInfo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
}
