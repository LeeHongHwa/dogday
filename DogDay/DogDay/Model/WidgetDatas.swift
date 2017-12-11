//
//  GlobalState.swift
//  DogDay
//
//  Created by david on 2017. 12. 6..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import Foundation

final class WidgetDatas {

    enum Constants: String {
        case dogdaysKey
        case isUpdateKey
    }

    static let sharedInstance = WidgetDatas()
    
    let userDefaults: UserDefaults?
    let dogDays: DogDays
    var isUpdate: Bool
    
    init() {
        self.userDefaults = UserDefaults.init(suiteName: "group.com.honghwa.dogday")
        if let data = self.userDefaults?.data(forKey: Constants.dogdaysKey.rawValue) {
            self.dogDays = DogDays.decode(with: data)
        } else {
            self.dogDays = DogDays()
        }
        
        if let isUpdate = self.userDefaults?.bool(forKey: Constants.isUpdateKey.rawValue) {
            self.isUpdate = isUpdate
        } else {
            self.isUpdate = false
        }
    }
    
    public func encoded() {
        guard let data = dogDays.encodedData() else { return }
        userDefaults?.set(data, forKey: Constants.dogdaysKey.rawValue)
        userDefaults?.set(isUpdate, forKey: Constants.isUpdateKey.rawValue)
    }
    
    public func add(_ data: DogDay) {
        if data.widgetSetting {
            self.dogDays.addDogDay(element: data)
            self.isUpdate = true
        } else {
            return
        }
    }
    
    public func edit(oldData: DogDay, newData: DogDay) {
        if oldData.widgetSetting || newData.widgetSetting {
            guard let index = self.dogDays.items.index(of: oldData) else { return }
            self.dogDays.editDogDayElement(at: index, newElement: newData)
            self.isUpdate = true
        } else {
            return
        }
    }
    
    public func remove(_ data: DogDay) {
        if data.widgetSetting {
            guard let index = self.dogDays.items.index(of: data) else { return }
            self.dogDays.items.remove(at: index)
            self.isUpdate = true
        } else {
            return
        }
    }
    
    public func synchronize() {
        self.userDefaults?.synchronize()
    }
}

