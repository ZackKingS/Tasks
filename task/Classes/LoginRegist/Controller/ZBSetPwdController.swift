//
//  ZBSetPwdController.swift
//  task
//
//  Created by 柏超曾 on 2017/9/26.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation

import UIKit
import SVProgressHUD
class ZBSetPwdController: UIViewController {
    
     var typecase : Int = 0

    
    @IBOutlet weak var commitBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfig()
    }
    
    
    @IBAction func commit(_ sender: Any) {
        
        
        switch typecase {
        case 1: 
            print("reg")
            
            SVProgressHUD.show()
            
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                
                SVProgressHUD.dismiss()
                self.navigationController?.popToRootViewController(animated: true)
                
                
                NotificationCenter.default.post(Notification.init(name: Notification.Name(rawValue: "autoLogin")))
                
            }
            
        case 2:
            print("forgetpwd")
            
            navigationController?.pushViewController(ZBGetPwdBackedController(), animated: true)
            
            
        default:
            print("xxx")
        }
        
        
        
      
        
      
        
     
        
        
    }
    func setConfig(){
        
        commitBtn.layer.cornerRadius = kLcornerRadius
        commitBtn.layer.masksToBounds = true
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
        ] //UIFont(name: "Heiti SC", size: 24.0)!
        navigationItem.title = "设置密码";
    }
}
