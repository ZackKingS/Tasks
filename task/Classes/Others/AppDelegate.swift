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
import AdSupport
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,JPUSHRegisterDelegate {//
   
    

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        networkStatusManage()
       
        window = UIWindow(frame: UIScreen.main.bounds)

     
        // 得到当前应用的版本号
        let infoDictionary = Bundle.main.infoDictionary
        let currentAppVersion = infoDictionary!["CFBundleShortVersionString"] as! String
        // 取出之前保存的版本号
        let userDefaults = UserDefaults.standard
        let appVersion = userDefaults.string(forKey: "appVersion")
       let  storyboard = UIStoryboard.init(name: "ZBNewFeatureController", bundle: nil)
        
        

        
        
        
        let nav  = ZBNavVC.init(rootViewController: TasksViewController())
        self.window?.rootViewController = QQDRrawerViewController.drawerWithViewController(_leftViewcontroller: ZBLeftViewController.init(),_mainViewController: nav,DrawerMaxWithd: kMaxLeftOffset)
        self.window?.makeKeyAndVisible()
        
        
        
//        if appVersion == nil || appVersion != currentAppVersion {
//
//            userDefaults.setValue(currentAppVersion, forKey: "appVersion")
//            let guideViewController = storyboard.instantiateInitialViewController()
//            self.window?.rootViewController = guideViewController
//            self.window?.makeKeyAndVisible()
//
//        }else{
//
//            let nav  = ZBNavVC.init(rootViewController: TasksViewController())
//            self.window?.rootViewController = QQDRrawerViewController.drawerWithViewController(_leftViewcontroller: ZBLeftViewController.init(),_mainViewController: nav,DrawerMaxWithd: kMaxLeftOffset)
//            self.window?.makeKeyAndVisible()
//        }
   

        // 检测用户是不是第一次启动
        config()
        
//        NetworkTool.errorMessage(error: "2333333")
        
        //1. 任务详情的url是写死的
        //2. 跳转更新的url是写死的
       //3. 推送
        
//        let entity = JPUSHRegisterEntity();
//        entity.types = Int(JPAuthorizationOptions.alert.rawValue) |  Int(JPAuthorizationOptions.sound.rawValue) |  Int(JPAuthorizationOptions.badge.rawValue);
//        JPUSHService.register(forRemoteNotificationConfig: entity, delegate: self);
//        // 注册极光推送
//        JPUSHService.setup(withOption: launchOptions, appKey: "845b93e08c7fa192df019c07", channel:"Publish channel" , apsForProduction: false);
//        // 获取推送消息
//        let remote = launchOptions?[UIApplicationLaunchOptionsKey.remoteNotification] as? Dictionary<String,Any>;
//        // 如果remote不为空，就代表应用在未打开的时候收到了推送消息
//        if remote != nil {
//            // 收到推送消息实现的方法
////            self.perform(#selector(receivePush), with: remote, afterDelay: 1.0);
//        }

        
        return true
    }
    
    
    @available(iOS 10.0, *)
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, willPresent notification: UNNotification!, withCompletionHandler completionHandler: ((Int) -> Void)!) {


        print(">JPUSHRegisterDelegate jpushNotificationCenter willPresent")
    }

    @available(iOS 10.0, *)
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, didReceive response: UNNotificationResponse!, withCompletionHandler completionHandler: (() -> Void)!) {


        print(">JPUSHRegisterDelegate jpushNotificationCenter didReceive")
    }

 
    
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//
//
//        JPUSHService.handleRemoteNotification(userInfo)
////        let alert: String = userInfo["aps"]!["alert"]
////        var badge: Int = userInfo["aps"]!["badge"]
////        badge -= 1
////        JPUSHService.setBadge(badge)
////        UIApplication.shared.applicationIconBadgeNumber = 0
////        /**
////         *  iOS的应用程序分为3种状态
////         *      1、前台运行的状态UIApplicationStateActive；
////         *      2、后台运行的状态UIApplicationStateInactive；
////         *      3、app关闭状态UIApplicationStateBackground。
////         */
////        // 应用在前台 或者后台开启状态下，不跳转页面，让用户选择。
////        if (application.applicationState == UIApplicationState.active) || (application.applicationState == UIApplicationState.background){
////            UIAlertView(title: "推送消息", message: "\(alert)", delegate: nil, cancelButtonTitle: "确定").show()
////        }else{
////            //杀死状态下，直接跳转到跳转页面
////        }
////        // badge清零
////        application.applicationIconBadgeNumber = 0
////        JPUSHService.resetBadge()
////        completionHandler(UIBackgroundFetchResult.newData)
//
//
//    }
    
    
    
    func config(){
        
        let nowDate = NSDate(timeIntervalSinceNow: 0)
        // 时间戳的值
        let timeStamp:CLong  = CLong(nowDate.timeIntervalSince1970)
        print(timeStamp)
        

        print(UserDefaults.standard.bool(forKey: "LGFirstLaunch"))
        if !UserDefaults.standard.bool(forKey: "LGFirstLaunch") {
            UserDefaults.standard.set(false, forKey: ZBLOGIN_KEY)
            UserDefaults.standard.set(true, forKey: "LGFirstLaunch")
            UserDefaults.standard.synchronize()
        }
        
    }

    func networkStatusManage(){
        let manager = NetworkReachabilityManager(host: "https://www.baidu.com")
        
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

