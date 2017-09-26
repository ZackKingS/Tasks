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
    
    

    @IBOutlet weak var sentSMS: UIButton!
    
    
    @IBAction func sentSMS(_ sender: Any) {
        
        
        
    }
    
    
    @IBAction func next(_ sender: Any) {
        
        
        let pwd = ZBSetPwdController()
        pwd.typecase = 1
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
