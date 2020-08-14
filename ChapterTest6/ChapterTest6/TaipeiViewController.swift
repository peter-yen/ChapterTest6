//
//  TaipeiViewController.swift
//  ChapterTest6
//
//  Created by 嚴啟睿 on 2020/8/11.
//  Copyright © 2020 嚴啟睿. All rights reserved.
//

import UIKit

class TaipeiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        let text = "https://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=a3e2b221-75e0-45c1-8f97-75acbd43d613"
        let url = URL(string: text)
        if let url = url {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
                    if let json = json {
                        if let result = json["result"] as? [String:Any] {
                            if let results = result["results"] as? [Any] {
                                if let firstResults = results[0] as? [String:Any] {
                                    if let pictrue = firstResults["A_Pic02_URL"] as? String {
                                        print(pictrue)
                                    }//資料得一層一層解析，不然顯示不出來！！！！
                                }
                                
                            }
                        }
                    }
                }
                
            }.resume()
        }
        
        
        
        
        
    }
    

    

}
