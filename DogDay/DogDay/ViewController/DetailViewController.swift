//
//  DetailViewController.swift
//  DogDay
//
//  Created by david on 2017. 10. 26..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    
    lazy var v = DetailView(controlBy: self)
    
    override func loadView() {
        self.view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
