//
//  ViewController.swift
//  NetworkSchool
//
//  Created by ChenYi on 15-2-25.
//  Copyright (c) 2015年 ChenYi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var LoginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGame(sender: UIButton) {
        println("Login !")

        //println("\(String(name as NSString))")
        
        self.presentViewController(MainTabViewController(), animated: false, completion: nil)
    }

}

