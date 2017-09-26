//
//  ZBForgotPwdController.swift
//  task
//
//  Created by 柏超曾 on 2017/9/26.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation
import UIKit

class ZBForgotPwdController: UIViewController {
    
    
    typealias Tomato = (Int, Int) -> Int

    
   
    
    
    @IBOutlet weak var nextBtn: UIButton!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        let image = UIImage.init(named: "tintColor")
        
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)  //会有黑线
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfig()
        
       
    }
    
    
    
    @IBAction func next(_ sender: Any) {
        
        
        let pwd = ZBSetPwdController()
        pwd.typecase = 2
        navigationController?.pushViewController(pwd, animated: true)
        
    }
    
    
    
    
    func setConfig(){
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
        ] //UIFont(name: "Heiti SC", size: 24.0)!
        navigationItem.title = "找回密码";
        
        nextBtn.layer.cornerRadius = kLcornerRadius
        nextBtn.layer.masksToBounds = true
       
    }
}
