//
//  MainController.swift
//  ChapterTest6
//
//  Created by 嚴啟睿 on 2020/7/24.
//  Copyright © 2020 嚴啟睿. All rights reserved.
//

import UIKit
  
class MainTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        
        cell.titleLabel.text = String(indexPath.row+1)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == UITableViewCell.AccessoryType.none {
            cell?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }else {
            cell?.accessoryType = UITableViewCell.AccessoryType.none
        }
        
        
    
    }
}

