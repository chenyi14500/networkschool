//
//  MineViewController.swift
//  NetworkSchool
//
//  Created by ChenYi on 15-2-25.
//  Copyright (c) 2015年 ChenYi. All rights reserved.
//

import Foundation
import UIKit

class MineViewController:UIViewController,UISearchBarDelegate, UITableViewDataSource,UITableViewDelegate
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
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 2
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
                text = "普通用户";
            }
            break;
            
        case 1:
            if(row == 0) {
                text = "我的课程"
            } else if(row == 1) {
                text = "我的考试"
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
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.section == 0 && indexPath.row==0) {
            return 100
        }
        return 50
    }

    
    
}