//
//  TasksCell.swift
//  task
//
//  Created by 柏超曾 on 2017/9/22.
//  Copyright © 2017年 柏超曾. All rights reserved.
//

import Foundation
import UIKit

class TasksCell: UITableViewCell {
    
    
    
    // MARK:- 自定义属性
    var viewModel : Tasks? {
        didSet {
            // 1.nil值校验
            guard let viewModel = viewModel else {
                return
            }
            
//            // 2.设置头像
//            iconView.sd_setImageWithURL(viewModel.profileURL, placeholderImage: UIImage(named: "avatar_default_small"))

//            // 4.昵称
//            screenNameLabel.text = viewModel.screen_name
        }
        
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
   
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {// 代码创建
        super.init(style: style, reuseIdentifier: reuseIdentifier)
   
        setupUI()


    }
    
    
    func setupUI()  {
        
        

   
        let grayView = UIImageView.init(image: UIImage.init(named: "mission_blue"))

        addSubview(grayView)

        grayView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(15)
            make.bottom.equalTo(self).offset(-5)
            make.right.equalTo(self).offset(-15)
        }
        
        
        let taskNameL = UILabel()
        taskNameL.text = "恒泰开户"
        taskNameL.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(taskNameL)
        taskNameL.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(17)
            make.left.equalTo(self).offset(35)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        
        let priceL = UILabel()
        priceL.text = "¥ 20"
        priceL.font = UIFont.systemFont(ofSize: 20)
        self.addSubview(priceL)
        priceL.snp.makeConstraints { (make) in

            make.top.equalTo(taskNameL.snp.bottom).offset(2)
            make.left.equalTo(self).offset(35)
            make.width.equalTo(100)
            make.height.equalTo(70)
        }
        
        
        
        let rightTopL = UILabel()
        rightTopL.text = "可开始"
        rightTopL.textAlignment = .center

        rightTopL.font = UIFont.systemFont(ofSize: 14)
        rightTopL.textColor = UIColor.white
        rightTopL.backgroundColor = UIColor.colorWithHexString(Color_Value: "508cee", alpha: 1)
        addSubview(rightTopL)
//        rightTopL.snp.makeConstraints { (make) in
//
//            make.top.equalTo(self).offset(19)
//            make.right.equalTo(self).offset(-20)
//            make.width.equalTo(54)
//            make.height.equalTo(23)
//
//
//        }
        
        rightTopL.frame = CGRect(x:screenWidth - 73, y:24, width:54,height : 24)
        let   corner  :UIRectCorner = UIRectCorner(rawValue: UIRectCorner.RawValue(UInt8(UIRectCorner.topLeft.rawValue) |  UInt8(UIRectCorner.bottomLeft.rawValue)));//这只圆角位置
        let  path = UIBezierPath.init(roundedRect: rightTopL.bounds, byRoundingCorners: corner, cornerRadii: CGSize(width:5,height:5))
        let masklayer = CAShapeLayer()
        masklayer.frame = rightTopL.bounds;
        masklayer.path = path.cgPath;//设置路径
        rightTopL.layer.mask = masklayer
        
        
        
        let dateL = UILabel()
        dateL.text = "2017.09.13 - 2017.03.30"
        dateL.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(dateL)
        dateL.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-15)
            make.left.equalTo(self).offset(35)
            make.width.equalTo(300)
            make.height.equalTo(15)
        }
        
        

        let button:UIButton = UIButton(type:.custom)
        button.setTitle("查看", for:.normal) //普通状态下的文字
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.colorWithHexString(Color_Value: "ff821e", alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(push), for: .touchUpInside)
        self.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-15)
            make.right.equalTo(self).offset(-35)
            make.width.equalTo(43)
            make.height.equalTo(30)
        }
        
        
        
        
        let checkView = UIImageView.init(image: UIImage.init(named: "right_arr"))
        
        addSubview(checkView)
        
        checkView.snp.makeConstraints { (make) in
            make.leading.equalTo(button.snp.trailing).offset(-1)
            make.centerY.equalTo(button.snp.centerY)
            make.width.equalTo(10)
            make.height.equalTo(10)
//            make.bottom.equalTo(self).offset(-5)
//            make.right.equalTo(self).offset(-15)
        }
        
        
        
        
        
        
        
    }
    func push(){
        
        
//          NotificationCenter.default.post(name: NSNotification.Name(rawValue: "checkDetail"), object: nil)
        
        let sizeM =  "xxcew"
        let sizeString = String(format: "123123%@", sizeM)
//          let sizeString = "123132312"
         NotificationCenter.default.post(name: NSNotification.Name(rawValue: "checkDetail"), object: self, userInfo: ["key": sizeString])
    }
 
    
    override func awakeFromNib() {  // XIB代码创建
        super.awakeFromNib()
        
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setHighlighted(isHighlighted, animated: true)
//        self.backgroundColor = UIColor.red
    }
    
//    - (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
//    {
//    UIColor *backgroundColor = self.channelImageView.backgroundColor;
//    [super setHighlighted:highlighted animated:animated];
//    self.channelImageView.backgroundColor = backgroundColor;
//    }
 
}
