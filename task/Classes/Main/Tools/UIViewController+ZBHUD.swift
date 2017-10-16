//
//  UIViewController+ZBHUD.swift
//  task
//
//  Created by 柏超曾 on 2017/10/16.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD
extension UIViewController{
    
   
    
    func showHint(hint :String ){
        
        
        //显示提示信息
//        UIView *view = [[UIApplication sharedApplication].delegate window];
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//        hud.userInteractionEnabled = NO;
//        hud.mode = MBProgressHUDModeText;
//        hud.labelText = hint;
//        hud.margin = 10.f;
//        hud.removeFromSuperViewOnHide = YES;
//        [hud hide:YES afterDelay:2];
    
    
    
//        let view : UIView = ((UIApplication.shared.delegate?.window)!)!
//        let hud : MBProgressHUD =  MBProgressHUD.showAdded(to: view, animated: true)
//        hud.isUserInteractionEnabled = false
//        hud.mode = MBProgressHUDMode.text
//        hud.label.text = hint
//        hud.margin = 10
//        hud.removeFromSuperViewOnHide = true
//        hud.hide(animated: true, afterDelay: TimeInterval.init(2))
        
 
        //只显示文字
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = MBProgressHUDMode.text
        hud.label.text = hint
        hud.margin = 10
        hud.offset.y = 50
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: 3)
        
    }
    
    
    
}

