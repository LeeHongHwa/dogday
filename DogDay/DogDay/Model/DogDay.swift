//
//  DogDay.swift
//  DogDay
//
//  Created by david on 2017. 10. 21..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import Foundation
import UIKit

enum ModelError: Error {
    case indexError(reason: String)
}

enum DogDayType: Int, Codable {
    case heartWorm, pill, heart, vaccination, beauty
    
    typealias VisualData = (color: UIColor, image: UIImage)
    
    public func visualData() -> VisualData {
        switch self {
        case .heartWorm:
            return (color: UIColor.heartWorm, image: UIImage.heartWorm)
        case .pill:
            return (color: UIColor.pill, image: UIImage.pill)
        case .heart:
            return (color: UIColor.heart, image: UIImage.heart)
        case .vaccination:
            return (color: UIColor.vaccination, image: UIImage.vaccination)
        case .beauty:
            return (color: UIColor.beauty, image: UIImage.beauty)
        }
    }
}

// MARK: DogDay Element
struct DogDay: Codable, Equatable {
    
    static func ==(lhs: DogDay, rhs: DogDay) -> Bool {
        return lhs.startTime == rhs.startTime
    }
    
    enum CodingKeys: String, CodingKey {
        case dogDayType, title, endDate, endTime, widgetSetting, startTime
    }
    
    enum SaveError {
        case none, emptyValue, exceedValue
    }
    
    //store property
    public var dogDayType: DogDayType? = nil
    public var title: String? = nil
    public var endDate: Date? = nil
    public var endTime: Date? = nil
    public var widgetSetting: Bool = false
    public var startTime: Date? = nil
    
    //computed property
    //지정한 날짜 + 시간
    fileprivate var fullEndDate: Date? {
        guard let endDate = endDate, let endTime = endTime else { return nil }
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.hour, .minute], from: endTime)
        return calendar.date(byAdding: dateComponents, to: endDate)
    }
    
    //오늘로 부터 남은 날짜
    private var remainDay: Int {
        guard let fullEndDate = fullEndDate else { return 0 }
        let secondsInAnHour = 60 * 60 * 24
        return Int(fullEndDate.timeIntervalSinceNow) / secondsInAnHour
    }
    
    //진행된 상태
    public var remainDayPercentage: Int {
        guard let fullEndDate = fullEndDate, let startTime = startTime else { return 0 }
        if fullEndDate <= Date() {
            return 100
        }
        
        let totalTimeInterval = fullEndDate.timeIntervalSince(startTime)
        let currentTimeInterval = Date().timeIntervalSince(startTime)
        let percentage = Int((currentTimeInterval/totalTimeInterval) * 100)
        return percentage
    }
    
    //현재 날짜
    public static var nowDateSting: String {
        return DateFormatter.fullDateFormatter.string(from: Date())
    }
    
    //지정한 날짜 + 시간
    public var fullEndDateString: String {
        guard let fullEndDate = fullEndDate else { return "" }
        return DateFormatter.fullDateFormatter.string(from: fullEndDate)
    }
    
    //지정한 날짜
    public var endDateString: String {
        guard let fullEndDate = fullEndDate else { return "" }
        return DateFormatter.shortDateFormatter.string(from: fullEndDate)
    }
    
    //지정한 시간
    public var endTimeString: String {
        guard let fullEndDate = fullEndDate else { return "" }
        return DateFormatter.shortTimeFormatter.string(from: fullEndDate)
    }
    
    //현재로 부터 남은 날짜(D~)
    public var shortRemainDayString: String {
        let remainDay = self.remainDay
        if remainDay < 0 {
            return "D+\(abs(remainDay))"
        } else {
            return "D-\(remainDay)"
        }
    }
    
    //현재로 부터 남은 날짜(자세한 설명)
    public var detailRemainDayString: String {
        let remainDay = self.remainDay
        if remainDay < 0 {
            return "+\(abs(remainDay))일 지났어요"
        } else {
            return "\(remainDay)일 남았어요"
        }
    }
    
    //등록할때 저장 할수 있는가에 대한 Bool값
    public var possibleToSave: SaveError {
        guard title != nil, let fullEndDate = fullEndDate else { return .emptyValue }
        if fullEndDate < Date() {
            return .emptyValue
        }
        
        if !DogDays.sharedInstance.possibleToSaveWidget() && self.widgetSetting == true {
            return .exceedValue
        }
        
        return .none
    }
    
    //문자열로 지정한 날짜 저장
    public mutating func setEndDate(with date:String) {
        self.endDate = DateFormatter.shortDateFormatter.date(from: date)
    }
    
    //문자열로 지정한 시간 저장
    public mutating func setEndTime(with time:String) {
        self.endTime = DateFormatter.shortTimeFormatter.date(from: time)
    }
    
    //index를 통한 dog type 저장
    public mutating func setDogDayType(with index:Int) {
        switch index {
        case DogDayType.heartWorm.rawValue:
            self.dogDayType = .heartWorm
            
        case DogDayType.pill.rawValue:
            self.dogDayType = .pill
            
        case DogDayType.heart.rawValue:
            self.dogDayType = .heart
            
        case DogDayType.vaccination.rawValue:
            self.dogDayType = .vaccination
            
        case DogDayType.beauty.rawValue:
            self.dogDayType = .beauty
            
        default:
            break
        }
    }
}

// MARK: DogDay List
final class DogDays: Codable {
    
    //singleton
    public static let sharedInstance = DogDays.decode()
    
    var items: [DogDay] = []
    
    var isEmpty: Bool {
        if self.items.count <= 0 {
            return true
        }
        return false
    }
    
    public func addDogDay(element: DogDay, isWidget: Bool = false) {
        var tempElement = element
        tempElement.startTime = Date()
        if isWidget {
            WidgetDatas.sharedInstance.add(tempElement)
        }
        self.items.append(tempElement)
        self.sortItems()
        NotificationCenter.postUpdateDataNotification()
    }
    
    public func removeDogDayElement(at index: Int, isWidget: Bool = false) {
        guard index < self.items.count else { return }
        let removedData = self.items.remove(at: index)
        if isWidget {
            WidgetDatas.sharedInstance.remove(removedData)
        }
    }
    
    public func insertDogDayElement(moveAt currentIndex: Int, to destinationIndex: Int) {
        let tempDogDay = self.items[currentIndex]
        self.items.remove(at: currentIndex)
        self.items.insert(tempDogDay, at: destinationIndex)
    }
    
    public func editDogDayElement(at index: Int, newElement:DogDay, isWidget: Bool = false) {
        let oldData = self.items.remove(at: index)
        if isWidget {
            WidgetDatas.sharedInstance.edit(oldData: oldData,
                                            newData: newElement)
        }
        self.items.insert(newElement, at: index)
        self.sortItems()
        NotificationCenter.postUpdateDataNotification()
    }
    
    private func sortItems() {
        self.items.sort { (first, second) -> Bool in
            if let first = first.fullEndDate, let second = second.fullEndDate {
                return first < second
            }
            return true
        }
    }
    
    public func possibleToSaveWidget() -> Bool {
        let widgetSetDataCount = self.items.filter { (dogDay) -> Bool in
            return dogDay.widgetSetting
            }.count
        guard widgetSetDataCount < 3 else { return false }
        return true
    }
    
    public func dogday(startTime: Double) -> DogDay? {
        let filteredDatas = items.filter { (dogDay) -> Bool in
            return dogDay.startTime?.timeIntervalSince1970 == startTime
        }
        guard filteredDatas.isEmpty else { return nil }
        return filteredDatas.first
    }
    
    public func encoded() {
        do {
            let dogDayData = try JSONEncoder().encode(self)
            try dogDayData.write(to: DogDays.encodingPath())
        } catch let error {
            print("Encoding data has failed with error: ", error.localizedDescription)
        }
    }
    
    public func encodedData() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch let error {
            print("Encoding data has failed with error: ", error.localizedDescription)
        }
        return nil
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
    
    static func decode(with data: Data) -> DogDays {
        do {
            let dogDayDatas = try JSONDecoder().decode(DogDays.self, from: data)
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
