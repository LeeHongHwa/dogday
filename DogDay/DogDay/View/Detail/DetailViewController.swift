//
//  DetailViewController.swift
//  DogDay
//
//  Created by david on 2017. 10. 26..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    enum ScrollDirection: Int {
        case left = 1
        case right
    }
    
    var lastContentOffset: CGFloat?
    var forceScroll = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        lastContentOffset = self.view.frame.size.width
        
        let scrollView = UIScrollView.init(frame: CGRect(x: 0, y: CGFloat(-20), width: self.view.frame.size.width, height: self.view.frame.size.height + 20))
        scrollView.backgroundColor = UIColor.red
        self.addContentsViews(datas: [3,0,1,2,3,0], scrollView: scrollView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func addContentsViews(datas:[Int], scrollView:UIScrollView) {
        var temp = 0
        for index in datas {
            print("\(index)")
            let rect = CGRect(x: self.view.frame.size.width * CGFloat(temp),
                              y: 0,
                              width: self.view.frame.size.width,
                              height: 200)
            let view = UIView(frame: rect)
            scrollView.addSubview(view)
            if index == 0 {
                view.backgroundColor = UIColor.clear
            } else if index == 1 {
                view.backgroundColor = UIColor.clear
            } else if index == 2 {
                view.backgroundColor = UIColor.clear
            } else if index == 3 {
                view.backgroundColor = UIColor.clear
            }
            temp += 1
        }
        
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * CGFloat(datas.count), height: 200)
        scrollView.scrollRectToVisible(CGRect(x: self.view.frame.size.width, y: -20, width: self.view.frame.size.width, height: 200), animated: false)
        scrollView.delegate = self
        self.view.addSubview(scrollView)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //set circulator
        if self.forceScroll == true &&
            (scrollView.contentOffset.x == self.view.frame.size.width * 4 ||
                scrollView.contentOffset.x == self.view.frame.size.width) {
            self.forceScroll = false
            return
        }
        
        if (scrollView.contentOffset.x == 0) {
            //<--
            self.forceScroll = true
            scrollView.scrollRectToVisible(CGRect(x: self.view.frame.size.width * 4,
                                                  y: 0,
                                                  width: self.view.frame.size.width,
                                                  height: 200),
                                           animated: false)
            return
        } else if (scrollView.contentOffset.x == scrollView.frame.size.width * 5) {
            //-->
            self.forceScroll = true
            scrollView.scrollRectToVisible(CGRect(x: self.view.frame.size.width,
                                                  y: 0,
                                                  width: self.view.frame.size.width,
                                                  height: 200),
                                           animated: false)
            return
        }
        
        //set direction
        var scrollDirection: ScrollDirection!
        guard let lastContentOffset =  self.lastContentOffset else { return }
        
        if (lastContentOffset > scrollView.contentOffset.x) {
            scrollDirection = .right
        } else if (lastContentOffset < scrollView.contentOffset.x) {
            scrollDirection = .left
        } else {
            return
        }
        
        //set index
        var index: Int!
        let absoluteOffsetPercentage = scrollView.contentOffset.x/scrollView.frame.size.width
        
        switch scrollDirection {
        case .left:
            index = Int(floor(absoluteOffsetPercentage))
            
        case .right:
            index = Int(ceil(absoluteOffsetPercentage))
            
        default: return
        }
        
        let startPoint = scrollView.frame.width * floor(absoluteOffsetPercentage)
        let movePoint = scrollView.contentOffset.x - startPoint
        let relativePercentage = movePoint / scrollView.frame.width
        
        //set last offset
        self.lastContentOffset = scrollView.contentOffset.x;
        
        self.scrollView(scrollView,
                        didScrollToPercentage: relativePercentage,
                        currentIndex: index,
                        direction: scrollDirection,
                        isCirculator: true)
    }
    
    func scrollView(_ scrollView: UIScrollView, didScrollToPercentage percentage: CGFloat, currentIndex: Int, direction: ScrollDirection, isCirculator:Bool) {
        let colors = [UIColor.red, UIColor.yellow, UIColor.green, UIColor.blue]
        
        var currentVisibleIndex = 0
        var nextVisibleIndex = 0
        
        if isCirculator == true {
            
            //currnet visible index
            if currentIndex == 0 {
                currentVisibleIndex = colors.count - 1
            } else if currentIndex == colors.count + 1 {
                currentVisibleIndex = 0
            } else {
                currentVisibleIndex = currentIndex - 1
            }
            
            switch direction {
            case .left:
                // <--
                //next visible index
                if currentVisibleIndex == colors.count - 1 {
                    nextVisibleIndex = 0
                } else {
                    nextVisibleIndex = currentVisibleIndex + 1
                }
            case .right:
                // -->
                //next visible index
                if currentVisibleIndex == 0 {
                    nextVisibleIndex = colors.count - 1
                } else {
                    nextVisibleIndex = currentVisibleIndex - 1
                }
            }
        }
        
        print("currentIndex: \(currentIndex)\ncurrentVisibleIndex: \(currentVisibleIndex)\nnextVisibleIndex: \(nextVisibleIndex)")
        scrollView.backgroundColor = fade(from: colors[currentVisibleIndex], to: colors[nextVisibleIndex], withPercentage: percentage, direction: direction)
    }
    
    func fade(from fromColor: UIColor, to toColor: UIColor, withPercentage percentage: CGFloat, direction: ScrollDirection) -> UIColor {
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
}
