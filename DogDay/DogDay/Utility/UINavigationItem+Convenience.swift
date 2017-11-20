//
//  UINavigationItem+Convenience.swift
//  DogDay
//
//  Created by david on 2017. 11. 15..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

enum BarButtonType {
    case backWhite
    case backBlack
    case register
    case setting
    case add
}

enum BarButtonItemLocation {
    case left
    case right
}

extension UINavigationItem {
 
    private var barButtonDimension: CGFloat {
        return 30.0
    }
 
    typealias ButtonData = (buttonType: BarButtonType, buttonAction: Selector)
    
    func setBarButtonItem(buttonDatas datas:[ButtonData],
                          itemLocation location: BarButtonItemLocation,
                          target: AnyObject,
                          completion: ((_ barButtons: [UIBarButtonItem]) -> Void)? = nil) {
        
        var barButtonItems: [UIBarButtonItem] = []
        for data in datas {
            let barButton = UIButton(type: .custom)
            barButton.frame = CGRect(x: 0, y: 0, width: barButtonDimension, height: barButtonDimension)
            
            switch data.buttonType {
            case .backWhite:
                barButton.setImage(#imageLiteral(resourceName: "add_back"), for: .normal)
            case .backBlack:
                barButton.setImage(#imageLiteral(resourceName: "setting_back"), for: .normal)
                barButton.setImage(#imageLiteral(resourceName: "setting_back_highlighted"), for: .highlighted)
            case .register:
                barButton.setImage(#imageLiteral(resourceName: "add_check"), for: .normal)
            case .setting:
                barButton.setImage(#imageLiteral(resourceName: "main_setting"), for: .normal)
                barButton.setImage(#imageLiteral(resourceName: "main_setting_highlighted"), for: .highlighted)
            case .add:
                barButton.setImage(#imageLiteral(resourceName: "main_plus"), for: .normal)
                barButton.setImage(#imageLiteral(resourceName: "main_plus_highlighted"), for: .highlighted)
            }
            switch location {
            case .left:
                barButton.contentHorizontalAlignment = .left
            case .right:
                barButton.contentHorizontalAlignment = .right
            }
            
            barButton.addTarget(target, action: data.buttonAction, for: .touchUpInside)
            
            let barButtonItem = UIBarButtonItem(customView: barButton)
            barButtonItems.append(barButtonItem)
            
            if let completion = completion {
                completion(barButtonItems)
            }
        }
        
        switch location {
        case .left:
            setLeftBarButtonItems(barButtonItems, animated: false)
        case .right:
            setRightBarButtonItems(barButtonItems, animated: false)
        }
    }
}
