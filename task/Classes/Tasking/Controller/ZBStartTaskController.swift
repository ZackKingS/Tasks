//
//  ZBStartTaskController.swift
//  task
//
//  Created by 柏超曾 on 2017/9/27.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation
import UIKit
import Photos
import MobileCoreServices
import Alamofire
import SwiftyJSON
class ZBStartTaskController: UIViewController  ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var bottomView: UIView!
    
    
    @IBOutlet weak var picV: UIImageView!
    
    @IBOutlet weak var takeCame: UIButton!
    
    
    static  var picImage :UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfig()
        
        
        
        
    }
    
    // 完成拍照
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let mediaType = info[UIImagePickerControllerMediaType] as! String;
        if mediaType == kUTTypeImage as String { // 图片类型
            var image: UIImage? = nil

            if picker.isEditing { // 拍照图片运行编辑，则优先尝试从编辑后的类型中获取图片
                image = info[UIImagePickerControllerEditedImage] as? UIImage
            }else{
                image = info[UIImagePickerControllerOriginalImage] as? UIImage
            }
            
            picV.image = image;
            
            ZBStartTaskController.picImage = image
            
//            let data = UIImageJPEGRepresentation(UIImage.init(named: "pwd_lock")!, 0.5)!
//
////            let user : User = NSKeyedUnarchiver.unarchiveObject(with: data as! Data  )  as! User
//
//            let para = ["userid":"123","taskid":"1"]
//            upLoadImageRequest(urlString: API_UPLOADIMAGE_URL, params: para as! [String : String], data:data, name: ["result"], success: { (dic ) in
//                print(dic)
//            }, failture: { (error) in
//
//                print(error)
//
//            })
            
            
          

        }
    }
  
    

  
    
    func up(){
        
        
//        Alamofire.uploa
        
        
    }
    
    
    @IBAction func photoComeIn(_ sender: Any) {
        
        let alert = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // change the style sheet text color
        alert.view.tintColor = UIColor.black
        
        let actionCancel = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        let actionCamera = UIAlertAction.init(title: "拍照", style: .default) { (UIAlertAction) -> Void in
            self.selectByCamera()
        }
        
        let actionPhoto = UIAlertAction.init(title: "从手机照片中选择", style: .default) { (UIAlertAction) -> Void in
            self.selectFromPhoto()
        }
        
        alert.addAction(actionCancel)
        alert.addAction(actionCamera)
        alert.addAction(actionPhoto)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    // 拍照获取
    private func selectByCamera(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera // 调用摄像头
        imagePicker.cameraDevice = .rear // 后置摄像头拍照
        imagePicker.cameraCaptureMode = .photo // 拍照
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        imagePicker.mediaTypes = [kUTTypeImage as String]
        
        imagePicker.modalPresentationStyle = .popover
        self.show(imagePicker, sender: nil)
    }
    
    
    /**
     * 用户相册未授权，Dialog提示
     */
    private func showNoPermissionDailog(){
        let alert = UIAlertController.init(title: nil, message: "没有打开相册的权限", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "确定", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

    
    /**
     * 从相册中选择图片
     */
    private func selectFromPhoto(){
        PHPhotoLibrary.requestAuthorization {[unowned self] (status) -> Void in
            DispatchQueue.main.async {
                switch status {
                case .authorized:
                    self.showLocalPhotoGallery()
                    break
                default:
                    self.showNoPermissionDailog()
                    break
                }
            }
        }
    }
    /**
     * 打开本地相册列表
     */
    private func showLocalPhotoGallery(){
       let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .savedPhotosAlbum // 调用摄像头
        imagePicker.delegate = self
        imagePicker.mediaTypes = [kUTTypeImage as String]
        
        imagePicker.modalPresentationStyle = .popover
        self.show(imagePicker, sender: nil)
    }

    
    
    @IBAction func next(_ sender: Any) {
        
  
        let data = UIImageJPEGRepresentation( ZBStartTaskController.picImage!, 0.5)!

        
//        let data = UIImageJPEGRepresentation( UIImage.init(named: "sucess")!, 0.5)!
          let dataa =     UserDefaults.standard.object(forKey: "user") as! NSData
        let user : User = NSKeyedUnarchiver.unarchiveObject(with: dataa as Data   )  as! User
        
        let para = ["userid":user.id,"taskid":"5"]
        upLoadImageRequest(urlString: API_UPLOADIMAGE_URL, params: para as! [String : String], data:data, name: ["result"], success: { (dic ) in
            print(dic)
        }, failture: { (error) in
            
            print(error)
            
        })

 
    }
    
    

    func upLoadImageRequest(urlString : String, params:[String:String], data: Data, name: [String],success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()){
        

        
        let headers = ["content-type":"multipart/form-data"]
        Alamofire.upload(
            multipartFormData: { multipartFormData in

                multipartFormData.append((params["userid"]!.data(using: String.Encoding.utf8)!), withName: "userid")
                multipartFormData.append( (params["taskid"]!.data(using: String.Encoding.utf8)!), withName: "taskid")
                multipartFormData.append( data, withName: "result", fileName: "na.png", mimeType: "image/jpeg")
        },
            to: API_UPLOADIMAGE_URL,
            
            headers: headers,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    
                    
                    
                    self.navigationController?.pushViewController(ZBTaskSuccessController(), animated: true)
                    
                    
                    upload.responseJSON { response in
                        debugPrint(response)
                        
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
        }
        )
        
        
    }
    
    
    
    func FileUpload(File: Data,FileName: String) {
        
        print("文件大小为：\(Double(File.count)/1000000.0) MB")
        
        
        var uploadTask : URLSessionUploadTask!
        //进度
//        let timer = Timer.new(every: 0.01.second) {
//
//            let x:CGFloat = (CGFloat)(uploadTask.countOfBytesSent)
//            let y:CGFloat = (CGFloat)(uploadTask.countOfBytesExpectedToSend)
//
//            self.progressView.progress = Float(x/y)
//        }
        
        
        
//        +  "userid=100071&taskid=1"
        //上传地址
        let url = URL(string:   API_UPLOADIMAGE_URL  )
        //请求
        var request = URLRequest(url: url!, cachePolicy: .reloadIgnoringCacheData)
        request.httpMethod = "POST"
        
        let session = URLSession.shared
        
        
        uploadTask = session.uploadTask(with: request, from: File) {
            (data:Data?, response:URLResponse?, error:Error?) -> Void in
            //上传完毕后
            if error != nil{
                print(error!)
            }else{
                
                let str = String(data: data!, encoding: String.Encoding.utf8)
                print("上传完毕：\(str!)")
//                timer.invalidate()
                
            }
        }
        
        //使用resume方法启动任务
        uploadTask.resume()
        
//        timer.start()
        
        
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
