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
    var title : String?                // 微博创建时间
    var price : String?                    // 微博来源
    var start_time : String?                      // 微博的正文
   var deadline : String?
    var id : String?
     var status : String?
    
    // MARK:- 自定义构造函数
    init(dict : [String : AnyObject]) {
        super.init()

        setValuesForKeys(dict)


    }
    
    
    
    
    init(dictt: [String: JSON]) {
        
         super.init()

      
        print(dictt["id"]?.stringValue as String!)
        
        id =  dictt["id"]?.stringValue as String!
        
        print(id)
        
        title =  dictt["title"]?.stringValue as String!
        price =  dictt["price"]?.stringValue as String!
        status =  dictt["status"]?.stringValue as String!
        start_time =  dictt["start_time"]?.stringValue as String!
        deadline =  dictt["deadline"]?.stringValue as String!
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

