//
//  UIColor+BaseColor.swift
//  DogDay
//
//  Created by david on 2017. 10. 15..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    static var mainColor: UIColor {
        return UIColor.init(red: 0, green: 0, blue: 10)
    }
    
    static var backgroundColor: UIColor {
        return UIColor.init(red: 2, green: 2, blue: 2)
    }
}
