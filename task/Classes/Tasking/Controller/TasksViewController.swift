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

class TasksViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var tableView : UITableView?
    fileprivate var array = [TopicTitle]()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//         设置导航栏颜色
//        navigationController?.navigationBar.theme_barTintColor = "colors.homeNavBarTintColor"   //UIKit + Theme
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableVie()
        setRefresh()
        setupNavBar()
        
        
    

        
        NotificationCenter.default.addObserver(self, selector: #selector(checkDetail(notification:)), name: NSNotification.Name(rawValue: "checkDetail"), object: nil)
    }
    /// 点击了加号按钮
  @objc  func checkDetail(notification: Notification) {
    
    let titles  = notification.userInfo!["key"] as! NSString
   
     print(titles)
    
    
     navigationController?.pushViewController(TaskDetailViewController(), animated: true)
    }
    
    
    func setupNavBar() {

        
        let barColor = UIColor(red:94/255.0, green:94/255.0, blue:94/255.0, alpha:1)
        self.navigationController?.navigationBar.barTintColor = barColor;
        
        
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
            ] //UIFont(name: "Heiti SC", size: 24.0)!
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "个人", style: .plain, target: self, action: #selector(openDrawer))
      navigationItem.leftBarButtonItem =   UIBarButtonItem.init(image: UIImage.init(named: "run10"), style: .plain , target: self, action: (#selector(ZBNavVC.openDrawer)))
        
        
        navigationItem.title = "兼职任务宝";
        
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
        
        
        tableView = UITableView(frame:  CGRect(x: 0 , y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height ), style: UITableViewStyle.plain)
        tableView?.dataSource = self
        tableView?.delegate = self
        
        tableView?.separatorStyle = .none
        
        self.view.addSubview(tableView!)
//        self.tableView?.register(TasksCell().classForCoder, forCellReuseIdentifier: "cell")
//        self.tableView?.register(UINib.init(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "cell")
        view.backgroundColor = UIColor.globalBackgroundColor()
        automaticallyAdjustsScrollViewInsets = false
        
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //每一块有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  array.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let identifier = "mainCell"
        let cell = TasksCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
//        cell.textLabel!.text = array[indexPath.row].name
//         cell.detailTextLabel!.text = array[indexPath.row].name
//        cell.viewModel = viewModels[indexPath.row]
        
        return cell

    }
    
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160;
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
          navigationController?.pushViewController(TaskDetailViewController(), animated: true)
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



