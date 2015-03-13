//
//  MainTabViewController.swift
//  NetworkSchool
//
//  Created by ChenYi on 15-2-25.
//  Copyright (c) 2015年 ChenYi. All rights reserved.
//

import Foundation
import UIKit

class MainTabViewController:UITabBarController
{
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var viewMine = MineViewController()
        viewMine.title = "我的"
        
        
        var discoveryView = DiscoveryViewController()
        discoveryView.title = "发现"
        
        var recommendView = RecommendViewController()
        recommendView.title = "推荐"
        
        var moreView = MoreViewController()
        moreView.title = "更多"
        
        
        var color = UIColor.greenColor()// UIColor(red: 0.0, green: 139.0, blue: 69.0, alpha: 0.0)
        var mine = UINavigationController(rootViewController: viewMine)
        mine.navigationBar.barTintColor = color
        var discovery = UINavigationController(rootViewController: discoveryView)
        var recommend = UINavigationController(rootViewController: recommendView)
        var more = UINavigationController(rootViewController: moreView)
        
        //self.toolbarItems
        //self.navigationController?.navigationBar.sizeThatFits(CGSize(width: , height: <#Int#>))
        self.tabBar.barTintColor = color
        self.viewControllers = [mine, recommend, discovery, more]
        self.selectedIndex=0
    }
}