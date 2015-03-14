//
//  SectionListViewController.swift
//  NetworkSchool
//
//  Created by ChenYi on 15-3-8.
//  Copyright (c) 2015年 ChenYi. All rights reserved.
//

import Foundation
import UIKit

class SectionListViewController:UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var tableView:UITableView?
    var sourceData:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadData()
        self.tableView = UITableView(frame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 44), style:UITableViewStyle.Plain)
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Swift Controllers")
        
        self.view.addSubview(self.tableView!)
        
    }
    
    func downloadData() {
        NSLog("download class simple info !")
        var host:String = "http://localhost:8081/"
        var urlString:String = "\(host)sections"
        
        var url:NSURL = NSURL(string: urlString)!
        
        var data = NSData(contentsOfURL: url, options: NSDataReadingOptions.DataReadingUncached, error: nil)
        
        var jsonResult: NSMutableArray = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSMutableArray
        
        println("AsSynchronous\(jsonResult)")
        
        self.sourceData = jsonResult
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellId:String = "section cell"
        var item = self.sourceData.objectAtIndex(indexPath.row) as NSDictionary
        
        var cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        
        var index:Int = indexPath.row + 1
        var indexLable:UILabel = UILabel(frame: CGRectMake(10, 10, 20.0 as CGFloat, 20.0 as CGFloat))
        indexLable.text = "\(index)"
        
        var title = item.objectForKey("Title") as String
        var titleLabel:UILabel = UILabel(frame: CGRectMake(40, 8, 250.0 as CGFloat, 20.0 as CGFloat))
        titleLabel.text = "\(title)"
        titleLabel.font = UIFont(name: "AppleGothic", size: 15)
        
        var time = item.objectForKey("Title") as String
        var timeLabel:UILabel = UILabel(frame: CGRectMake(40, 28, 250.0 as CGFloat, 10.0 as CGFloat))
        timeLabel.text = "时长: \(time)"
        timeLabel.font = UIFont(name: "AppleGothic", size: 8)
        timeLabel.textColor = UIColor.grayColor()
        
        cell.addSubview(indexLable)
        cell.addSubview(titleLabel)
        cell.addSubview(timeLabel)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.imageNames.count
        return self.sourceData.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("didSelectRowAtIndexPath, index=\(indexPath.row)")
        var view = VideoViewController()
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}