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
        
        
        
        
        
    }
    
    
    @IBAction func close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
       navigationController?.navigationBar.subviews[0].removeFromSuperview()//去掉NavigationBar的背景和横线
        
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)  //会有黑线
        
         navigationController?.navigationBar.shadowImage = UIImage()
        ////        UINavigationBar.c
        //
        //        let navBar = UINavigationBar.appearance()
        //        navBar.barTintColor = UIColor.clear
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        setConfig()
        
        
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var register: UIButton!
    
    
    @IBAction func regist(_ sender: Any) {
        
          navigationController?.pushViewController(ZBRegistViewController(), animated: true)
       
       
        
        
    }
    
    
    
    func setConfig(){
        loginBtn.layer.cornerRadius = 20
        loginBtn.layer.masksToBounds = true
        phoneTF.attributedPlaceholder = NSAttributedString.init(string:"手机号", attributes: [  NSForegroundColorAttributeName:UIColor.white])
        pwdTF.attributedPlaceholder = NSAttributedString.init(string:"密码", attributes: [  NSForegroundColorAttributeName:UIColor.white])
    }
    
    
    
}
