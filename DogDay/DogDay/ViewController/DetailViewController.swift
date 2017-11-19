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
    let dogDayModel: DogDay
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    required init(with model:DogDay) {
        dogDayModel = model
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
        self.automaticallyAdjustsScrollViewInsets = false
        self.setNeedsStatusBarAppearanceUpdate()
        self.v.configureWith(name: dogDayModel.title!,
                             endDate: dogDayModel.fullEndDateString,
                             nowDay: DogDay.nowDateSting,
                             shortRemainDay: dogDayModel.shortRemainDayString,
                             detailRemainDay: dogDayModel.detailRemainDayString,
                             remainDayPercentage: dogDayModel.remainDayPercentage,
                             dogDayType: dogDayModel.dogDayType!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.clearBackgroundColor()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

//Action
extension DetailViewController {
    @objc func popButtonDidTab(_ sender:Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
