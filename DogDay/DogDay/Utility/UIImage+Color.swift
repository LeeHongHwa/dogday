//
//  UIImage+Color.swift
//  DogDay
//
//  Created by david on 2017. 10. 25..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func image(withColor color:UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}

extension UIImage {
    static var heartWorm: UIImage {
        return #imageLiteral(resourceName: "detail_heart")
    }
    static var pill: UIImage {
        return #imageLiteral(resourceName: "detail_pill")
    }
    static var heart: UIImage {
        return #imageLiteral(resourceName: "detail_Animal Hospital")
    }
    static var vaccination: UIImage {
        return #imageLiteral(resourceName: "detail_Vaccination")
    }
    static var beauty: UIImage {
        return #imageLiteral(resourceName: "detail_beauty")
    }
    static var snack: UIImage {
        return #imageLiteral(resourceName: "detail_snack")
    }
    static var bath: UIImage {
        return #imageLiteral(resourceName: "detail_bath")
    }
}
