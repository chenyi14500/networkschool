//
//  ClassTableViewCell.swift
//  NetworkSchool
//
//  Created by ChenYi on 15-2-25.
//  Copyright (c) 2015年 ChenYi. All rights reserved.
//

import Foundation
import UIKit

class ClassItem {
    var logoName:String
    var className:String
    var teacherName:String
    var classScore:Int32
    var classPrice:Int32
    var studentCount:Int32
    
    class func getItemInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top:0, left:0, bottom:0, right:0)
    }
    
    init(logo:String, name:String, teacher:String, score:Int32, price:Int32, count:Int32){
        self.logoName = logo
        self.className = name
        self.teacherName = teacher
        self.classScore = score
        self.classPrice = price
        self.studentCount = count
    }
}

class ClassTableViewCell:UITableViewCell {
    init(data:ClassItem, reuseIdentifier cellId:String) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        
        var imageView:UIImageView = UIImageView(image: UIImage(named: data.logoName))
        imageView.frame = CGRectMake(20, 10, 100.0 as CGFloat, 60.0 as CGFloat)
        
        var classNamelable:UILabel = UILabel(frame: CGRectMake(150, 5, 120.0 as CGFloat, 30.0 as CGFloat)
        )
        classNamelable.text = data.className
        
        var teacherNamelable:UILabel = UILabel(frame: CGRectMake(150, 40, 120.0 as CGFloat, 30.0 as CGFloat)
        )
        teacherNamelable.text = "教师:  \(data.teacherName)"
        teacherNamelable.textColor = UIColor.grayColor()
        teacherNamelable.font = UIFont(name: "AppleGothic", size: 10)
        
        // stars
        for i in 1...5 {
            var imageName:String = "star-disable.png"
            if Int32(i) < data.classScore {
                imageName = "star-enable.png"
            }
            var star:UIImageView = UIImageView(image: UIImage(named: imageName))
            star.frame = CGRectMake(CGFloat(i * 20), 80, 15.0 as CGFloat, 10.0 as CGFloat)
            self.addSubview(star)
            
        }

        var priceLabel:UILabel = UILabel(frame: CGRectMake(150, 80, 50, 10))
        priceLabel.text = "免费"
        if data.classPrice > 0 {
            priceLabel.text = "\(data.classPrice) 元"
        }
        priceLabel.textColor = UIColor.yellowColor()
        priceLabel.font = UIFont(name: "AppleGothic", size: 10)
        
        var studentCountLabel:UILabel = UILabel(frame: CGRectMake(210, 80, 50, 10))
        studentCountLabel.text = "\(data.studentCount) 学员"
        studentCountLabel.textColor = UIColor.grayColor()
        studentCountLabel.font = UIFont(name: "AppleGothic", size: 10)

        
        self.addSubview(imageView)
        self.addSubview(classNamelable)
        self.addSubview(teacherNamelable)
        self.addSubview(priceLabel)
        self.addSubview(studentCountLabel)

    }

    init(imageName:String, reuseIdentifier cellId:String) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        var imageView:UIImageView = UIImageView(image: UIImage(named: imageName))
        imageView.frame = CGRectMake(20, 10, 100.0 as CGFloat, 60.0 as CGFloat)
        var lable:UILabel = UILabel(frame: CGRectMake(150, 10, 120.0 as CGFloat, 30.0 as CGFloat)
)
        lable.text = imageName
        
        self.addSubview(imageView)
        self.addSubview(lable)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}