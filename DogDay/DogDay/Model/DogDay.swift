//
//  DogDay.swift
//  DogDay
//
//  Created by david on 2017. 10. 21..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import Foundation

// MARK: DogDay
struct DogDay: Codable {
    
    enum DogDayType: Int, Codable {
        case heartWorm, etc
    }
    
    enum CodingKeys: String, CodingKey {
        case dogDayType, title, endDate, endTime, widgetSetting, startTime
    }
    
    var dogDayType: DogDayType
    var title: String
    var endDate: Date
    var endTime: TimeInterval
    var widgetSetting: Bool
    var startTime: Date
    
    var remainDay: Int {
        return Int((endDate + endTime).timeIntervalSinceNow)
    }
    
    var remainDayPercentage: Int {
        let totalTimeInterval = ((endDate + endTime) - startTime.timeIntervalSince1970).timeIntervalSince1970
        let currentTimeInterval = (Date() - startTime.timeIntervalSince1970).timeIntervalSince1970
        var percentage = Int((currentTimeInterval/totalTimeInterval) * 100)
        if percentage >= 100 {
           percentage = 100
        }
        return percentage
    }
    
    var nowDateSting: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd/a hh:mm"
        return dateFormatter.string(from: Date())
    }
    
    var endDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd/a hh:mm"
        return dateFormatter.string(from: endDate + endTime)
    }
    
    var shortRemainDayString: String {
        return "D-\(remainDay)"
    }
    
    var detailRemainDayString: String {
        return "\(remainDay)일 남았어요"
    }
    
    init(dogDayType: DogDayType, title: String, endDate: Date, endTime: TimeInterval, widgetSetting: Bool) {
        self.dogDayType = dogDayType
        self.title = title
        self.endDate = endDate
        self.endTime = endTime
        self.widgetSetting = widgetSetting
        self.startTime = Date()
    }
}

// MARK: Repositories
struct DogDays: Codable {
    
    var items: [DogDay]? = nil
    
    func encoded() {
        do {
            let dogDayData = try JSONEncoder().encode(self)
            try dogDayData.write(to: DogDays.encodingPath())
        } catch let error {
            print("Encoding data has failed with error: ", error.localizedDescription)
        }
    }
    
    static func decode() -> DogDays {
        do {
            let decodingData = try Data(contentsOf: DogDays.encodingPath())
            let dogDayDatas = try JSONDecoder().decode(DogDays.self, from: decodingData)
            return dogDayDatas
        } catch let error {
            print("Decoding data has failed with error: ", error.localizedDescription)
            return DogDays()
        }
    }
    
    private static func encodingPath() -> URL {
        let document = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let path = document.appending("/currentDogDay.data")
        return URL(fileURLWithPath: path)
    }
    
}
