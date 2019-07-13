//
//  Scheme.swift
//  DogDay
//
//  Created by david on 2017. 12. 12..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import Foundation

final class Scheme {
    public static let instance = Scheme()
    public var url: URL?
    public var isShowLaunchScreen: Bool
    
    init(url: URL? = nil) {
        self.url = nil
        self.isShowLaunchScreen = true
    }
}
