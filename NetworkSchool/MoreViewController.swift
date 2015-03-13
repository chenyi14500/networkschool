//
//  MoreViewController.swift
//  NetworkSchool
//
//  Created by ChenYi on 15-2-25.
//  Copyright (c) 2015年 ChenYi. All rights reserved.
//

import Foundation
import UIKit

class MoreViewController:UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var moreScrollView = UIScrollView()
        moreScrollView.frame = self.view.bounds
        //moreScrollView.backgroundColor = UIColor.whiteColor()
        
        var posY:Int = 70
        var buttonHeight:Int = 30
        var buttonPadding:Int = 28
        var buttonPadding2:Int = 1
        var height:CGFloat = CGFloat(buttonHeight)
        var scanBtn:UIButton = UIButton(frame:CGRectMake(0.0, CGFloat(posY), self.view.bounds.size.width, height))
        scanBtn.setTitle("扫一扫", forState: UIControlState.Normal)
        scanBtn.backgroundColor = UIColor.whiteColor()
        scanBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        posY = posY + buttonHeight + buttonPadding
        var messageBtn:UIButton = UIButton(frame:CGRectMake(0.0, CGFloat(posY), self.view.bounds.size.width, height))
        messageBtn.setTitle("消息", forState: UIControlState.Normal)
        messageBtn.backgroundColor = UIColor.whiteColor()
        messageBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)

        
        posY = posY + buttonHeight + buttonPadding2
        var settingBtn:UIButton = UIButton(frame:CGRectMake(0.0, CGFloat(posY), self.view.bounds.size.width, height))
        settingBtn.setTitle("设置", forState: UIControlState.Normal)
        settingBtn.backgroundColor = UIColor.whiteColor()
        settingBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)

        
        posY = posY + buttonHeight + buttonPadding2
        var aboutBtn:UIButton = UIButton(frame:CGRectMake(0.0, CGFloat(posY), self.view.bounds.size.width, height))
        aboutBtn.setTitle("关于网校", forState: UIControlState.Normal)
        aboutBtn.backgroundColor = UIColor.whiteColor()
        aboutBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)


        posY = posY + buttonHeight + buttonPadding
        var logoutBtn:UIButton =  UIButton(frame:CGRectMake(0.0, CGFloat(posY), self.view.bounds.size.width, height))
        logoutBtn.setTitle("退出登录", forState: UIControlState.Normal)
        logoutBtn.backgroundColor = UIColor.whiteColor()
        logoutBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)

        
        
        moreScrollView.backgroundColor = UIColor.lightGrayColor()
        
        moreScrollView.addSubview(scanBtn)
        moreScrollView.addSubview(aboutBtn)
        moreScrollView.addSubview(messageBtn)
        moreScrollView.addSubview(settingBtn)
        moreScrollView.addSubview(logoutBtn)

        
        self.view.addSubview(moreScrollView)
        
    }
}