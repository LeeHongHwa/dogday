//
//  HHOButton.swift
//  DogDay
//
//  Created by david on 2017. 10. 25..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class HHOButton: UIButton {
    
    var highlightedBackgroundColor : UIColor? = nil
    var defaultBackgroundColor : UIColor? = nil
    
    override var isHighlighted: Bool {
        didSet {
            guard let highlightedColor = highlightedBackgroundColor, let defaultColor = defaultBackgroundColor else { return }
            if isHighlighted == true {
                backgroundColor = highlightedColor
            } else {
                backgroundColor = defaultColor
            }
        }
    }
}
