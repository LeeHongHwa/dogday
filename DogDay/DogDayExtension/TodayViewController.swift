//
//  TodayViewController.swift
//  DogDayExtension
//
//  Created by david on 2017. 12. 4..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

/*
 1. open url
 2. default extension size
 3.
 */
import UIKit
import NotificationCenter

class TodayViewController: UIViewController {
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var emptyButton: HHOButton!
    @IBOutlet weak var tableView: UITableView!
    var widgetData = WidgetDatas()
    var cellHeight: Int!
    var isUpdateRequired: Bool {
        if widgetData.isUpdate {
            widgetData.isUpdate = false
            widgetData.userDefaults?.set(false, forKey: WidgetDatas.Constants.isUpdateKey.rawValue)
            widgetData.userDefaults?.synchronize()
            return true
        } else {
            return false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        self.cellHeight = Int((self.extensionContext?.widgetMaximumSize(for: .compact).height) ?? 0)
    }
    
    func updateViews() {
        widgetData = WidgetDatas()
        if widgetData.dogDays.items.isEmpty {
            tableView.isHidden = true
            emptyView.isHidden = false
            setUpEmptyView()
        } else {
            if widgetData.dogDays.items.count > 1 {
                self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
            }
            emptyView.isHidden = true
            tableView.isHidden = false
        }
    }
    
    func setUpEmptyView() {
        emptyButton.setTitle("등록하기", for: .normal)
        emptyButton.setTitleColor(UIColor.emptyAddButtonColor, for: .normal)
        emptyButton.setTitleColor(UIColor.darkerColor(currentColor: UIColor.emptyAddButtonColor), for: .highlighted)
        emptyButton.titleLabel?.textAlignment = .center
        emptyButton.titleLabel?.font = UIFont.main3_regular
        emptyButton.setImage(#imageLiteral(resourceName: "extension_add_day_btn"), for: .normal)
        
        emptyButton.defaultBackgroundColor = UIColor.white
        emptyButton.highlightedBackgroundColor = UIColor.darkerColor(currentColor: UIColor.white)
        emptyButton.backgroundColor = emptyButton.defaultBackgroundColor
        
        emptyButton.layer.cornerRadius = 9.0
        emptyButton.layer.shadowColor = UIColor.black.cgColor
        emptyButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        emptyButton.layer.shadowOpacity = 0.14;
        emptyButton.layer.shadowRadius = 4.0;
        
        emptyLabel.attributedText = UIFont.main1Text("반려견의 일정을\n등록해 보세요!")
        emptyLabel.font = UIFont.main1
        emptyLabel.textColor = UIColor.subTextBlackColor
        emptyLabel.numberOfLines = 0
        emptyLabel.textAlignment = .center
    }
    
    @IBAction func emptyButtondidTab(_ sender: Any) {
        guard let addDayUrl = URL.addDayURL else { return }
        self.extensionContext?.open(addDayUrl, completionHandler: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TodayViewController: NCWidgetProviding {
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        if self.isUpdateRequired {
            tableView.reloadData()
            completionHandler(NCUpdateResult.newData)
        } else {
            completionHandler(NCUpdateResult.noData)
        }
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .compact || widgetData.dogDays.items.isEmpty {
            self.preferredContentSize = maxSize
        } else {
            self.preferredContentSize = CGSize(width: tableView.frame.width
                , height: CGFloat(cellHeight * widgetData.dogDays.items.count))
        }
    }
}

extension TodayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(cellHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let dogDayData = widgetData.dogDays.items[indexPath.row]
        guard let startTime = dogDayData.startTime?.timeIntervalSince1970, let detailURL = URL.detailURL(startTime: startTime) else { return }
        self.extensionContext?.open(detailURL,
                                    completionHandler: nil)
    }
}

extension TodayViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return widgetData.dogDays.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DogDayExtension", for: indexPath) as! ExtensionTableViewCell
        let dogDayData = widgetData.dogDays.items[indexPath.row]
        
        cell.configureWith(name: dogDayData.title!,
                           endDate: dogDayData.fullEndDateString,
                           remainingDay: dogDayData.shortRemainDayString,
                           dogDayType: dogDayData.dogDayType!)
        return cell
    }
}
