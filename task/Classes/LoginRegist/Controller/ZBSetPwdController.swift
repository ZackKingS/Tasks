//
//  ZBSetPwdController.swift
//  task
//
//  Created by 柏超曾 on 2017/9/26.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit
import SVProgressHUD
class ZBSetPwdController: UIViewController {
    
     var typecase : Int = 0

    
    
    var phone: String?
    var sms: String?
    var nickName: String?
    
    @IBOutlet weak var pwd_f: UITextField!
    
    @IBOutlet weak var pwd_s: UITextField!
    
    @IBOutlet weak var commitBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfig()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        pwd_s.resignFirstResponder()
        pwd_f.resignFirstResponder()
    }
    
    @IBAction func commit(_ sender: Any) {
        
        
        let str1 = pwd_s.text as! String
        let str2 = pwd_f.text as! String
        if    !(str1 == str2 ) {
            SVProgressHUD.showError(withStatus: "两次输入密码不同")
            SVProgressHUD.dismiss(withDelay: TimeInterval.init(1))
            return
        }
        
        
        
        switch typecase {
        case 1: 
            print("reg")  //注册
            
              SVProgressHUD.show()
            let para =  ["tel":phone!,"verifycode":sms! ,"nickname" : nickName!,"password":pwd_s.text!]  as [String : AnyObject]
          
            NetworkTool.postMesa(url: API_REGISTE_URL, parameters: para) { (value) in
              
                let json = JSON(value ?? "123")
                let dataDict   = json["data"].dictionaryValue
                
                
                
                let user : User = User.init(dict: (dataDict as [String : JSON] ))
                print(user.tel!)
                
                
                let data = NSKeyedArchiver.archivedData(withRootObject: user) as NSData
                UserDefaults.standard.set(data, forKey: "user")

                
                UserDefaults.standard.set(true, forKey: ZBLOGIN_KEY)
                
                
                SVProgressHUD.dismiss()
                self.navigationController?.popToRootViewController(animated: true)

                
                  NotificationCenter.default.post(name: NSNotification.Name(rawValue: "autoLogin"), object: self, userInfo: nil)
                
            }
            
            
            
            
            
          
            
        case 2:
            print("forgetpwd")
            
            
            SVProgressHUD.show()
            let para =  ["tel":phone!,"verifycode":sms! ,"password":pwd_s.text!]  as [String : AnyObject]
            
            NetworkTool.postMesa(url: API_GETPWDBACK_URL, parameters: para) { (value) in
                
                let json = JSON(value ?? "123")
                 SVProgressHUD.dismiss()
                let dataDict   = json["data"].dictionaryValue
                let user : User = User.init(dict: (dataDict as [String : JSON] ))
                let data = NSKeyedArchiver.archivedData(withRootObject: user) as NSData
                UserDefaults.standard.set(data, forKey: "user")
                UserDefaults.standard.set(true, forKey: ZBLOGIN_KEY)

               self.navigationController?.pushViewController(ZBGetPwdBackedController(), animated: true)
                
            }
            
            
         
            
            
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
