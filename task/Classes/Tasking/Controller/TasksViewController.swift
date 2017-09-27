//
//  TasksViewController.swift
//  go
//
//  Created by 柏超曾 on 2017/9/14.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation
import UIKit
import SwiftTheme
import Alamofire

import SVProgressHUD

class TasksViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var tableView : UITableView?
    fileprivate var array = [TopicTitle]()
    
    
    var leftBtn :UIButton?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//         设置导航栏颜色

    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        layoutDecisionByNetwork()
     
         setupNavBar()
        addNotifications()
        
    
    }
    
    
    
    
    func layoutDecisionByNetwork(){
        
        let reachability = Reachability()  // 准备获取网络连接信息
        
        if (reachability?.isReachable)! { // 判断网络连接状态
     
      
            setupTableVie()
            setRefresh()
            
        } else {
          
        
            //no_network_Page
            let box = UIView()
            box.backgroundColor = UIColor.white
            self.view.addSubview(box)
            box.snp.makeConstraints { (make) -> Void in
                make.edges.equalToSuperview()
                
            }
            
            
            let errorV = UIImageView()
            errorV.image = UIImage.init(named: "net_error")
            box.addSubview(errorV)
            errorV.snp.makeConstraints { (make) -> Void in
                make.centerX.equalTo(box.snp.centerX)
                make.centerY.equalTo(box.snp.centerY).offset(-screenHeight / 7)
                make.width.equalTo(87.5)
                make.height.equalTo(87.5)
            }
            
            
            let errorL = UILabel()
            
       
            
            errorL.text = "您的网络出现了故障，请检查网络哦~"
            errorL.textColor = UIColor.colorWithHexString(Color_Value: "#999999", alpha: 1)
            errorL.font = UIFont.systemFont(ofSize: 17)
            box.addSubview(errorL)
            errorL.snp.makeConstraints { (make) in
           
                make.centerX.equalTo(box.snp.centerX)
                make.centerY.equalTo(box.snp.centerY)
                make.width.equalTo(300)
                make.height.equalTo(30)
            }
            
            let button:UIButton = UIButton(type:.custom)
            button.setTitle("重新加载", for:.normal) //普通状态下的文字
            button.backgroundColor = UIColor.colorWithHexString(Color_Value: "d9d9d9", alpha: 1)
            
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            button.layer.cornerRadius = kScornerRadius
            button.layer.masksToBounds = true
            button.setTitleColor(UIColor.colorWithHexString(Color_Value: "666666", alpha: 1), for: .normal) //普通状态下文字的颜色
            button.addTarget(self, action: #selector(reConectNetForwork), for: .touchUpInside)
            self.view.addSubview(button)
            button.snp.makeConstraints { (make) in
                make.width.equalTo(100)
                 make.height.equalTo(45)
                make.centerX.equalTo(box.snp.centerX)
                make.centerY.equalTo(box.snp.centerY).offset(screenHeight / 6)

            }
        }
    }
    
    func addNotifications(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(checkDetail(notification:)), name: NSNotification.Name(rawValue: "checkDetail"), object: nil)
        

           NotificationCenter.default.addObserver(self, selector: #selector(closeTheDrawer), name: NSNotification.Name(rawValue: "closeTheDrawer"), object: nil)
        
    }
    
    @objc  func   leftClicked(){
        
        
        
    }
    
    @objc  func   closeTheDrawer(){
        
        QQDRrawerViewController.sharedDrawerViewController.closeDrawer(closeDrawerWithDuration: 0.2)
        
        
      let setting =   UIStoryboard.init(name: "ZBSetingController", bundle: nil).instantiateInitialViewController()
        
        
        
        navigationController?.pushViewController(setting!, animated: true)
    }
    
    
    @objc  func   reConectNetForwork(){
        
        
        
        let reachability = Reachability()  // 准备获取网络连接信息
        if (reachability?.isReachable)! { // 判断网络连接状态
         
            setupTableVie()
            setRefresh()
            
        } else {
            

        }
        
        
        
        
    }
    
    
    /// 点击了加号按钮
  @objc  func checkDetail(notification: Notification) {
    
    let titles  = notification.userInfo!["key"] as! NSString
   
     print(titles)
    
    
     navigationController?.pushViewController(TaskDetailViewController(), animated: true)
    }
    
    
    func setupNavBar() {

        
        let barColor = UIColor.themeColor()
        navigationController?.navigationBar.barTintColor = barColor;
        
        navigationController?.navigationBar.isTranslucent = false;
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
            ] //UIFont(name: "Heiti SC", size: 24.0)!
        

        
        
        let  m_shareImage = UIImageView.init(frame: CGRect(x:0,y:5,width:24 , height:24))
        m_shareImage.image = UIImage.init(named: "形状-1")
         m_shareImage.contentMode = .scaleAspectFit
        let btShare = UIButton.init(type: .custom)
        btShare.bounds = m_shareImage.bounds
        btShare.addSubview(m_shareImage)
        
//        btShare.addTarget(self, action: (#selector(openDrawer)), for: .touchUpInside)
        
      btShare.addTarget(self, action:#selector(tapped(_:)), for:.touchUpInside)
        
        leftBtn = btShare
        
        navigationItem.leftBarButtonItem =  UIBarButtonItem.init(customView: btShare)
        
//      navigationItem.leftBarButtonItem =   UIBarButtonItem.init(image: UIImage.init(named: "形状-1"), style: .plain , target: self, action: (#selector(ZBNavVC.openDrawer)))
        
        
        navigationItem.title = "兼职任务宝";
        
    }
    func tapped(_ button:UIButton){

//        let  animation :CABasicAnimation = CABasicAnimation.init(keyPath: "transform.rotation.z")
//        animation.fromValue = NSNumber.init(floatLiteral: 0.0)
//        animation.toValue = NSNumber.init(floatLiteral: .pi / 2)
//        animation.duration  = 0.3;
//        animation.autoreverses = false;
//        animation.isRemovedOnCompletion = false;
//        button.layer.add(animation, forKey: nil)
//        DispatchQueue.main.asyncAfter(deadline: .now()+0.3, execute:
//            {
//                button.subviews.forEach{ (car) in
//
//                    if(car .isKind(of: UIImageView.self))
//                    {
//                        car.removeFromSuperview()
//                         return
//                    }
//                }
//                 button.setImage(UIImage.init(named: "形状-1_"), for: UIControlState.normal)
//        })
  
        QQDRrawerViewController.sharedDrawerViewController.openDrawer(openDrawerWithDuration: 0.2)
        
        
      
    }
    /// 打开抽屉效果
    func openDrawer(){
        QQDRrawerViewController.sharedDrawerViewController.openDrawer(openDrawerWithDuration: 0.2)
 
    }

    /// 遮罩按钮手势的回调
    func panGestureRecognizer(pan: UIPanGestureRecognizer) {
        QQDRrawerViewController.sharedDrawerViewController.panGestureRecognizer(pan: pan)
        
     
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupTableVie()   {
        tableView = UITableView(frame:  CGRect(x: 0 , y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height ), style: UITableViewStyle.plain)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.separatorStyle = .none
        self.view.addSubview(tableView!)
        view.backgroundColor = UIColor.globalBackgroundColor()
//        automaticallyAdjustsScrollViewInsets = true
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //每一块有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  array.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let identifier = "mainCell"
        let cell = TasksCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)

        return cell

    }
    
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160;
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let str = "donefail"
         tableView.deselectRow(at: indexPath, animated: true)
        
        if  str.contains("login")    { //已经登录 做任务
            navigationController?.pushViewController(TaskDetailViewController(), animated: true)
        }else if  str.contains("unlogin")     {  //未登录 去登陆
            let nav = ZBNavVC.init(rootViewController: ZBLoginController())
            present(nav, animated: true, completion: nil)
        }else if  str.contains("done")     {  //已做
            if   str.contains("success")  {  //审核通过
                  navigationController?.pushViewController(ZBTaskSuccessController(), animated: true)
            }else  if str.contains("fail"){    //审核未通过
                  navigationController?.pushViewController(ZBTaskFailController() , animated: true)
            }

        }
        
        
        
      
        
        
    }
}


extension TasksViewController {
    
    
    /// 设置上拉和下拉刷新
    @objc fileprivate func setRefresh() {
      
        
        let header = RefreshHeder(refreshingBlock: { [weak self] in  //自定义的header
            // 获取标题数据
            NetworkTool.loadHomeTitlesData(fromViewController: String(describing: TasksViewController.self)) { (topTitles, homeTopicVCs) in
                
                self!.tableView?.mj_header.endRefreshing()
                self!.array = topTitles
                self!.tableView?.reloadData()
            }
        })
        
        header?.isAutomaticallyChangeAlpha = true
        header?.lastUpdatedTimeLabel.isHidden = true
        tableView?.mj_header = header
        tableView?.mj_header.beginRefreshing()
        
        tableView?.mj_header = header
        
        

        
        
        
    }
    
    
}



