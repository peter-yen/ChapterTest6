//
//  TabBarViewController.swift
//  ChapterTest6
//
//  Created by 嚴啟睿 on 2020/8/8.
//  Copyright © 2020 嚴啟睿. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = MainTableViewController()
        vc1.tabBarItem.image = UIImage(named: "iosph")
        viewControllers = [vc1]
    }
    

}
