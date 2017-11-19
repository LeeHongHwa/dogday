//
//  DogDaySetting.swift
//  DogDay
//
//  Created by david on 2017. 11. 16..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import Foundation

//설정에 사용할 모델
struct DogDaySetting {
    
    private let version = (title: "버전", decription: "1.0.0")
    private let address = (title: "소스보기", decription: "leehonghwa/DogDay")
    private let design = (title: "디자인", decription: "양혜진")
    private let license = (title: "오픈소스 라이센스", decription: "")
    
    public lazy var allValues = [version, address, design, license]
}
