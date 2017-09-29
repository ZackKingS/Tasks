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

class ZBFinishedController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var tableView : UITableView?
    fileprivate var array = [TopicTitle]()
    
    
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
     
        
    }
    
    
    func setRefresh() {
        
        
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
    
  
 
  
   
    

    
   
    
    func setupNavBar() {
        
        
        let barColor = UIColor.themeColor()
        navigationController?.navigationBar.barTintColor = barColor;
        
        navigationController?.navigationBar.isTranslucent = false;
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
        ] //UIFont(name: "Heiti SC", size: 24.0)!
        
        
        
     
        
        navigationItem.title = "已完成的任务";
        
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
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 80))
//        view.backgroundColor = UIColor.red
        
        
        
        let bordView = UIView()
        view.addSubview(bordView)
        bordView.layer.cornerRadius = 6
        bordView.layer.borderColor = UIColor.gray.cgColor
        bordView.layer.borderWidth = 1
        bordView.layer.masksToBounds = true
        
        bordView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(10)
            make.left.equalTo(view).offset(20)
            make.bottom.equalTo(view).offset(-5)
            make.right.equalTo(view).offset(-15)
        }
        

        let finiTasskL = UILabel()
        finiTasskL.text = "你共完成任务"
        finiTasskL.font = UIFont.systemFont(ofSize: 19)
        view.addSubview(finiTasskL)
        finiTasskL.snp.makeConstraints { (make) in
            make.centerY.equalTo(view.snp.centerY)
            make.left.equalTo(view).offset(35)
            make.width.equalTo(300)
            make.height.equalTo(15)
        }
        
        let taskcountL = UILabel()
        taskcountL.text = "22项"
        taskcountL.font = UIFont.systemFont(ofSize: 19)
        view.addSubview(taskcountL)
        taskcountL.snp.makeConstraints { (make) in
            make.centerY.equalTo(view.snp.centerY)
            make.right.equalTo(view).offset(-35)
            make.width.equalTo(300)
            make.height.equalTo(15)
        }
        
        
        
        return view
        
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
        
        let str = "unlogin"
        tableView.deselectRow(at: indexPath, animated: true)
        if  str.contains("qwe")    { //已经登录 做任务
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



