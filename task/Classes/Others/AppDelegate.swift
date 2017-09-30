//
//  AppDelegate.swift
//  task
//
//  Created by 柏超曾 on 2017/9/15.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        networkStatusManage()
       
        window = UIWindow(frame: UIScreen.main.bounds)
        let nav  = ZBNavVC.init(rootViewController: TasksViewController())
        self.window?.rootViewController = QQDRrawerViewController.drawerWithViewController(_leftViewcontroller: ZBLeftViewController.init(),_mainViewController: nav,DrawerMaxWithd: kMaxLeftOffset)
        self.window?.makeKeyAndVisible()

        
        
        if  (UserDefaults.standard.object(forKey: "everLaunched") == nil)  { //第一次启动
            UserDefaults.standard.set("YES", forKey: "everLaunched")
            UserDefaults.standard.set(false, forKey: ZBLOGIN_KEY)
        }
        
        
        
        
        
     
        return true
    }


    func networkStatusManage(){
        let manager = NetworkReachabilityManager(host: "https://github.com/Alamofire/Alamofire.git")
        
        manager!.listener = { status in
            switch status {
            case .notReachable:
                print("notReachable")
                UserDefaults.standard.set("a_notReachable_network", forKey: "network")
                
            case .unknown:
                print("unknown")
                UserDefaults.standard.set("b_unknown_network", forKey: "network")
            case .reachable(.ethernetOrWiFi):
                print("ethernetOrWiFi")
                UserDefaults.standard.set("c_ethernetOrWiFi_network", forKey: "network")
                
            case .reachable(.wwan):
                print("wwan")
                UserDefaults.standard.set("d_wwan_network", forKey: "network")
                
                
            }
        }
        manager!.startListening()
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

