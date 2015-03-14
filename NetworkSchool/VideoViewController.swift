//
//  VideoViewController.swift
//  NetworkSchool
//
//  Created by ChenYi on 15-3-14.
//  Copyright (c) 2015年 ChenYi. All rights reserved.
//

import Foundation
import UIKit

class VideoViewController:UIViewController{

    var webViews :UIWebView?
    
   /* required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webViews = UIWebView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
)
        var urlstring = "http://www.baidu.com"
        var url:NSURL = NSURL(string:urlstring)!
        var urlRequest = NSURLRequest(URL:url)
        view.addSubview(webViews!)
        self.webViews?.loadRequest(urlRequest)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}