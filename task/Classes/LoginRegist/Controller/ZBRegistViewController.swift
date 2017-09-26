//
//  ZBRegistViewController.swift
//  task
//
//  Created by 柏超曾 on 2017/9/26.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation
import UIKit

class ZBRegistViewController: UIViewController {
    
    
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
    
    
    @IBAction func next(_ sender: Any) {
        
        navigationController?.pushViewController(ZBSetPwdController(), animated: true)
        
    }
    
    
    func setConfig(){
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
        ] //UIFont(name: "Heiti SC", size: 24.0)!
        navigationItem.title = "注册";
        
        nextBtn.layer.cornerRadius = kLcornerRadius
        nextBtn.layer.masksToBounds = true
//        phoneTF.attributedPlaceholder = NSAttributedString.init(string:"手机号", attributes: [  NSForegroundColorAttributeName:UIColor.white])
//        pwdTF.attributedPlaceholder = NSAttributedString.init(string:"密码", attributes: [  NSForegroundColorAttributeName:UIColor.white])
    }
}
