//
//  ZBCleanTool.swift
//  task
//
//  Created by 柏超曾 on 2017/9/26.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation
class ZBCleanTool: NSObject {
    
    
    
//    //test
//    class func fileSizeOfCaching(   completionHandler:@escaping (_ size: Int)->()) {
//        
//        
//        print("1")
//        
//        //开启子线程
//        DispatchQueue.global().async {
//            
//             print("6")
//            
//            // 取出cache文件夹目录 缓存文件都在这个目录下
//            let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
//            //缓存目录路径
//            // 取出文件夹下所有文件数组
//            let fileArr = FileManager.default.subpaths(atPath: cachePath!)
//            //快速枚举出所有文件名 计算文件大小
//            var size = 0
//            for file in fileArr! {
//                // 把文件名拼接到路径中
//                let path = (cachePath! as NSString).appending("/\(file)")
//                // 取出文件属性
//                let floder = try! FileManager.default.attributesOfItem(atPath: path)
//                // 用元组取出文件大小属性
//                for (abc, bcd) in floder {
//                    // 累加文件大小
//                    if abc == FileAttributeKey.size {
//                        size += (bcd as AnyObject).integerValue
//                    }
//                }
//            }
//            
//
//            var mm  = size // 单位是kb
////            mm =  mm / 1024 / 1024 
//
//            
//               print("2")
//            
//            //回到主线程 执行闭包
//            DispatchQueue.main.async(execute: {
//                
//       
//                  print("3")
//                completionHandler(mm)
//            })
//            
//            
//              print("4")
//          
//            
//        }
//        
//        
//          print("5")
//       
//        
//    }
//    

    
    
    
    
    
    
    //test
    class func fileSizeOfCachingg(   completionHandler:@escaping (_ size: String)->()) {
        
        
        print("1")
        
        //开启子线程
        DispatchQueue.global().async {
            
            print("6")
            
            // 取出cache文件夹目录 缓存文件都在这个目录下
            let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
            //缓存目录路径
            // 取出文件夹下所有文件数组
            let fileArr = FileManager.default.subpaths(atPath: cachePath!)
            //快速枚举出所有文件名 计算文件大小
            var size = 0
            for file in fileArr! {
                // 把文件名拼接到路径中
                let path = (cachePath! as NSString).appending("/\(file)")
                // 取出文件属性
                let floder = try! FileManager.default.attributesOfItem(atPath: path)
                // 用元组取出文件大小属性
                for (abc, bcd) in floder {
                    // 累加文件大小
                    if abc == FileAttributeKey.size {
                        size += (bcd as AnyObject).integerValue
                    }
                }
            }
            


            //回到主线程 执行闭包
            DispatchQueue.main.async(execute: {
                
                var str : String = ""
                
                var realSize : Int = size
                
                if realSize < 1024  {
                    
                    str = str.appendingFormat("%dB", realSize)
                
                }else if      size > 1024  &&   size < 1024 *  1024  {
                    
                    
                    realSize = realSize / 1024
                    str = str.appendingFormat("%dKB", realSize)
                
                }else if      size > 1024 * 1024  &&   size < 1024 *  1024  * 1024  {
                    
                    realSize = realSize / 1024 / 1024
                    str = str.appendingFormat("%dM", realSize)
                }
             
                completionHandler(str)
            })
            
            
          
            
            
        }
        
   
        
        
    }
    
    
    
//    //1.统计缓存文件大小
  class  func fileSizeOfCache()-> Int {

      // 取出cache文件夹目录 缓存文件都在这个目录下
        let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        //缓存目录路径
        // 取出文件夹下所有文件数组
        let fileArr = FileManager.default.subpaths(atPath: cachePath!)
        //快速枚举出所有文件名 计算文件大小
    var size = 0
        for file in fileArr! {
            // 把文件名拼接到路径中
            let path = (cachePath! as NSString).appending("/\(file)")
            // 取出文件属性
            let floder = try! FileManager.default.attributesOfItem(atPath: path)
            // 用元组取出文件大小属性
            for (abc, bcd) in floder {
                // 累加文件大小
                if abc == FileAttributeKey.size {
                    size += (bcd as AnyObject).integerValue
                }
            }
        }
    
    
    
    var mm  = size // 单位是kb
    mm =  mm / 1024 / 1024 
    return mm
    }


  class  func clearCache() {
        // 取出cache文件夹目录 缓存文件都在这个目录下
        let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        // 取出文件夹下所有文件数组
        let fileArr = FileManager.default.subpaths(atPath: cachePath!)
        // 遍历删除
    
    
   
        for file in fileArr! {
            
            if file.contains("Snapshots") { continue}
            
            if file.contains("com.fix.task") { continue}
            
            let path = (cachePath! as NSString).appending("/\(file)")
            if FileManager.default.fileExists(atPath: path) {
                do {
                    try FileManager.default.removeItem(atPath: path)
                } catch {
                    
                }
            }
        }
    }


    
  
    
    
   
    

}
