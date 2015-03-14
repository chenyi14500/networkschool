//
//  MoreViewController.swift
//  NetworkSchool
//
//  Created by ChenYi on 15-2-25.
//  Copyright (c) 2015年 ChenYi. All rights reserved.
//

import Foundation
import UIKit

/*class MoreViewController:UIViewController
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
}*/

class MoreViewController:UIViewController,UISearchBarDelegate, UITableViewDataSource,UITableViewDelegate

{
    var _tableview : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self._tableview = UITableView(frame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height), style:UITableViewStyle.Grouped)
        
        self._tableview!.delegate = self
        self._tableview!.dataSource = self
        
        self.view.addSubview(self._tableview!)

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 3
        }
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identify:String = "mine cell"
        //var cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath) as UITableViewCell
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: identify)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

        var section = indexPath.section
        var row = indexPath.row
        var text:String = "";
        switch section {
            case 0:
                if(row == 0) {
                    text = "扫一扫";
                }
                break;
            
            case 1:
                if(row == 0) {
                    text = "消息"
                } else if(row == 1) {
                    text = "设置"
                } else if(row == 2) {
                    text = "关于网校"
                }
                break;
            
            case 2:
                if(row == 0) {
                    text = "退出登入"
                }
                break;

            default:
                break;
        }
        
        //cell.textLabel = UILabel(
        cell.textLabel?.text  = text
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self._tableview!.deselectRowAtIndexPath(indexPath, animated: true)
        NSLog("mine : select row(\(indexPath.row)), section(\(indexPath.section)");
        
        
    }

}