//
//  UINavigationController+Color.swift
//  DogDay
//
//  Created by david on 2017. 11. 5..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    public func clearBackgroundColor() {
        self.setNavigationBarHidden(false, animated: false)
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationBar.setBackgroundColor(UIColor.clear)
    }
    
    public func showBackgroundColor() {
        self.setNavigationBarHidden(false, animated: false)
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)]
        self.navigationBar.setBackgroundColor(UIColor.white)
    }
    
    override open var childViewControllerForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
}

extension UINavigationBar {
    
    struct AssociatedKeys {
        static var backgroundView: UInt8 = 0
    }
    
    private var backgroundView: UIView? {
        get {
            guard let backgroundView = objc_getAssociatedObject(self,
                                                       &AssociatedKeys.backgroundView) as? UIView else {
                return nil
            }
            return backgroundView
        }
        set {
            objc_setAssociatedObject(self,
                                     &AssociatedKeys.backgroundView,
                                     newValue,
                                     objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public func setBackgroundColor(_ color: UIColor) {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        guard let backgroundView = self.backgroundView else {
            let tempBackgroundView = UIView()
            self.subviews.first?.insertSubview(tempBackgroundView, at: 0)
            tempBackgroundView.backgroundColor = color
            tempBackgroundView
                .trailingAnchor(to: self.trailingAnchor)
                .leadingAnchor(to: self.leadingAnchor)
                .topAnchor(to: self.topAnchor, constant: -UIApplication.shared.statusBarFrame.size.height)
                .bottomAnchor(to: self.bottomAnchor)
                .activateAnchors()
            self.backgroundView = tempBackgroundView
            return
        }
        backgroundView.backgroundColor = color
    }
}
