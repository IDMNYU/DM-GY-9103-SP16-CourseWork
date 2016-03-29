//
//  ViewController.swift
//  CounterApp
//
//  Created by Keval Shah on 3/22/16.
//  Copyright © 2016 Keval Shah. All rights reserved.
//

import UIKit

class CounterViewController: UIViewController {
    

    
    @IBOutlet var counterLabel: UILabel!
    var countValue: Int!
    override func viewDidLoad() {
        
        countValue = 0
        super.viewDidLoad()
        
       counterLabel.text = String(countValue)
        print(countValue)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func increaseCount(sender: AnyObject) {
        
        countValue = countValue + 1
        counterLabel.text = String(countValue)
        print(countValue)
        //counterLabel.text = String(count)
    }
    
   @IBAction func decreaseCounter(sender: AnyObject) {
        
        countValue = countValue - 1
        if(countValue >= 0)
        {
            print(countValue)
            counterLabel.text = String(countValue)
        }
        else
        {
            countValue = 0
            print(countValue)
            counterLabel.text = String(countValue)
        }
    }
    

}

