//
//  GradientScrollView.swift
//  DogDay
//
//  Created by david on 2017. 10. 30..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class GradientScrollView: UIScrollView {
    
    enum ScrollDirection: Int {
        case left = 1
        case right
    }
    
    var lastContentOffset: CGFloat = 0
    var forceScroll = false
    let gradientColors: [UIColor]
    required init(frame: CGRect, gradientColors colors: [UIColor]) {
        gradientColors = colors
        super.init(frame: frame)
        self.backgroundColor = gradientColors[0]
        self.contentSize = CGSize(width: self.frame.width * CGFloat(gradientColors.count + 2), height: self.frame.height)
        self.scrollRectToVisible(CGRect(x: self.frame.width, y: 0, width: self.frame.width, height: self.frame.height), animated: false)
        self.isPagingEnabled = true
        self.bounces = false
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addContentsViews(images:[UIImage]) {
        var temp = 0
        for image in images {
            let rect = CGRect(x: (self.frame.width - CGFloat(72))/2 + (self.frame.width * CGFloat(temp)),
                              y: CGFloat(129),
                              width: CGFloat(72),
                              height: CGFloat(72))
            let imageView = UIImageView(frame: rect)
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            self.addSubview(imageView)
            temp += 1
        }
    }
    
    public func gradientBackground() {
        //set circulator
        if self.forceScroll == true &&
            (self.contentOffset.x == self.frame.width * CGFloat(self.gradientColors.count) ||
                self.contentOffset.x == self.frame.width) {
            self.forceScroll = false
            return
        }
        
        if (self.contentOffset.x == 0) {
            //<--
            self.forceScroll = true
            self.scrollRectToVisible(CGRect(x: self.frame.width * CGFloat(self.gradientColors.count),
                                            y: 0,
                                            width: self.frame.width,
                                            height: self.frame.height),
                                     animated: false)
            return
        } else if (self.contentOffset.x == self.frame.size.width * CGFloat(self.gradientColors.count + 1)) {
            //-->
            self.forceScroll = true
            self.scrollRectToVisible(CGRect(x: self.frame.width,
                                            y: 0,
                                            width: self.frame.width,
                                            height: self.frame.height),
                                     animated: false)
            return
        }
        
        //set direction
        var scrollDirection: ScrollDirection!
        
        if (self.lastContentOffset > self.contentOffset.x) {
            scrollDirection = .right
        } else if (self.lastContentOffset < self.contentOffset.x) {
            scrollDirection = .left
        } else {
            return
        }
        
        //set index
        var index: Int!
        let absoluteOffsetPercentage = self.contentOffset.x/self.frame.size.width
        
        switch scrollDirection {
        case .left:
            index = Int(floor(absoluteOffsetPercentage))
            
        case .right:
            index = Int(ceil(absoluteOffsetPercentage))
            
        default: return
        }
        
        let startPoint = self.frame.width * floor(absoluteOffsetPercentage)
        let movePoint = self.contentOffset.x - startPoint
        let relativePercentage = movePoint / self.frame.width
        
        //set last offset
        self.lastContentOffset = self.contentOffset.x;
        
        self.gradientBackground(didScrollToPercentage: relativePercentage,
                                currentIndex: index,
                                direction: scrollDirection,
                                isCirculator: true)
    }
    
    private func gradientBackground(didScrollToPercentage percentage: CGFloat, currentIndex: Int, direction: ScrollDirection, isCirculator:Bool) {
        
        var currentVisibleIndex = 0
        var nextVisibleIndex = 0
        
        if isCirculator == true {
            
            //currnet visible index
            if currentIndex == 0 {
                currentVisibleIndex = self.gradientColors.count - 1
            } else if currentIndex == self.gradientColors.count + 1 {
                currentVisibleIndex = 0
            } else {
                currentVisibleIndex = currentIndex - 1
            }
            
            switch direction {
            case .left:
                // <--
                //next visible index
                if currentVisibleIndex == self.gradientColors.count - 1 {
                    nextVisibleIndex = 0
                } else {
                    nextVisibleIndex = currentVisibleIndex + 1
                }
            case .right:
                // -->
                //next visible index
                if currentVisibleIndex == 0 {
                    nextVisibleIndex = self.gradientColors.count - 1
                } else {
                    nextVisibleIndex = currentVisibleIndex - 1
                }
            }
        }
        self.backgroundColor = fade(from: self.gradientColors[currentVisibleIndex], to: self.gradientColors[nextVisibleIndex], withPercentage: percentage, direction: direction)
    }
    
    private func fade(from fromColor: UIColor, to toColor: UIColor, withPercentage percentage: CGFloat, direction: ScrollDirection) -> UIColor {
        
        if percentage == 0.0 {
            return fromColor
        }
        
        var fromRed = CGFloat(0)
        var fromGreen = CGFloat(0)
        var fromBlue = CGFloat(0)
        var fromAlpha = CGFloat(0)
        
        fromColor.getRed(&fromRed, green: &fromGreen, blue: &fromBlue, alpha: &fromAlpha)
        
        var toRed = CGFloat(0)
        var toGreen = CGFloat(0)
        var toBlue = CGFloat(0)
        var toAlpha = CGFloat(0)
        toColor.getRed(&toRed, green: &toGreen, blue: &toBlue, alpha: &toAlpha)
        
        let red: CGFloat!
        let green: CGFloat!
        let blue: CGFloat!
        
        switch direction {
        case .left:
            red = ((toRed - fromRed) * percentage) + fromRed
            green = ((toGreen - fromGreen) * percentage) + fromGreen
            blue = ((toBlue - fromBlue) * percentage) + fromBlue
            
        case .right:
            red = ((fromRed - toRed) * percentage) + toRed
            green = ((fromGreen - toGreen) * percentage) + toGreen
            blue = ((fromBlue - toBlue) * percentage) + toBlue
        }
        return UIColor(red: red, green: green, blue: blue, alpha: CGFloat(1))
    }
    
    public func nextPaging() {
        let absoluteOffsetPercentage = self.contentOffset.x/self.frame.size.width
        let nextIndex = Int(ceil(absoluteOffsetPercentage)) + 1

        self.scrollRectToVisible(CGRect(x: self.frame.width * CGFloat(nextIndex),
                                        y: 0,
                                        width: self.frame.width,
                                        height: self.frame.height),
                                 animated: true)
    }
    
    public func previousPaging() {
        let absoluteOffsetPercentage = self.contentOffset.x/self.frame.size.width
        let previousIndex = Int(floor(absoluteOffsetPercentage)) - 1
        
        self.scrollRectToVisible(CGRect(x: self.frame.width * CGFloat(previousIndex),
                                        y: 0,
                                        width: self.frame.width,
                                        height: self.frame.height),
                                 animated: true)
    }
    
    public func currentIndex() -> Int {
        let absoluteOffsetPercentage = self.contentOffset.x/self.frame.size.width
        let currentIndex = Int(floor(absoluteOffsetPercentage))
       return currentIndex
    }
}
