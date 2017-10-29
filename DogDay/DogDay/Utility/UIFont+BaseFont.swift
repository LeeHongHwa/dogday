//
//  UIFont+BaseFont.swift
//  DogDay
//
//  Created by david on 2017. 10. 15..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

extension UIFont {
    static var ratio: CGFloat {
        return UIScreen.main.bounds.width/320.0
    }
    
    static var title0: UIFont {
        return UIFont.systemFont(ofSize: 22.359375 * ratio)
    }
    
    static var main0Text_medium: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .medium)
    }
    
    static var main1: UIFont {
        return UIFont.systemFont(ofSize: 11.59375 * ratio)
    }
    
    static func title0Text(_ text:String) -> NSMutableAttributedString {
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
