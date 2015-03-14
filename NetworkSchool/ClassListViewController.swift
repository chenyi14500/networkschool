//
//  ClassListViewController.swift
//  NetworkSchool
//
//  Created by ChenYi on 15-2-25.
//  Copyright (c) 2015年 ChenYi. All rights reserved.
//

import Foundation
import UIKit
class ClassListViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {

    
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
        var urlString:String = "\(host)class1"
        
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
        var cellId:String = "Class cell"
        var item = self.sourceData.objectAtIndex(indexPath.row) as NSDictionary
        
        var cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        
        var imageURL:String = item.objectForKey("IconUrl") as String
        NSLog("image url : \(imageURL)")
        var url:NSURL = NSURL(string: imageURL)!
        var data:NSData = NSData(contentsOfURL: url)!
        //var data:NSData = NSData(contentsOfURL:NSURL.fileURLWithPath(imageURL)!)!

        var imageView:UIImageView = UIImageView(image: UIImage(data: data))
        imageView.frame = CGRectMake(20, 10, 100.0 as CGFloat, 60.0 as CGFloat)
        
        var classNamelable:UILabel = UILabel(frame: CGRectMake(150, 5, 120.0 as CGFloat, 30.0 as CGFloat)
        )
        classNamelable.text = item.objectForKey("Name") as? String
        
        var teacherNamelable:UILabel = UILabel(frame: CGRectMake(150, 40, 120.0 as CGFloat, 30.0 as CGFloat)
        )
        var teacher:String = item.objectForKey("Teacher") as String
        teacherNamelable.text = "教师:  \(teacher)"
        teacherNamelable.textColor = UIColor.grayColor()
        teacherNamelable.font = UIFont(name: "AppleGothic", size: 10)
        
        // stars
        var score:Int = item.objectForKey("Score") as Int
        for i in 1...5 {
            var imageName:String = "star-disable.png"
            if Int(i) < score {
                imageName = "star-enable.png"
            }
            var star:UIImageView = UIImageView(image: UIImage(named: imageName))
            star.frame = CGRectMake(CGFloat(i * 20), 80, 15.0 as CGFloat, 10.0 as CGFloat)
            cell.addSubview(star)
            
        }
        
        var priceLabel:UILabel = UILabel(frame: CGRectMake(150, 80, 50, 10))
        priceLabel.text = "免费"
        var price:Int = item.objectForKey("Price") as Int
        if price > 0 {
            priceLabel.text = "\(price) 元"
        }
        priceLabel.textColor = UIColor.yellowColor()
        priceLabel.font = UIFont(name: "AppleGothic", size: 10)
        
        var count :Int  = item.objectForKey("StudentCount") as Int
        var studentCountLabel:UILabel = UILabel(frame: CGRectMake(210, 80, 50, 10))
        studentCountLabel.text = "\(count) 学员"
        studentCountLabel.textColor = UIColor.grayColor()
        studentCountLabel.font = UIFont(name: "AppleGothic", size: 10)
        
        
        cell.addSubview(imageView)
        cell.addSubview(classNamelable)
        cell.addSubview(teacherNamelable)
        cell.addSubview(priceLabel)
        cell.addSubview(studentCountLabel)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.imageNames.count
        return self.sourceData.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("didSelectRowAtIndexPath, index=\(indexPath.row)")
        var sectionView = SectionListViewController()
        var item = self.sourceData.objectAtIndex(indexPath.row) as NSDictionary
        sectionView.title = item.objectForKey("Name") as? String
        self.navigationController?.pushViewController(sectionView, animated: true)

        
        
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}