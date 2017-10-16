//
//  ZBSetingController.swift
//  task
//
//  Created by 柏超曾 on 2017/9/26.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD
class ZBSetingController: UITableViewController {
    
    @IBOutlet weak var sizeBtn: UIButton!
    
    @IBOutlet weak var logoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfig()
        
   
        
    
        let s = " \(ZBCleanTool.fileSizeOfCache()) M"
        sizeBtn.setTitle(s, for: .normal)
        
    
     
    }
    
    
    @IBAction func clear(_ sender: Any) {
        
//        ZBCleanTool.clearCache()
//
//        SVProgressHUD.show()
//
//
//
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//
//
//
//            SVProgressHUD.showSuccess(withStatus: "")
//            SVProgressHUD.setAnimationDuration(1)
//            self.sizeBtn.setTitle(" 0 M", for: .normal)
//        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        if indexPath.row == 0 {
            return 50
        }else if indexPath.row == 1{
            return 50
        }else if  indexPath.row == 2{
            return screenHeight - 50 * 2 - 20
        }
        
        return 60
    }
    
    
    @IBAction func logout(_ sender: Any) {
        
        
        UserDefaults.standard.set(false, forKey: ZBLOGIN_KEY)
        UserDefaults.standard.synchronize()
        navigationController?.popViewController(animated: true)
    }
    
    
    func setupConfig(){
        
        
        tableView.backgroundColor = UIColor.white
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
        ] //UIFont(name: "Heiti SC", size: 24.0)!
        navigationItem.title = "设置";
        
        tableView.contentInset = UIEdgeInsets.init(top: -20, left: 0, bottom: 0, right: 0);
        self.tableView.sectionFooterHeight = 0;
        self.tableView.sectionHeaderHeight = screenHeight / 3;
        
        
        logoutBtn.layer.cornerRadius = kScornerRadius
        logoutBtn.layer.masksToBounds = true
        
        
        ZBCleanTool.fileSizeOfCachingg(completionHandler: { (size) in
            
            self.sizeBtn.setTitle((size  ), for: .normal)
        })
    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 0 {

            alcer()
            

        }else if indexPath.row == 1{
          print("1111")
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func alcer(){
        
        
        let alert = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // change the style sheet text color
        alert.view.tintColor = UIColor.black
        
        let actionCancel = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        let actionCamera = UIAlertAction.init(title: "确定", style: .default) { (UIAlertAction) -> Void in
            self.cleannn()
        }
        
       
      
        
        alert.addAction(actionCancel)
        alert.addAction(actionCamera)
    
        
        self.present(alert, animated: true, completion: nil)
    
    }
    
  
    private func cleannn(){
        
        ZBCleanTool.clearCache()
        
        SVProgressHUD.show()
        
        

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            SVProgressHUD.showSuccess(withStatus: "")
            SVProgressHUD.setAnimationDuration(1)
            self.sizeBtn.setTitle(" 0 M", for: .normal)
        }
        
    }
    
        
        
}
