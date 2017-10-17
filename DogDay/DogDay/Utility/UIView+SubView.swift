//
//  UIView+SubView.swift
//  DogDay
//
//  Created by david on 2017. 10. 15..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}
