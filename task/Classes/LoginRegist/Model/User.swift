//
//  User.swift
//  task
//
//  Created by 柏超曾 on 2017/9/28.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation
class User : NSObject, NSCoding {
   
    
    var  avatar : String?
    var  alipay : String?
    var  credit_card : String?
    var  id : String?
    var  nickname : String?
    var  account : String?
    var  finished : String?
    var  username : String?
    var  email : String?
    var  tel : String?
    var  usersig : String?
    
    
    // MARK:- 自定义构造函数  KVC实现字典转模型
    init(dict : [String : AnyObject]) {
        super.init()
        
        //        setValuesForKeys(dict)
        
        avatar = dict["avatar"]! as? String
        alipay = dict["alipay"]! as? String
        finished = dict["finished"]! as? String
        
        
        nickname = dict["nickname"]! as? String
        id = dict["id"]! as? String
        
        tel = dict["tel"]! as? String
        
        
        
        
    }
    
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
    
    struct PropertyKey {
        static let id = "id"
        static let nickname = "nickname"
        static let username = "username"
        static let tel = "tel"
       
    }
    


    required init?(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObject(forKey: PropertyKey.id) as? String
        nickname = aDecoder.decodeObject(forKey: PropertyKey.nickname) as? String
        tel = aDecoder.decodeObject(forKey: PropertyKey.tel) as? String

    }



    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: PropertyKey.id)
        aCoder.encode(nickname, forKey: PropertyKey.nickname)
        aCoder.encode(tel, forKey: PropertyKey.tel)



    }

   

    
  
    
}
