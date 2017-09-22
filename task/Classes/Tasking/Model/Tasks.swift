//
//  Tasks.swift
//  task
//
//  Created by 柏超曾 on 2017/9/22.
//  Copyright © 2017年 柏超曾. All rights reserved.
//


import UIKit

class Tasks:   NSObject {
    
    // MARK:- 属性
    var taskName : String?                // 微博创建时间
    var price : String?                    // 微博来源
    var beginDate : String?                      // 微博的正文
   var expitarionDate : String?
    var status : Int = 0
    var introText : String?
    var introPic : String?
    var taskPic : String?
    
    // MARK:- 自定义构造函数
    init(dict : [String : AnyObject]) {
        super.init()

        setValuesForKeys(dict)
        

    }
    
//    init(dict: [String: AnyObject]) {
//         super.init()
//
//        concern_id = dict["concern_id"] as? String
//        category = dict["category"] as? String
//        tip_new = dict["tip_new"] as? Int
//        web_url = dict["web_url"] as? String
//        icon_url = dict["icon_url"] as? String
//        flags = dict["flags"] as? Int
//        type = dict["type"] as? Int
//        name = dict["name"] as? String
//    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

