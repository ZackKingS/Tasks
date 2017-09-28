//
//  ZBRegistViewController.swift
//  task
//
//  Created by 柏超曾 on 2017/9/26.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD
class ZBRegistViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var phoneNumL: UITextField!
    
    @IBOutlet weak var smsTF: UITextField!
    
    @IBOutlet weak var nickTF: UITextField!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
       let image = UIImage.init(named: "tintColor")
        
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)  //会有黑线
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfig()
        
       
    }
    
    

    @IBOutlet weak var sentSMS: UIButton!
    
    
    @IBAction func sentSMS(_ sender: Any) {
        
        
     
     
        
      // todo  手机号正则过滤
        
        let str = API_GETSMS_URL + "?tel=\(phoneNumL.text!)&action=0"
        NetworkTool.getMesa( url: str  ){ (result) in

            SVProgressHUD.showSuccess(withStatus: "")
            SVProgressHUD.dismiss(withDelay: TimeInterval.init(1))
            
            print(result ?? "213")

        }

        
        
    }
    
    
    @IBAction func next(_ sender: Any) {
        
        
        
       
        
        
        let pwd = ZBSetPwdController()
        pwd.typecase = 1
        pwd.phone =  phoneNumL.text
          pwd.sms =  smsTF.text
          pwd.nickName =  nickTF.text
        
        navigationController?.pushViewController(pwd, animated: true)
        
    }
    
    
    func setConfig(){
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
        ] //UIFont(name: "Heiti SC", size: 24.0)!
        navigationItem.title = "注册";
        
        nextBtn.layer.cornerRadius = kLcornerRadius
        nextBtn.layer.masksToBounds = true

    }
}
