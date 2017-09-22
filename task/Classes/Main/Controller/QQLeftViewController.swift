//
//  QQLeftViewController.swift
//  QQDRAWER_SWIFT
//
//  Created by zzy on 2016/10/30.
//  Copyright © 2016年 BlackSky. All rights reserved.
//

import UIKit

class QQLeftViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var headerView: UIView{
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: kMaxLeftOffset))
//        view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "scenery")!)
        
      view.backgroundColor =  UIColor.themeColor()
        return view
    }
    
    var dataArray:[String]{
        let array = NSArray.init(objects: "完成任务","用户余额")
        return array as! [String]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: kMaxLeftOffset, width: headerView.bounds.width, height: UIScreen.main.bounds.height - 200), style: .plain)
        tableView.separatorStyle = .none
//        tableView.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "leftbg")!)
        tableView.backgroundColor = UIColor.themeColor()
        view.backgroundColor = UIColor.white
        view.addSubview(headerView)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    // MARK: - UITableViewDataSource,UITableViewDelegate
    
    public func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellIdentifier"
            
         var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if !(cell != nil) {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellIdentifier)
            cell?.selectionStyle = .none
            cell?.backgroundColor = UIColor.clear
        }
        
        cell!.textLabel?.text = dataArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let rootViewController = QQLeftSwitchViewController.initWithTitle(title: dataArray[indexPath.row])
//        
//        QQDRrawerViewController.sharedDrawerViewController.switchViewController(viewController: rootViewController)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
