//
//  ViewController.swift
//  ColorChecker
//
//  Created by Neel on 2/9/16.
//  Copyright © 2016 Keval Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorLabel: UILabel!
    @IBOutlet var nameField: UITextField!
    
    @IBAction func dismissKeyboard(sender: AnyObject)
    {
        nameField.resignFirstResponder()
    }
    
    @IBAction func labelChanged (nameField: UITextField){
        let string = nameField.text?.lowercaseString
        if let colors = (nameDictionary[string!]){
            if (colors.count > 0){
            let randomNumber: Int = Int(arc4random_uniform(UInt32(nameDictionary[string!]!.count)))
            self.view.backgroundColor = nameDictionary[(nameField.text?.lowercaseString)!]![randomNumber]
            colorLabel.hidden = true
            }}
            else {
                colorLabel.hidden = false
                self.view.backgroundColor = UIColor.whiteColor()
            }
        
    }
    
    var nameDictionary: [String:[UIColor]] = ["akshay": [UIColor(red: 0, green: 0,blue: 0, alpha: 1)],"paulina": [UIColor(red: 0, green: 0.5, blue: 0.5, alpha: 1)],"carlos": [UIColor(red: 0, green: 0.929, blue:1, alpha: 1)],"jayson": [UIColor(red: 0, green: 0.165, blue: 0.36, alpha: 1)],"nithi": [UIColor(red: 1, green: 0, blue: 0, alpha: 1)],"lorenzo": [UIColor(red: 0.663, green: 0.663, blue: 0.663, alpha: 1)],"david": [UIColor(red: 1, green: 0.714, blue: 0.757, alpha: 1), UIColor(red: 0.728, green: 0.855, blue: 0.333, alpha: 1)],"derek": [UIColor(red: 0.2, green: 0.275, blue: 0.349, alpha: 1)],"keval": [UIColor(red: 0.35,green: 0.01, blue: 0.05, alpha: 1)],"neill": [UIColor(red: 0.992, green: 0.875,blue: 0.975, alpha: 1)], "sam": [UIColor(red: 0.2,green: 0.4,blue: 1, alpha: 1)], "bobby": [UIColor(red: 0.625, green: 0.125, blue: 0.9375, alpha: 1)], "yuchi": [UIColor(red: 1, green: 0.337, blue: 0, alpha: 1)], "patrick": [UIColor(red: 0.141, green: 0.251,blue: 0.949, alpha: 1)]]

}

