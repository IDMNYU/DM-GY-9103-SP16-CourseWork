//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Yuchi on 9/2/16.
//  Copyright © 2016 Yuchi. All rights reserved.
//

import UIKit
class ConversionViewController: UIViewController {
 
    @IBOutlet var celsiusLabel: UILabel!
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
   
    var celsiusValue: Double? {
        if let value = fahrenheitValue{
            return (value - 32)*(5/9)
        }else {
            return nil
        }
    }
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField){
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        }else {
            fahrenheitValue = nil
        }
    
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel(){
        if let value = celsiusValue {
            celsiusLabel.text = "\(value)"
        }else {
            celsiusLabel.text = "???"
        }
        
    }
    
    
    
    
}
