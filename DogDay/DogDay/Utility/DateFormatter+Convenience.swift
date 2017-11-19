//
//  DateFormatter+Convenience.swift
//  DogDay
//
//  Created by david on 2017. 11. 19..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import Foundation

extension DateFormatter {
    static var fullDateFormatter: DateFormatter {
        let fullDateDateFormatter = DateFormatter()
        fullDateDateFormatter.dateFormat = "yyyy.MM.dd/ a hh:mm"
        return fullDateDateFormatter
        
    }
    
    static var shortDateFormatter: DateFormatter {
        let shortDateDateFormatter = DateFormatter()
        shortDateDateFormatter.dateFormat = "yyyy-MM-dd"
        return shortDateDateFormatter
    }
    
    static var shortTimeFormatter: DateFormatter {
        let shortTimeDateFormatter = DateFormatter()
        shortTimeDateFormatter.dateFormat = "a hh:mm"
        return shortTimeDateFormatter
    }
}
