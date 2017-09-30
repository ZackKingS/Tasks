//
//  String+Extension.swift
//  task
//
//  Created by 柏超曾 on 2017/9/30.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation
extension String {
    
    var MD5: String! {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        
        CC_MD5(str!, strLen, result)
        
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        
        result.deallocate(capacity: digestLen)
        
        return hash as String
    }
    
   
    
//    func md5() -> String {
//
//    let str = self.cString(using: String.Encoding.utf8)
//         let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8));
//        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
//          let result = UnsafeMutablePointer.allocate(capacity: digestLen)
//
//    CC_MD5(str!, strLen, result)
//
//    let hash = NSMutableString()
//
//    for i in 0 ..< digestLen {
//
//        hash.appendFormat("%02x", result[i])
//
//    }
//
//    result.deinitialize()
//
//    return String(format: hash as String)
//
//    }
//
}


