//
//  UIFont+BaseFont.swift
//  DogDay
//
//  Created by david on 2017. 10. 15..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//
//m17,r12,r16,m24,r16,r16,m46

import UIKit

extension UIFont {
    static var ratio: CGFloat {
        return UIScreen.main.bounds.width/320.0
    }
    
    static var title0_medium: UIFont {
        return UIFont.systemFont(ofSize: 46.0, weight: .medium)
    }
    
    static var title1_medium: UIFont {
        return UIFont.systemFont(ofSize: 24.0, weight: .medium)
    }
    
    static var title1_regular: UIFont {
        return UIFont.systemFont(ofSize: 24.0, weight: .regular)
    }
    
    static var title2: UIFont {
        return UIFont.systemFont(ofSize: 22.359375 * ratio)
    }
    
    static var main0_regular: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .regular)
    }
    
    static var main0_medium: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .medium)
    }
    
    static var main1: UIFont {
        return UIFont.systemFont(ofSize: 11.59375 * ratio)
    }
    
    static var main2_regular: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .regular)
    }
    
    static var main3_regular: UIFont {
        return UIFont.systemFont(ofSize: 12.0, weight: .regular)
    }
    
    static func title2Text(_ text:String) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4.9
        
        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        
        return attrString
    }
    
    static func main1Text(_ text:String) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5.8
        
        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        
        return attrString
    }
}
