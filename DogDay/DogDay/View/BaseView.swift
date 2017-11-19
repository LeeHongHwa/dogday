//
//  BaseView.swift
//  DogDay
//
//  Created by david on 2017. 10. 14..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

protocol ViewType: class {
    associatedtype ViewController: ViewControllerType
    weak var vc: ViewController! { get }
    init(controlBy viewController: ViewController)
}

class BaseView<ViewController: ViewControllerType>: UIView, ViewType {
    
    // MARK: Properties
    
    weak var vc: ViewController!
    
    // MARK: Initialize
    
    required init(controlBy viewController: ViewController) {
        vc = viewController
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = UIColor.backgroundColor
        setupUI()
        setupBinding()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        // Override
    }
    
    func setupBinding() {
        // Override
    }
    
    // MARK: Deinit
    
    deinit {
         print("\(self) has deinitialized")
    }
}
