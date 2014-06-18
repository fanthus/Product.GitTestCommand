//
//  ViewController.swift
//  GitHubCommandTest
//
//  Created by xiushan.fan on 18/6/14.
//  Copyright (c) 2014年 moji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        let rect: CGRect = CGRectMake(1,5,20,20)
        let label:UILabel = UILabel(frame:rect)
        
        view.addSubView(label)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

