//
//  DogDay.swift
//  DogDay
//
//  Created by david on 2017. 10. 21..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import Foundation

enum ModelError: Error {
    case indexError(reason: String)
}

// MARK: DogDay
struct DogDay: Codable {
    
    enum CodingKeys: String, CodingKey {
        case dogDayType, title, endDate, endTime, widgetSetting, startTime
    }
    
    enum DogDayType: Int, Codable {
        case heartWorm, pill, heart, vaccination, beauty
    }
    
    public var dogDayType: DogDayType? = nil
    public var title: String? = nil
    public var endDate: Date? = nil
    public var endTime: Date? = nil
    public var widgetSetting: Bool = false
    public var startTime: Date? = nil
    
    public var fullEndDate: Date? {
        guard let endDate = endDate, let endTime = endTime else { return nil }
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.hour, .minute], from: endTime)
        return calendar.date(byAdding: dateComponents, to: endDate)
    }
    
    public var remainDay: Int {
        guard let fullEndDate = fullEndDate else { return 0 }
        return Int(fullEndDate.timeIntervalSinceNow)
    }
    
    public var remainDayPercentage: Int {
        guard let fullEndDate = fullEndDate, let startTime = startTime else { return 0 }
        let totalTimeInterval = fullEndDate.timeIntervalSince(startTime)
        let currentTimeInterval = Date().timeIntervalSince(startTime)
        var percentage = Int((currentTimeInterval/totalTimeInterval) * 100)
        if percentage >= 100 {
            percentage = 100
        }
        return percentage
    }
    
    public var nowDateSting: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd/a hh:mm"
        return dateFormatter.string(from: Date())
    }
    
    public var endDateString: String {
        guard let fullEndDate = fullEndDate else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd/a hh:mm"
        return dateFormatter.string(from: fullEndDate)
    }
    
    public var shortRemainDayString: String {
        return "D-\(remainDay)"
    }
    
    public var detailRemainDayString: String {
        return "\(remainDay)일 남았어요"
    }
    
    public var possibleToSave: Bool {
        guard title != nil, let fullEndDate = fullEndDate else { return false }
        
        if fullEndDate < Date() {
            return false
        }
        
        return true
    }
    
    public mutating func setEndDate(with date:String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        self.endDate = dateFormatter.date(from: date)
    }
    
    public mutating func setEndTime(with time:String) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "a hh:mm"
        
        self.endTime = timeFormatter.date(from: time)
    }
    
    public mutating func setDogDayType(with index:Int) {
        switch index {
        case DogDayType.heartWorm.rawValue:
            self.dogDayType = .heartWorm
            break
        case DogDayType.pill.rawValue:
            self.dogDayType = .pill
            break
        case DogDayType.heart.rawValue:
            self.dogDayType = .heart
            break
        case DogDayType.vaccination.rawValue:
            self.dogDayType = .vaccination
            break
        case DogDayType.beauty.rawValue:
            self.dogDayType = .beauty
            break
            
        default:
            
            break
        }
    }
}

// MARK: Repositories
final class DogDays: Codable {
    
    public static let sharedInstance = DogDays.decode()
    
    var items: [DogDay] = []
    
    var isEmpty: Bool {
        if self.items.count > 0 {
            return true
        }
        return false
    }
    
    public func addDogDayData(_ element:DogDay) {
        var tempElement = element
        tempElement.startTime = Date()
        self.items.append(tempElement)
        self.items.sort { (first, second) -> Bool in
            if let first = first.fullEndDate, let second = second.fullEndDate {
                return first < second
            }
            return true
        }
        self.encoded()
    }
    
    public func removeDogDayData(at index: Int) throws {
        guard index >= self.items.count else { throw ModelError.indexError(reason: "index out of range") }
        self.items.remove(at: index)
    }
    
    public func insertDogDayData(moveAt currentIndex: Int, to destinationIndex: Int) {
        let tempDogDay = self.items[currentIndex]
        self.items.remove(at: currentIndex)
        self.items.insert(tempDogDay, at: destinationIndex)
    }
    
    public func editDogDayData(at index: Int, newElement:DogDay) {
        self.items.remove(at: index)
        self.items.insert(newElement, at: index)
    }
    
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
