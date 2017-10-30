//
//  DetailView.swift
//  DogDay
//
//  Created by david on 2017. 10. 30..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

class DetailView: BaseView<DetailViewController> {
    
    override func setupUI() {
        //view controller
        vc.navigationController?.setNavigationBarHidden(true, animated: false)
        
        //base View
        let baseScrollView = UIScrollView()
        baseScrollView.backgroundColor = UIColor.white
        
        //Gradient Scroll View
        let scrollView = GradientScrollView(frame: CGRect(x: 0,
                                                          y: 0,
                                                          width: self.frame.width,
                                                          height: self.frame.height),
                                            gradientColors: [UIColor(red: 248, green: 143, blue: 179),
                                                             UIColor(red: 128, green: 203, blue: 196),
                                                             UIColor(red: 255, green: 166, blue: 166),
                                                             UIColor(red: 123, green: 197, blue: 216),
                                                             UIColor(red: 79, green: 195, blue: 247)],
                                            delegate: vc)
        self.addSubview(scrollView)
            
        
//        self.addContentsViews(datas: [4,0,1,2,3,4,0], scrollView: scrollView)
        
//        //label
//        let subEndDayLabel = UILabel()
//        subEndDayLabel.attributedText = UIFont.main1Text("효율적인 일정 관리\n쉬운 일정 등록\n위젯 설정으로 스케줄 관리까지")
//        subEndDayLabel.font = UIFont.main1
//        subEndDayLabel.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
//        subEndDayLabel.numberOfLines = 0
//        subEndDayLabel.textAlignment = .center
//
//        let titleLabel = UILabel()
//        titleLabel.attributedText = UIFont.title0Text("반려견의 일정을\n등록해 보세요!")
//        titleLabel.font = UIFont.title0
//        titleLabel.textColor = UIColor.white
//        titleLabel.numberOfLines = 0
//        titleLabel.textAlignment = .center
//
//        let dDayLabel = UILabel()
//        dDayLabel.attributedText = UIFont.main1Text("효율적인 일정 관리\n쉬운 일정 등록\n위젯 설정으로 스케줄 관리까지")
//        dDayLabel.font = UIFont.main1
//        dDayLabel.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
//        dDayLabel.numberOfLines = 0
//        dDayLabel.textAlignment = .cent
//
//        let currentDayLabel = UILabel()
//        currentDayLabel.attributedText = UIFont.main1Text("효율적인 일정 관리\n쉬운 일정 등록\n위젯 설정으로 스케줄 관리까지")
//        currentDayLabel.font = UIFont.main1
//        currentDayLabel.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
//        currentDayLabel.numberOfLines = 0
//        currentDayLabel.textAlignment = .cent
//
//        let mainEndDayLabel = UILabel()
//        mainEndDayLabel.attributedText = UIFont.main1Text("효율적인 일정 관리\n쉬운 일정 등록\n위젯 설정으로 스케줄 관리까지")
//        mainEndDayLabel.font = UIFont.main1
//        mainEndDayLabel.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
//        mainEndDayLabel.numberOfLines = 0
//        mainEndDayLabel.textAlignment = .cent
//
//        let mainEndDayDetailLabel = UILabel()
//        mainEndDayDetailLabel.attributedText = UIFont.main1Text("효율적인 일정 관리\n쉬운 일정 등록\n위젯 설정으로 스케줄 관리까지")
//        mainEndDayDetailLabel.font = UIFont.main1
//        mainEndDayDetailLabel.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
//        mainEndDayDetailLabel.numberOfLines = 0
//        mainEndDayDetailLabel.textAlignment = .cent
//
//
//        let addDayButton = HHOButton(type: .custom)
//        addDayButton.setTitle("등록하기", for: .normal)
//        addDayButton.setTitleColor(UIColor.emptyAddButtonColor, for: .normal)
//        addDayButton.setTitleColor(UIColor.darkerColor(currentColor: UIColor.emptyAddButtonColor), for: .highlighted)
//        addDayButton.titleLabel?.textAlignment = .center
//        addDayButton.titleLabel?.font = UIFont.main0Text_medium
//        addDayButton.setImage(#imageLiteral(resourceName: "add_day_btn"), for: .normal)
//
//        addDayButton.defaultBackgroundColor = UIColor.white
//        addDayButton.highlightedBackgroundColor = UIColor.darkerColor(currentColor: UIColor.white)
//        addDayButton.backgroundColor = addDayButton.defaultBackgroundColor
//
//        addDayButton.layer.cornerRadius = 9.0
//        addDayButton.layer.shadowColor = UIColor.black.cgColor
//        addDayButton.layer.shadowOffset = CGSize(width: 0, height: 2)
//        addDayButton.layer.shadowOpacity = 0.14;
//        addDayButton.layer.shadowRadius = 4.0;
//
//        addDayButton.addTarget(vc, action: #selector(vc.addDayButtonDidTab), for: .touchUpInside)
//        //        116 46
//
//        self.addSubviews([titleLabel, mainLabel, addDayButton])
//
//        titleLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(self.snp.top).offset(163.0)
//            make.centerX.equalTo(self)
//        }
//
//        mainLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(titleLabel.snp.bottom).offset(18.0)
//            make.centerX.equalTo(self)
//        }
//
//        addDayButton.snp.makeConstraints { (make) in
//            make.top.equalTo(mainLabel.snp.bottom).offset(52.0)
//            make.height.equalTo(46.0)
//            make.width.equalTo(116.0)
//            make.centerX.equalTo(self)
//        }
        
        //button
        
        //            {
        //                deadlineDateLabel.snp.makeConstraints { (make) -> Void in
        //                    make.top.equalTo(contentView.snp.top).offset(UI.baseMargin)
        //                    make.leading.equalTo(contentView.snp.leading).offset(UI.baseMargin)
        //                }
        //
        //                remainingDaysLabel.snp.makeConstraints { (make) -> Void in
        //                    make.top.equalTo(contentView.snp.top).offset(UI.baseMargin)
        //                    make.trailing.equalTo(contentView.snp.trailing).inset(UI.baseMargin)
        //                }
        //
        //                nameLabel.snp.makeConstraints { (make) -> Void in
        //                    make.top.equalTo(deadlineDateLabel.snp.bottom).offset(UI.baseMargin)
        //                    make.leading.equalTo(deadlineDateLabel.snp.leading).offset(0)
        //                }
        //
        //                iconImageView.snp.makeConstraints { (make) -> Void in
        //                    make.top.equalTo(deadlineDateLabel.snp.bottom).offset(UI.baseMargin)
        //                    make.trailing.equalTo(remainingDaysLabel.snp.trailing).offset(0)
        //                }
        //
        //        }
        
    }
    
    override func setupBinding() {
        
    }
}

//
//view.backgroundColor = UIColor.white
//lastContentOffset = self.view.frame.size.width
//
//let scrollView = UIScrollView.init(frame: CGRect(x: 0, y: CGFloat(-20), width: self.view.frame.size.width, height: self.view.frame.size.height + 20))
//scrollView.backgroundColor = UIColor(red: 244, green: 143, blue: 177)
//self.addContentsViews(datas: [4,0,1,2,3,4,0], scrollView: scrollView)
//// Do any additional setup after loading the view, typically from a nib.
//}
//
//func addContentsViews(datas:[Int], scrollView:UIScrollView) {
//    var temp = 0
//    for index in datas {
//        print("\(index)")
//        let rect = CGRect(x: self.view.frame.size.width * CGFloat(temp),
//                          y: 0,
//                          width: self.view.frame.size.width,
//                          height: 200)
//        let view = UIView(frame: rect)
//        scrollView.addSubview(view)
//        if index == 0 {
//            view.backgroundColor = UIColor.clear
//        } else if index == 1 {
//            view.backgroundColor = UIColor.clear
//        } else if index == 2 {
//            view.backgroundColor = UIColor.clear
//        } else if index == 3 {
//            view.backgroundColor = UIColor.clear
//        }
//        temp += 1
//    }
//
//    scrollView.isPagingEnabled = true
//    scrollView.bounces = false
//    scrollView.contentSize = CGSize(width: self.view.frame.size.width * CGFloat(datas.count), height: 200)
//    scrollView.scrollRectToVisible(CGRect(x: self.view.frame.size.width, y: -20, width: self.view.frame.size.width, height: 200), animated: false)
//    scrollView.delegate = self
//    self.view.addSubview(scrollView)
//
//}

