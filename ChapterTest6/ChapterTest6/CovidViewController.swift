//
//  covidViewController.swift
//  ChapterTest6
//
//  Created by 嚴啟睿 on 2020/8/11.
//  Copyright © 2020 嚴啟睿. All rights reserved.
//

import UIKit

class CovidViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let text = "https://api.covid19api.com/summary"
        let url = URL(string: text)
        if let url = url {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
                    if let json = json {
                        if let countries = json["Countries"] as? [Any] {
                            
                            if let firstCoutry = countries[0] as? [String: Any] {
                                if let country = firstCoutry["Country"] as? String {
                                    print(country)
                                }
                                
                            }
                            
                            
                        }
                        
                        if let date = json["Date"] as? String {
                            print(date)
                            if let global = json["Global"] as? [String: Int] {
                                if let newDeaths = global["NewDeaths"] as? Int {
                                    
                                }
                                
                                
                                
                            }
                        }
                    }
                }
            }.resume()
            
        }
        
        
        
    }
    


}
