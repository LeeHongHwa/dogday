//
//  ViewController.swift
//  DogDay
//
//  Created by david on 2017. 10. 7..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

protocol ViewControllerType: class {
}

class BaseViewController: UIViewController, ViewControllerType, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    // MARK: Initialize
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Deinit
    deinit {
         print("\(self) has deinitialized")
    }
}
