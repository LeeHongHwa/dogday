//
//  String+Empty.swift
//  DogDay
//
//  Created by david on 2017. 11. 19..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import Foundation

extension String {
    func isWhiteSpacing() -> Bool {
        if self.isEmpty {
            return true
        }
        
        var isWhiteSpacing = true
        let titleArray = self.map { String($0) }
        for character in titleArray {
            if character != " " {
                isWhiteSpacing = false
                break
            }
        }
        return isWhiteSpacing
    }
}
