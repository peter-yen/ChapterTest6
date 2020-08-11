//
//  AppDelegate.swift
//  ChapterTest6
//
//  Created by 嚴啟睿 on 2020/7/24.
//  Copyright © 2020 嚴啟睿. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        let vc = TabBarViewController()
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainTableViewController") as! MainTableViewController
//        let nc = UINavigationController(rootViewController: vc)
        window?.rootViewController = vc
        

                
        return true
    }


}

