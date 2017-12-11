//
//  URL+Common.swift
//  DogDay
//
//  Created by lyhonghwa on 2017. 12. 11..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import Foundation

extension URL {
    enum Scheme: String {
        case dogday
    }
    
    enum Host: String {
        case addDay = "add_day", detail
    }
    
    enum QueryKey: String {
        case startTime = "start_time"
    }
    
    //dogday://add_day
    public static var addDayURL: URL? {
        return URL(string: "\(Scheme.dogday.rawValue)://\(Host.addDay.rawValue)")
    }
    
    //dogday://detail?start_time=1506965
    public static func detailURL(startTime: Double) -> URL? {
        return URL(string: "\(Scheme.dogday.rawValue)://\((Host.detail.rawValue))/?\(QueryKey.startTime.rawValue)=\(startTime)")
    }
    
    public static func isDogdayScheme(_ url: URL) -> Bool {
        return Scheme.dogday.rawValue == url.scheme
    }
    
    var queryDictionary: [String: String]? {
        guard let query = URLComponents(string: self.absoluteString)?.query else { return nil}
        
        var queryStrings = [String: String]()
        for pair in query.components(separatedBy: "&") {
            
            let key = pair.components(separatedBy: "=")[0]
            
            let value = pair
                .components(separatedBy:"=")[1]
                .replacingOccurrences(of: "+", with: " ")
                .removingPercentEncoding ?? ""
            
            queryStrings[key] = value
        }
        return queryStrings
        
    }
    
}

