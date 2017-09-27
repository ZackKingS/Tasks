//
//  TaskDetailViewController.swift
//  task
//
//  Created by 柏超曾 on 2017/9/22.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation
import UIKit


class TaskDetailViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
         setConfig()

      view.backgroundColor = UIColor.white
    }

  
    
    @IBAction func start(_ sender: Any) {
        
        navigationController?.pushViewController(ZBStartTaskController(), animated: true)
        
        
    }
    

    func setConfig(){

        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
        ] //UIFont(name: "Heiti SC", size: 24.0)!
        navigationItem.title = "任务详情";



        startBtn.layer.cornerRadius = kScornerRadius
        startBtn.layer.masksToBounds = true

    }
}

