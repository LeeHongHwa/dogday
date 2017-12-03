//
//  LauchScreenViewController.swift
//  DogDay
//
//  Created by david on 2017. 11. 29..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overCurrentContext
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var viewFromNib: UIView {
        guard let view = Bundle.main.loadNibNamed("LaunchScreen", owner: nil, options: nil)?.first as? UIView else { return UIView() }
        return view
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func loadView() {
        self.view = self.viewFromNib
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        LaunchScreenView.dismiss()
        UIView.animate(withDuration: 1,
                       delay: 1,
                       options: .curveEaseInOut,
                       animations: {
                        self.view.alpha = 0
        }) { _ in
            self.dismiss(animated: false, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
