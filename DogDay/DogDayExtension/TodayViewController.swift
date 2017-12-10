//
//  TodayViewController.swift
//  DogDayExtension
//
//  Created by david on 2017. 12. 4..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var emptyButton: HHOButton!
    @IBOutlet weak var tableView: UITableView!
    var widgetData = WidgetDatas()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        NotificationCenter.default.addObserver(self, selector: #selector(userDefaultsDidChanged(_:)),
                                               name: UserDefaults.didChangeNotification,
                                               object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector(userDefaultsDidChanged(_:)),
                                               name: UserDefaults.didChangeNotification,
                                               object: nil)
    }
    
    func setUpEmptyView() {
        emptyView.isHidden = false
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        setUpEmptyView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .compact {
            self.preferredContentSize = maxSize
        } else {
            self.preferredContentSize = CGSize(width: tableView.contentSize.width
                , height: tableView.contentSize.height)
        }
    }
    
    func updateViews() {
        widgetData = WidgetDatas()
        if widgetData.dogDays.items.isEmpty || true{
            tableView.isHidden = true
            emptyView.isHidden = false
        } else {
            if widgetData.dogDays.items.count > 1 {
                self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
            
            }
            emptyView.isHidden = true
            tableView.isHidden = false
            tableView.reloadData()
        }
    }
    
    @objc func userDefaultsDidChanged(_ sender:Any) {
        updateViews()
    }
}

//
//    var items : [Todo] = []
//
//    @IBOutlet weak var tableView: UITableView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//    func reloadTable()
//    {
//        self.tableView.reloadData()
//    }
//
//    func performUpdate() {
//        TodoService.sharedInstance.getTodos().then { todos -> Void in
//            self.items = Array(todos.prefix(2))
//            self.reloadTable()
//            }.catch { error in
//                print("Error: could not load todos")
//        }
//    }
//
//    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
//        performUpdate()
//        completionHandler(NCUpdateResult.newData)
//    }
//
//}
//
//extension TodayViewController : UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return widgetData.dogDays.items.count
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "DogDayExtension", for: indexPath)
//        cell.textLabel?.text = widgetData.dogDays.items.
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
//}

extension TodayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height
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
