//
//  MineViewController.swift
//  NetworkSchool
//
//  Created by ChenYi on 15-2-25.
//  Copyright (c) 2015年 ChenYi. All rights reserved.
//

import Foundation
import UIKit

class MineViewController:UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        
        var moreScrollView = UIScrollView()
        moreScrollView.frame = self.view.bounds
        //moreScrollView.backgroundColor = UIColor.whiteColor()
        
        var posY:Int = 70
        var buttonHeight:Int = 30
        var buttonPadding:Int = 28
        var buttonPadding2:Int = 1
        var height:CGFloat = CGFloat(buttonHeight)
        
        
        posY = posY + buttonHeight + buttonPadding
        var messageBtn:UIButton = UIButton(frame:CGRectMake(0.0, CGFloat(posY), self.view.bounds.size.width, height))
        messageBtn.setTitle("我的课程", forState: UIControlState.Normal)
        messageBtn.backgroundColor = UIColor.whiteColor()
        messageBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        
        posY = posY + buttonHeight + buttonPadding2
        var settingBtn:UIButton = UIButton(frame:CGRectMake(0.0, CGFloat(posY), self.view.bounds.size.width, height))
        settingBtn.setTitle("我的考试", forState: UIControlState.Normal)
        settingBtn.backgroundColor = UIColor.whiteColor()
        settingBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        
        
        
        moreScrollView.backgroundColor = UIColor.lightGrayColor()
        
        
        moreScrollView.addSubview(messageBtn)
        moreScrollView.addSubview(settingBtn)
        
        
        self.view.addSubview(moreScrollView)

    }
    
    
}