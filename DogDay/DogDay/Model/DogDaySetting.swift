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
    
    let title: String
    let description: String?
    let url: String?
    let detail: [Licence]?
    var isContainDetailInfo: Bool {
        return url != nil || detail != nil
    }
    
}

extension DogDaySetting {
    struct Licence {
        let title: String
        let description: String
        
        init(title: String, descriptionArray: [String]) {
            self.title = title
            self.description = descriptionArray.reduce("", {$0 + "\n" + $1})
        }
    }
}

struct DogDaySettings {
    public let settings = [DogDaySetting(title: "버전",
                                         description: "1.0.0",
                                         url: nil,
                                         detail: nil),
                           
                           DogDaySetting(title: "소스보기",
                                         description: "leehonghwa/DogDay",
                                         url: "https://github.com/LeeHongHwa/DogDay",
                                         detail: nil),
                           
                           DogDaySetting(title: "디자인",
                                         description: "양혜진",
                                         url: nil,
                                         detail: nil),
                           
                           DogDaySetting(title: "오픈소스 라이센스",
                                         description: nil,
                                         url: nil,
                                         detail: [DogDaySetting.Licence(title: "Architecture", descriptionArray: [
                                            "MIT License",
                                            "",
                                            "Copyright (c) 2017 Giftbot",
                                            "",
                                            "Permission is hereby granted, free of charge, to any person obtaining a copy",
                                            "of this software and associated documentation files (the \"Software\"), to deal",
                                            "in the Software without restriction, including without limitation the rights",
                                            "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell",
                                            "copies of the Software, and to permit persons to whom the Software is",
                                            "furnished to do so, subject to the following conditions:",
                                            "",
                                            "The above copyright notice and this permission notice shall be included in all",
                                            "copies or substantial portions of the Software.",
                                            "",
                                            "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR",
                                            "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,",
                                            "FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE",
                                            "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER",
                                            "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,",
                                            "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE",
                                            "SOFTWARE."]),
                                                  
                                                  DogDaySetting.Licence(title: "SwipeCellKit", descriptionArray: [
                                                    "MIT License",
                                                    "Copyright (c) 2017 Jeremy Koch",
                                                    "",
                                                    "http://jerkoch.com",
                                                    "",
                                                    "Permission is hereby granted, free of charge, to any person obtaining a copy",
                                                    "of this software and associated documentation files (the \"Software\"), to deal",
                                                    "in the Software without restriction, including without limitation the rights",
                                                    "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell",
                                                    "copies of the Software, and to permit persons to whom the Software is",
                                                    "furnished to do so, subject to the following conditions:",
                                                    "",
                                                    "The above copyright notice and this permission notice shall be included in all",
                                                    "copies or substantial portions of the Software.",
                                                    "",
                                                    "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR",
                                                    "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,",
                                                    "FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE",
                                                    "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER",
                                                    "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,",
                                                    "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE",
                                                    "SOFTWARE"])
                            ])
                           ]
}
