//
//  LicenseViewController.swift
//  DogDay
//
//  Created by david on 2017. 12. 3..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class LicenseViewController: UIViewController {
    let licenseData: DogDaySetting.Licence
    
    @IBOutlet weak var detailLabel: UILabel!
    
    
    init(with licenseDatas: DogDaySetting.Licence) {
        licenseData = licenseDatas
        super.init(nibName: "LicenseViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //bar button
        self.navigationItem.setBarButtonItem(buttonDatas: [(.backBlack,  #selector(popButtonDidTab(_:)))],
                                           itemLocation: .left,
                                           target: self)
        
        self.title = licenseData.title
        detailLabel.text = licenseData.description
        detailLabel.font = UIFont.main0_regular
        detailLabel.textColor = UIColor.mainTextBlackColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func popButtonDidTab(_ sender:Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
