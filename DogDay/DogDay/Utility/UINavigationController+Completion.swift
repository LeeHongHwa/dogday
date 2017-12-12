//
//  UINavigationController+Completion.swift
//  DogDay
//
//  Created by david on 2017. 12. 12..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func popToRootViewController(animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popToRootViewController(animated: flag)
        CATransaction.commit()
    }
    
}
