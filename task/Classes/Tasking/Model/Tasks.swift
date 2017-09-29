//
//  Tasks.swift
//  task
//
//  Created by 柏超曾 on 2017/9/22.
//  Copyright © 2017年 柏超曾. All rights reserved.
//


import UIKit
import SwiftyJSON
class Tasks:   NSObject {
    
    // MARK:- 属性
    var taskName : String?                // 微博创建时间
    var price : String?                    // 微博来源
    var beginDate : String?                      // 微博的正文
   var expitarionDate : String?
    var status : String?
    var introText : String?
    var introPic : String?
    var taskPic : String?
    
    // MARK:- 自定义构造函数
    init(dict : [String : AnyObject]) {
        super.init()

        setValuesForKeys(dict)
        

    }
    
    init(dict: [String: JSON]) {
         super.init()

      
        id =  dict["id"]?.stringValue as String!
        nictitlekname =  dict["title"]?.stringValue as String!
        id =  dict["id"]?.stringValue as String!
        account =  dict["account"]?.stringValue as String!
        finished =  dict["finished"]?.stringValue as String!
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

