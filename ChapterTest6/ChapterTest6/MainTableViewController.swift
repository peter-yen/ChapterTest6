//
//  MainController.swift
//  ChapterTest6
//
//  Created by 嚴啟睿 on 2020/7/24.
//  Copyright © 2020 嚴啟睿. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
  
  var missionArray: [Mission] = []
//  var editingMission: Mission?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .darkGray
    
    let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonItemDidTap))
    self.navigationItem.rightBarButtonItem = barButtonItem
    
//    tableView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
    getPreviousMissions()
    tableView.keyboardDismissMode = .onDrag
    
    
  }
  
  func getPreviousMissions() {
    if let missions = UserDefaults.standard.value(forKey: "missions") as? [[String: Any]] {
      for m in missions {
        if let title = m["title"] as? String {
          if let done = m["done"] as? Bool {
            let mission = Mission(title: title, done: done)
            missionArray.append(mission)
          }
        }

      }
      tableView.reloadData()
    }
  }
  
  
  @objc func viewDidTap() {
    view.endEditing(true)
  }
  
  @objc func addBarButtonItemDidTap() {
    
    var indexPath: IndexPath!
    
    let mission = Mission(title: "", done: false)
    missionArray.append(mission)
    
    if missionArray.count > 0 {
      let lastRow = missionArray.count - 1
      indexPath = IndexPath(row: lastRow, section: 0)
      tableView.insertRows(at: [indexPath], with: .automatic)
    } else {
      indexPath = IndexPath(row: 0, section: 0)
      tableView.insertRows(at: [indexPath], with: .automatic)
    }
  
    if let cell = tableView.cellForRow(at: indexPath) as? MainTableViewCell {
      cell.titleTextField.becomeFirstResponder()
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return missionArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableViewCell", for: indexPath) as! MainTableViewCell
    let mission = missionArray[indexPath.row]
    cell.mainTableViewController = self
    cell.row = indexPath.row
    cell.titleTextField.text = mission.title
    cell.titleTextField.delegate = self
    cell.titleTextField.tag = indexPath.row
    cell.titleTextField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
    if mission.done == true {
      cell.checkedButton.backgroundColor = .black
    } else {
      cell.checkedButton.backgroundColor = .red
    }

    return cell
  }
    func checkedButtonDidTap(row: Int, checked: Bool) {
        missionArray[row].done = checked
        var missionsDict = [[String: Any]]()
        for m in missionArray {
          let missionDict = m.dictionary()
          missionsDict.append(missionDict)
        
    }
    
    }
  
  @objc func textFieldEditingChanged(_ textField: UITextField) {
    
    if let text = textField.text {
      print(textField.tag)
      missionArray[textField.tag].title = text
      
      var missionsDict = [[String: Any]]()
      for m in missionArray {
        let missionDict = m.dictionary()
        missionsDict.append(missionDict)
      }
      
      UserDefaults.standard.set(missionsDict, forKey: "missions")
      
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
    missionArray.remove(at: indexPath.row)
    var missionsDict = [[String: Any]]()
    for m in missionArray {
        let missionDict = m.dictionary()
      missionsDict.append(missionDict)
    }
    
    UserDefaults.standard.set(missionsDict, forKey: "missions")
    tableView.deleteRows(at: [indexPath], with: .fade)
    
  }
  
}

extension MainTableViewController: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
  }

  func textFieldDidBeginEditing(_ textField: UITextField) {
//    print(textField.gestureRecognizers)
//    textField.isFirstResponder
//    if let text = textField.text {
//      print(text)
//      let editingMission = Mission(title: text, done: false)
//      missionArray.append(editingMission)
//    }
    
  }

}
