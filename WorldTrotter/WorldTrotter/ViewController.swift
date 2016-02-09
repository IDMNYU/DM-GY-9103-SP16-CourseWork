//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Yuchi on 9/2/16.
//  Copyright © 2016 Yuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
        let firstView = UIView(frame:firstFrame)
        firstView.backgroundColor = UIColor.blueColor()
        view.addSubview(firstView)
        
        let secondFrame = CGRect(x: 20, y: 30, width: 50, height: 50)
        let secondView = UIView(frame:secondFrame)
        secondView.backgroundColor = UIColor.greenColor()
        firstView.addSubview(secondView)
    }


}

