//
//  Notification+Dogday.swift
//  DogDay
//
//  Created by lyhonghwa on 2017. 12. 11..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import Foundation

extension NotificationCenter {
    
    enum DogdayNotificationName: String {
        case updateData
        case openURL
    }
    
    public static func postUpdateDataNotification() -> Void {
        NotificationCenter.default.post(name: NSNotification.Name(DogdayNotificationName.updateData.rawValue), object: nil)
    }
    
    public static func postOpenURLNotification(url: URL) -> Void {
        NotificationCenter.default.post(name: NSNotification.Name(DogdayNotificationName.openURL.rawValue), object: url)
    }
    
}
