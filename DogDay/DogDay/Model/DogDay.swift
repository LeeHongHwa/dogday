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
        case dogDayType, title, date, time, widgetSetting
    }
    
    var dogDayType: DogDayType
    var title: String
    var date: Int
    var time: Int
    var widgetSetting: Bool
    
    init(dogDayType: DogDayType, title: String, date: Int, time: Int, widgetSetting: Bool) {
        self.dogDayType = dogDayType
        self.title = title
        self.date = date
        self.time = time
        self.widgetSetting = widgetSetting
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
