//
//  ZBTabbarVC.swift
//  go
//
//  Created by 柏超曾 on 2017/9/14.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation
import UIKit
class ZBTabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = UIColor(red: 245 / 255, green: 90 / 255, blue: 93 / 255, alpha: 1/0)
        
            addChildViewControllers()
    }
    

    
    
    private func addChildViewControllers(){
        
        
        addChildViewController(childController: TasksViewController(), title: "adv")
        addChildViewController(childController: MeVC(), title: "me")
        
    }
    
    private func addChildViewController(childController: UIViewController, title: String){
        childController.title = title
        let navC = ZBNavVC(rootViewController: childController)
        navC.navigationItem.title = title
        addChildViewController(navC)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
