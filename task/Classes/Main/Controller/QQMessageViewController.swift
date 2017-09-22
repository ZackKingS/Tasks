//
//  QQMessageViewController.swift
//  QQDRAWER_SWIFT
//
//  Created by zzy on 2016/10/30.
//  Copyright © 2016年 BlackSky. All rights reserved.
//

import UIKit
import Kingfisher
class QQMessageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
//class QQMessageViewController: UIViewController {
  
    enum DogError :Error {
        case NameInvalidError
        case AgeInvalidError
        case NameLengthError
    }
  
    var tableView : UITableView?
    
    fileprivate var array = [TopicTitle]()
    
    
    
//    fileprivate  lazy  var  topView : UIView = {
//    
//        let topView = UIView(frame:CGRect(x:0,y:0,width:screenWidth,height:200))
//        
//        return topView
//    
//    
//    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //         设置导航栏颜色
        navigationController?.navigationBar.theme_barTintColor = "colors.homeNavBarTintColor"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupTableView()
        
        setupBanner()

    }
    
    func setupTableView()  {
        
        tableView = UITableView(frame:  CGRect(x: 0 , y: kBannerHeight + kNavBarHeight, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height ), style: UITableViewStyle.plain)
        tableView?.dataSource = self
        tableView?.delegate = self
        self.view.addSubview(tableView!)
        
        self.tableView?.register(UITableViewCell().classForCoder, forCellReuseIdentifier: "cell")
        
        
        /// 设置上拉和下拉刷新
        setRefresh()
        
        view.backgroundColor = UIColor.globalBackgroundColor()
        
        
        automaticallyAdjustsScrollViewInsets = false
        
    }
    
    func setupBanner()  {
        
        let storyBoardBanner: LLCycleScrollView? = {
            let storyBoardBanner = LLCycleScrollView()
            
            storyBoardBanner.backgroundColor = UIColor.red
            
            view.addSubview(storyBoardBanner)
            storyBoardBanner.snp.makeConstraints { (make) in
                make.top.equalTo(view).offset(kNavBarHeight)
                make.right.equalTo(view)
                make.left.equalTo(view)
               make.height.equalTo(kBannerHeight)
            }
            
            return storyBoardBanner
            
        }()
        

        
        
        // 网络图，本地图混合
        let imagesURLStrings = [
            
            "http://www.g-photography.net/file_picture/3/3587/4.jpg",
            "http://img2.zjolcdn.com/pic/0/13/66/56/13665652_914292.jpg",
            "http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
            "http://img3.redocn.com/tupian/20150806/weimeisheyingtupian_4779232.jpg",
            ];
        
        
      
        storyBoardBanner?.imagePaths = imagesURLStrings
        
        // 新增图片显示控制
        storyBoardBanner?.imageViewContentMode = .scaleToFill
        storyBoardBanner?.pageControlPosition = .center
        
    }
    
    
  
    
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 200
//    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //每一块有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  array.count
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        
        for moel in array {
            
            print("\(String(describing: moel.name))")
        }
        
        
        cell.textLabel!.text = array[indexPath.row].name
        return cell
    }
    
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200;
//    }
    
    
  
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension QQMessageViewController {
    
    
    /// 设置上拉和下拉刷新
    @objc fileprivate func setRefresh() {
        
        
        let header = RefreshHeder(refreshingBlock: { [weak self] in
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
//        tableView?.mj_header.beginRefreshing()
        
        tableView?.mj_header = header
        
        
        
    }
}


