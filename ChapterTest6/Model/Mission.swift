//
//  Mission.swift
//  ChapterTest6
//
//  Created by 嚴啟睿 on 2020/8/6.
//  Copyright © 2020 嚴啟睿. All rights reserved.
//

import Foundation
class Mission {
    var title: String
    var done: Bool
    init(title: String, done: Bool) {
    self.title = title
    self.done = done
    }
    func dictionary() -> [String: Any] {
       var dict: [String: Any] = [:]
       dict["title"] = self.title
       dict["done"] = self.done
       return dict
     }
}

