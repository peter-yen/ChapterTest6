//
//  MainTableViewCell.swift
//  ChapterTest6
//
//  Created by 嚴啟睿 on 2020/8/3.
//  Copyright © 2020 嚴啟睿. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    var title: String = ""
    var checked: Bool = false
    var row: Int = 0
    var mainTableViewController: MainTableViewController?
    
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var checkedButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleTextField.text = "test"
        checkedButton.layer.cornerRadius = checkedButton.frame.width / 2
        checkedButton.clipsToBounds = true //裁剪邊緣開關
        checkedButton.layer.borderColor = UIColor.systemGray.cgColor
        checkedButton.layer.borderWidth = 3
        
    }
    @IBAction func checkedButtonDidTap() {
        
        if checked == true {
            checkedButton.backgroundColor = .red
            checked = false
        }else {
            checkedButton.backgroundColor = .black
            checked = true
        }
        mainTableViewController?.checkedButtonDidTap(row: row, checked: checked)
    }
    
}
