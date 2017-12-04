//
//  LicenseListViewController.swift
//  DogDay
//
//  Created by david on 2017. 12. 4..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit
import SafariServices

class LicenseListViewController: SettingViewController {
    
    let licenseDatas: [DogDaySetting.Licence]
    
    init(with licenseDatas: [DogDaySetting.Licence]) {
        self.licenseDatas = licenseDatas
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "라이센스"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.showBackgroundColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension LicenseListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let licenseData = licenseDatas[indexPath.row]
        guard let urlString = licenseData.url, let url = URL(string: urlString) else {
            self.navigationController?.pushViewController(LicenseViewController(with: licenseData), animated: true)
            return
        }
        self.present(SFSafariViewController(url: url), animated: true, completion: nil)
    }
}

extension LicenseListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return licenseDatas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        let licenseData = licenseDatas[indexPath.row]
        
        let title = licenseData.title
        let description = ""
        
        cell.configureWith(title: title,
                           description: description,
                           detail: true)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
}
