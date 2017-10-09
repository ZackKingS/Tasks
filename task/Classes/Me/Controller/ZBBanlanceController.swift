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

class ZBBanlanceController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var tableView : UITableView?
    fileprivate var array = [TopicTitle]()
    
    fileprivate var dataArray = [Tasks]()
    
    var leftBtn :UIButton?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //         设置导航栏颜色
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTableVie()
        setRefresh()
        setupNavBar()
        tableView?.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: kNavBarHeight, right: 0);
        
    }
    
    
    func setRefresh() {
        
        
        let header = RefreshHeder(refreshingBlock: { [weak self] in  //自定义的header
            
            var str = ""
            
            if ZBLOGIN_KEY == "login"    { //已经登录
                str = "\(API_DONETASK_URL)?userid=\(User.GetUser().id!)"
            }else{                //未登录
                str = API_GETTASKLIST_URL
            }
            
            
            NetworkTool.getTaskList(url: str, completionHandler: { (json) in
                /*
                 "status" : -1,
                 "id" : 26,
                 "title" : "天值基金开户",
                 "deadline" : "2017-10-20 10:33:26",
                 "price" : "6.00",
                 "start_time" : "2017-09-29 10:33:26"
                 */
                
                let dataArr  = json["data"].arrayValue
                
                var temparr = [Tasks]()
                for dict    in dataArr{
                    print(dict)
                    let task    = Tasks.init(dictt: (dict.dictionaryValue  ))
                    temparr.append(task)
                }
                
                self!.tableView?.mj_header.endRefreshing()
                self!.dataArray = temparr
                self!.tableView?.reloadData()
                
            })
            
        })
        
        header?.isAutomaticallyChangeAlpha = true
        header?.lastUpdatedTimeLabel.isHidden = true
        tableView?.mj_header = header
        tableView?.mj_header.beginRefreshing()
        tableView?.mj_header = header
        
        
    }
    
    
    
    
    func setupNavBar() {
        
        
        let barColor = UIColor.themeColor()
        navigationController?.navigationBar.barTintColor = barColor;
        
        navigationController?.navigationBar.isTranslucent = false;
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
        ] //UIFont(name: "Heiti SC", size: 24.0)!
        
        
        
        
        
        navigationItem.title = "账户余额";
        
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
        return  dataArray.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let inview = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 80))
        
        //        inview.backgroundColor = UIColor.red
        
        let bordView = UIView()
        inview.addSubview(bordView)
        bordView.layer.cornerRadius = 6
        bordView.layer.borderColor = UIColor.gray.cgColor
        bordView.layer.borderWidth = 1
        bordView.layer.masksToBounds = true
        
        bordView.snp.makeConstraints { (make) in
            make.top.equalTo(inview).offset(10)
            make.left.equalTo(inview).offset(20)
            make.bottom.equalTo(inview).offset(-5)
            make.right.equalTo(inview).offset(-15)
        }
        
        
        let finiTasskL = UILabel()
        finiTasskL.text = "你共完成任务"
        finiTasskL.font = UIFont.systemFont(ofSize: 18)
        inview.addSubview(finiTasskL)
        finiTasskL.snp.makeConstraints { (make) in
            make.centerY.equalTo(inview.snp.centerY)
            make.left.equalTo(inview).offset(35)
            make.width.equalTo(200)
            make.height.equalTo(15)
        }
        
        let taskcountL = UILabel()
        taskcountL.text = "0项"
        taskcountL.textAlignment =  .right
        taskcountL.font = UIFont.systemFont(ofSize: 18)
        inview.addSubview(taskcountL)
        taskcountL.snp.makeConstraints { (make) in
            make.centerY.equalTo(inview.snp.centerY)
            make.right.equalTo(inview).offset(-35)
            make.width.equalTo(100)
            make.height.equalTo(15)
        }
        
        
        
        return inview
        
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
    
    
    // MARK:========  点击cell============
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        let str = "unlogin"
        //        tableView.deselectRow(at: indexPath, animated: true)
        //        if  str.contains("qwe")    { //已经登录 做任务
        //            navigationController?.pushViewController(TaskDetailViewController(), animated: true)
        //        }else if  str.contains("unlogin")     {  //未登录 去登陆
        //            let nav = ZBNavVC.init(rootViewController: ZBLoginController())
        //            present(nav, animated: true, completion: nil)
        //        }else if  str.contains("done")     {  //已做
        //            if   str.contains("success")  {  //审核通过
        //                navigationController?.pushViewController(ZBTaskSuccessController(), animated: true)
        //            }else  if str.contains("fail"){    //审核未通过
        //                navigationController?.pushViewController(ZBTaskFailController() , animated: true)
        //            }
        //        }
        
        
        
        
        
        
    }
}




