//
//  ZBLoginController.swift
//  task
//
//  Created by 柏超曾 on 2017/9/26.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit
import SVProgressHUD
class ZBLoginController: UIViewController {
    
    @IBOutlet weak var phoneTF: UITextField!
    
    @IBOutlet weak var pwdTF: UITextField!
    
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    @IBOutlet weak var close: UIButton!
    
    
    @IBAction func login(_ sender: Any) {
        
    SVProgressHUD.show()
        
        
        let para = ["tel":phoneTF.text,"password":pwdTF.text?.MD5] as [String : AnyObject]

//        let para = ["tel":"17386014224","password":"111111"] as [String : AnyObject]
        
        NetworkTool.postMesa(url: API_LOGIN_URL, parameters: para) { (value) in
            let json = JSON(value ?? "123")
            
            
            print(json)
            
    
            
            let errorStr   = json["errorno"].stringValue
            
            if errorStr ==  "20032" {
                SVProgressHUD.showError(withStatus: json["message"].stringValue)
                SVProgressHUD.dismiss(withDelay: TimeInterval.init(1))
                return
            }else if errorStr ==  "20031" {
                SVProgressHUD.showError(withStatus: json["message"].stringValue)
                   SVProgressHUD.dismiss(withDelay: TimeInterval.init(1))
                return
            }else if errorStr ==  "20032" {
                SVProgressHUD.showError(withStatus: json["message"].stringValue)
                   SVProgressHUD.dismiss(withDelay: TimeInterval.init(1))
                return
            }
            
          
            
            let dataDict   = json["data"].dictionaryValue
            let user : User = User.init(dict: (dataDict as [String : JSON] ))
            let data = NSKeyedArchiver.archivedData(withRootObject: user) as NSData
            UserDefaults.standard.set(data, forKey: USER)
            

            SVProgressHUD.dismiss()
              self.dismiss(animated: true, completion: nil)
        }
        
        
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        phoneTF.resignFirstResponder()
        pwdTF.resignFirstResponder()
    }
    
    
    
    @IBAction func close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)  //会有黑线
        
         navigationController?.navigationBar.shadowImage = UIImage()
      
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        setConfig()
        
       


      
      
    }
    
    typealias Tomato = (Int, Int) -> Int
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        
    }
    
  
    
    
    @IBOutlet weak var register: UIButton!
    
    
    @IBAction func regist(_ sender: Any) {
        
          navigationController?.pushViewController(ZBRegistViewController(), animated: true)
       

    }
    
    
    @IBOutlet weak var forgetPwd: UIButton!
    
    
    @IBAction func forgetPwd(_ sender: Any) {
        
        navigationController?.pushViewController(ZBForgotPwdController(), animated: true)
        
    }
    
    
    func setConfig(){
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(autoLogin(notification:)), name: NSNotification.Name(rawValue: "autoLogin"), object: nil)
        
        
        loginBtn.layer.cornerRadius = kLcornerRadius
        loginBtn.layer.masksToBounds = true
        phoneTF.attributedPlaceholder = NSAttributedString.init(string:"手机号", attributes: [  NSForegroundColorAttributeName:UIColor.white])
        pwdTF.attributedPlaceholder = NSAttributedString.init(string:"密码", attributes: [  NSForegroundColorAttributeName:UIColor.white])
    }
    
    
    func autoLogin(notification: Notification) {
        
        dismiss(animated: true, completion: nil)
        
        
        
//        SVProgressHUD.show()
//        let para =  ["tel":phone!,"verifycode":sms! ,"nickname" : nickName!,"password":pwd_s.text!]  as [String : AnyObject]
//
//        NetworkTool.postMesa(url: API_REGISTE_URL, parameters: para) { (result) in
//            print(result ?? "213")
//
//            SVProgressHUD.dismiss()
//            self.navigationController?.popToRootViewController(animated: true)
//            NotificationCenter.default.post(Notification.init(name: Notification.Name(rawValue: "autoLogin")))
//
//
//
//
//        }
        
    }
    
    
}
