//
//  Country.swift
//  ChapterTest6
//
//  Created by 嚴啟睿 on 2020/8/10.
//  Copyright © 2020 嚴啟睿. All rights reserved.
//

import Foundation
struct Country: Codable {
    var Country: String
    var CountryCode: String
    var Slug: String
    var NewConfirmed: Int
    var TotalConfirmed: Int
    var NewDeaths: Int
    var TotalDeaths: Int
    var NewRecovered: Int
    var TotalRecovered: Int
    var Date: String
}
