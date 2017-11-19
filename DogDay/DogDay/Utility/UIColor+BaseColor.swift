//
//  UIColor+BaseColor.swift
//  DogDay
//
//  Created by david on 2017. 10. 15..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit
extension UIColor {
    func toImage(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(self.cgColor)
            context.fill(rect)
            if let image = UIGraphicsGetImageFromCurrentImageContext() {
                UIGraphicsEndImageContext()
                return image
            }
        }
        return UIImage()
    }
}

extension UIColor: HighlightedColor{
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        assert(alpha >= 0 && alpha <= 1.0, "Invalid alpha component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
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
    
    static var emptyBackgroundColor: UIColor {
        return UIColor.init(red: 121, green: 134, blue: 203)
    }
    
    static var emptyAddButtonColor: UIColor {
        return UIColor.init(red: 250, green: 42, blue: 106)
    }
    
    static var textFieldBackGroundColor: UIColor {
        return UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.03)
    }
    
    static var textFieldPlaceHolderColor: UIColor {
        return UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.20)
    }
    
    static var textFieldPlaceTextColor: UIColor {
        return UIColor.init(red: 255, green: 255, blue: 255)
    }
    
    static var subTextBlackColor: UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.45)
    }
    
    static var subTextWhiteColor: UIColor {
        return UIColor.init(red: 255, green: 255, blue: 255, alpha: 0.56)
    }
    
    static var heartWorm: UIColor {
        return UIColor(red: 248, green: 143, blue: 179)
    }
    
    static var pill: UIColor {
        return UIColor(red: 128, green: 203, blue: 196)
    }
    
    static var heart: UIColor {
        return UIColor(red: 255, green: 166, blue: 166)
    }
    
    static var vaccination: UIColor {
        return UIColor(red: 123, green: 197, blue: 216)
    }
    
    static var beauty: UIColor {
        return UIColor(red: 79, green: 195, blue: 247)
    }
}

protocol HighlightedColor {
    static func lighterColor(currentColor color:UIColor) -> UIColor?
    static func darkerColor(currentColor color:UIColor) -> UIColor?
}

extension HighlightedColor {
    static func lighterColor(currentColor color:UIColor) -> UIColor? {
        var red = CGFloat(), green = CGFloat(), blue = CGFloat(), alpha = CGFloat()
        if color.getRed(&red, green: &green, blue: &blue, alpha: &alpha) == true {
            return UIColor(red: min(red + 0.2, 1.0), green: min(green + 0.2, 1.0), blue: min(blue + 0.2, 1.0), alpha: alpha)
        } else {
            return nil
        }
    }
    
    static func darkerColor(currentColor color:UIColor) -> UIColor? {
        var red = CGFloat(), green = CGFloat(), blue = CGFloat(), alpha = CGFloat()
        if color.getRed(&red, green: &green, blue: &blue, alpha: &alpha) == true {
            return UIColor(red: max(red - 0.2, 0.0), green: max(green - 0.2, 0.0), blue: max(blue - 0.2, 0.0), alpha: alpha)
        } else {
            return nil
        }
    }
}
