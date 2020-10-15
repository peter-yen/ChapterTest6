//
//  TaipeiViewController.swift
//  ChapterTest6
//
//  Created by 嚴啟睿 on 2020/8/11.
//  Copyright © 2020 嚴啟睿. All rights reserved.
//

import UIKit

class TaipeiViewController: UIViewController {
    
    var photoImageView: UIImageView!
    var behaviorLabel: UILabel!
    var distributionLabel: UILabel!
    var altLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupPhotoImageView()
        
        
        
        
        
        behaviorLabel = UILabel()
          view.addSubview(behaviorLabel)
          behaviorLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
          }
          behaviorLabel.text = "test"
          
          
          distributionLabel = UILabel()
          view.addSubview(distributionLabel)
          distributionLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.behaviorLabel.snp.top).offset(50)
            make.centerX.equalToSuperview()
          }
          distributionLabel.text = "test"
        
          
          altLabel = UILabel()
          view.addSubview(altLabel)
          altLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.distributionLabel.snp.top).offset(50)
            make.centerX.equalToSuperview()
          }
          altLabel.text = "test"
    
        
        
        let text = "https://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=a3e2b221-75e0-45c1-8f97-75acbd43d613"
        if let url = URL(string: text) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data { //轉換
                    let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
                    if let json = json ,
                        let result = json["result"] as? [String:Any],
                        let results = result["results"] as? [Any],
                        let firstResults = results[0] as? [String:Any],
                        let pictrueString = firstResults["A_Pic02_URL"] as? String,
                        let behaviorText = firstResults["A_Behavior"] as? String ,
                        let distributionText = firstResults["A_Distribution"] as? String ,
                        let altText = firstResults["A_pdf01_ALT"] as? String,
                        let pictrueURL = URL(string: pictrueString),
                        let data = try? Data(contentsOf: pictrueURL ) {
                        
                        
                        print("imageData:\(data)")
                        DispatchQueue.main.async {
                            self.distributionLabel.text = distributionText
                            self.behaviorLabel.text = behaviorText
                            self.altLabel.text = altText
                            self.photoImageView.image = UIImage(data: data)
                        }
                    }//資料得一層一層解析，不然顯示不出來！！！！
                }
            }.resume()
        }
    }
    func setupPhotoImageView() {
      
      view.backgroundColor = .white
      photoImageView = UIImageView()
      photoImageView.backgroundColor = .blue
      view.addSubview(photoImageView)
      photoImageView.snp.makeConstraints { (make) -> Void in
        make.width.height.equalTo(200)
        make.centerY.equalToSuperview()
        make.centerX.equalToSuperview()
      }
    }
}
