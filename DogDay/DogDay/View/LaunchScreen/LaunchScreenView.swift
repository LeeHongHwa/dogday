//
//  LaunchScreenView.swift
//  DogDay
//
//  Created by david on 2017. 12. 2..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class LaunchScreenView: UIView {
    
    private static let instance = LaunchScreenView.viewFromNib
    
    private static var viewFromNib: UIView {
        guard let view = Bundle.main.loadNibNamed("LaunchScreen", owner: nil, options: nil)?.first as? UIView else { return UIView() }
        view.frame = UIScreen.main.bounds
        return view
    }
    
    public static func show() {
        UIApplication.shared.keyWindow?.addSubview(self.instance)
    }
    
    public static func dismiss() {
        self.instance.removeFromSuperview()
    }
}
