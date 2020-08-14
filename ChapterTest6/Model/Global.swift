//
//  Global.swift
//  ChapterTest6
//
//  Created by 嚴啟睿 on 2020/8/10.
//  Copyright © 2020 嚴啟睿. All rights reserved.
//

import Foundation


struct Global: Codable {
    var NewConfirmed: Int
    var TotalConfirmed: Int
    var NewDeaths: Int
    var TotalDeaths: Int
    var NewRecovered: Int
    var TotalRecovered: Int
    
}
//let json = """
//{
//"Global": {
//  "NewConfirmed": 100282,
//  "TotalConfirmed": 1162857,
//  "NewDeaths": 5658,
//  "TotalDeaths": 63263,
//  "NewRecovered": 15405,
//  "TotalRecovered": 230845
//""".data(using: utf8)!

//let decoder = JSONDecoder()
//let product = try decoder.decode(Global.self, from: json)

//print(product.NewConfirmed)

//guard let url = URL(string:"https://api.covid19api.com/summary")
//let session = URLSession.shared
//let task = session.dataTask(with: URLRequest(url: url)) { (data, res, error) in
//guard let data = data else { return }
//    let dataString = String(data: data, encoding: .utf8)
//print(dataString)
//}.resume()
      
