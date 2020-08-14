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
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainTableViewController") as! MainTableViewController
        let nc = UINavigationController(rootViewController: vc)
        nc.tabBarItem.image = UIImage(named: "iosph")
        let vc2 = CovidViewController()
        vc2.tabBarItem.image = UIImage(named: "search")
        let vc3 = TaipeiViewController()
        vc3.tabBarItem.image = UIImage(named: "Dog")
        let vc4 = PhotoViewController()
        vc4.tabBarItem.image = UIImage(named: "home")
        viewControllers = [nc, vc2, vc3, vc4]
    }
    
    
}
