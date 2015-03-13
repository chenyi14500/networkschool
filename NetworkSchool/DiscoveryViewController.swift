//
//  DiscoveryViewController.swift
//  NetworkSchool
//
//  Created by ChenYi on 15-2-25.
//  Copyright (c) 2015年 ChenYi. All rights reserved.
//

import Foundation
import UIKit

//json 这是一个课程类别的列表
class DiscoveryViewController:UIViewController, UISearchBarDelegate, UITableViewDataSource,UITableViewDelegate, NSURLConnectionDelegate
{
    var sourceData:NSMutableArray?
    var tabelviewDisplayData:NSMutableArray?
    var tableView:UITableView?
    var searchBar:UISearchBar?
        // 网络接受json的二进制数据
    var _recvData:NSMutableArray?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadData()
        self.tabelviewDisplayData = sourceData
        
        var navigationBarTopPadding:CGFloat = 60
        var searchBarHeight:CGFloat = 50
        
        println("create search bar")
        self.searchBar = UISearchBar(frame:CGRectMake(0, navigationBarTopPadding , self.view.bounds.size.width, searchBarHeight))
        self.searchBar!.delegate = self
        self.view.addSubview(self.searchBar!)
        
        println("create table view")
        var tableViewTopPadding = (searchBarHeight + navigationBarTopPadding) as CGFloat
        self.tableView = UITableView(frame:CGRectMake(0, tableViewTopPadding, self.view.bounds.size.width, self.view.bounds.size.height - tableViewTopPadding), style:UITableViewStyle.Plain)

        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Swift Controllers")
        self.view.addSubview(self.tableView!)
        
        println("create header line")
        var headerLable = UILabel(frame:CGRectMake(0, tableViewTopPadding, self.view.bounds.size.width, 30))
        headerLable.text = "全部"
        self.tableView?.tableHeaderView = headerLable
        
        self.downloadData()
    }
    
    // 下载数据的函数， 通过http
    func downloadData() {
        var host:String = "http://localhost:8081/"
        var urlString:String = "\(host)class2"
        
        var url:NSURL = NSURL(string: urlString)!
        
        var data = NSData(contentsOfURL: url, options: NSDataReadingOptions.DataReadingUncached, error: nil)
        
        var jsonResult: NSMutableArray = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSMutableArray
        
        //println("AsSynchronous\(jsonResult)")
        
        self.sourceData = jsonResult
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tabelviewDisplayData!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println("cellForRowAtIndexPath, index=", indexPath.row)
        let identify:String = "Swift Controllers"
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath) as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text = self.tabelviewDisplayData?.objectAtIndex(indexPath.row) as? String
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView!.deselectRowAtIndexPath(indexPath, animated: true)
        var itemString =  self.tabelviewDisplayData?.objectAtIndex(indexPath.row) as? String
        println("didSelectRowAtIndexPath, index=", indexPath.row)
        
        var classListview = ClassListViewController()
        classListview.title = itemString
        self.navigationController?.pushViewController(classListview, animated: true)
        
        
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            self.tabelviewDisplayData = self.sourceData
        } else {
            //self.tabelviewDisplayData = NSArray()
            var mutilarr:NSMutableArray = NSMutableArray()
            for var i = 0; i < self.sourceData?.count; i++ {
                var s = self.sourceData?.objectAtIndex(i) as String
                if s.lowercaseString.hasPrefix(searchText) {
                    //self.tabelviewDisplayData
                    mutilarr.addObject(s)
                    
                }
            }
            self.tabelviewDisplayData = mutilarr
            println( self.tabelviewDisplayData)
        }
                
        self.tableView?.reloadData()

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}