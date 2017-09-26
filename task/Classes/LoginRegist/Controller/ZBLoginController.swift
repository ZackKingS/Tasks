//
//  ZBLoginController.swift
//  task
//
//  Created by 柏超曾 on 2017/9/26.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation

import UIKit

class ZBLoginController: UIViewController {
    
    @IBOutlet weak var phoneTF: UITextField!
    
    @IBOutlet weak var pwdTF: UITextField!
    
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    @IBOutlet weak var close: UIButton!
    
    
    @IBAction func login(_ sender: Any) {
        
      dismiss(animated: true, completion: nil)
        
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
        
       

        
        
        let para =  ["a":"3","b":"4"]  as [String : AnyObject]
        NetworkTool.bbb( url:"https://httpbin.org/get",   parameters : para ){ (result) in

            print(result ?? "213")

        }
   
      
      
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
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(autoLogin), name: NSNotification.Name(rawValue: "autoLogin"), object: nil)
        
        
        loginBtn.layer.cornerRadius = kLcornerRadius
        loginBtn.layer.masksToBounds = true
        phoneTF.attributedPlaceholder = NSAttributedString.init(string:"手机号", attributes: [  NSForegroundColorAttributeName:UIColor.white])
        pwdTF.attributedPlaceholder = NSAttributedString.init(string:"密码", attributes: [  NSForegroundColorAttributeName:UIColor.white])
    }
    
    
    func autoLogin() {
        
        dismiss(animated: true, completion: nil)
        
        
        
    }
    
    
}
