//
//  PhotoViewController.swift
//  ChapterTest6
//
//  Created by 嚴啟睿 on 2020/8/14.
//  Copyright © 2020 嚴啟睿. All rights reserved.
//

import UIKit
import SnapKit

class PhotoViewController: UIViewController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
  func fetchImage(from urlString: String, completionHandler: @escaping (_ data: Data?) -> ()) {
      let session = URLSession.shared
      let url = URL(string: "http://www.zoo.gov.tw/iTAP/03_Animals/PandaHouse/Panda_Pic02.jpg")
          
      let dataTask = session.dataTask(with: url!) { (data, response, error) in
          if error != nil {
              print("Error fetching the image! ")
              completionHandler(nil)
          } else {
              completionHandler(data)
          }
      }
          
      dataTask.resume()
  }
        
    func setImageToImageView() {
        fetchImage(from: "http://www.zoo.gov.tw/iTAP/03_Animals/PandaHouse/Panda_Pic02.jpg") { (imageData) in
                if let data = imageData {
                    DispatchQueue.main.async {
                        
                    }
                } else {
                        
                    print("Error loading image");
                }
            }
        }
    
    }
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
