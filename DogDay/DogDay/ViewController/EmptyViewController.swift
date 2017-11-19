//
//  EmptyViewController.swift
//  DogDay
//
//  Created by david on 2017. 11. 9..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class EmptyViewController: BaseViewController {
    
    lazy var v = EmptyView(controlBy: self)
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func loadView() {
        self.view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//Action
extension EmptyViewController {
    @objc func addDayButtonDidTab(_ sender:Any) {
        let editViewController = EditViewController()
        self.navigationController?.pushViewController(editViewController, animated: true)
    }
}
