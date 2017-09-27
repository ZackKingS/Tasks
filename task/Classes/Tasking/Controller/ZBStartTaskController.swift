//
//  ZBStartTaskController.swift
//  task
//
//  Created by 柏超曾 on 2017/9/27.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation
import UIKit

class ZBStartTaskController: UIViewController {
    
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfig()
        
        
        
        
    }
    
    @IBAction func next(_ sender: Any) {
        
  
            navigationController?.pushViewController(ZBTaskUnderReviewController(), animated: true)
 
    }
    
    
    func setConfig(){
        

        topView.layer.masksToBounds = true;
        topView.layer.borderWidth = 1
        topView.layer.borderColor  = UIColor.init(r: 179, g: 179, b: 179 ).cgColor
        topView.layer.cornerRadius = 8
        
        bottomView.layer.masksToBounds = true;
        bottomView.layer.borderWidth = 1
        bottomView.layer.borderColor  = UIColor.init(r: 179, g: 179, b: 179 ).cgColor
        bottomView.layer.cornerRadius = 8
        
        
        
        
        
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
        ] //UIFont(name: "Heiti SC", size: 24.0)!
        navigationItem.title = "开始任务";
        
        nextBtn.layer.cornerRadius = kScornerRadius
        nextBtn.layer.masksToBounds = true
        
    }
}
