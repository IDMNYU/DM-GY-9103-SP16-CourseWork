//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Yuchi on 9/2/16.
//  Copyright © 2016 Yuchi. All rights reserved.
//

import UIKit


class ConversionViewController: UIViewController {

    var bgColor = UIColor(red:245, green:244, blue:241, alpha:1)
   
    override func viewDidLoad(){
        //always call the super implementation of viewDidLoad
        super.viewDidLoad()
        print("ConversionViewController loaded its view")
        
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH"
        let convertedDate = dateFormatter.stringFromDate(currentDate)
        let hour = NSNumberFormatter().numberFromString(convertedDate)
        let hourValue = Int(hour!)
        if hourValue >= 0 && hourValue <= 12 {
            bgColor = UIColor.darkGrayColor()
        }
    }
    
//    var r: CGFloat = CGFloat(drand48())
//    var g: CGFloat = CGFloat(drand48())
//    var b: CGFloat = CGFloat(drand48())

    
    override func viewWillAppear(animated: Bool) {
                super.viewWillAppear(animated)
                self.view.backgroundColor = bgColor
            }
    
    
 
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
           celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }else {
            celsiusLabel.text = "???"
        }
        
    }
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
//    func textField(textField: UITextField,
//        shouldChangeCharactersInRange range: NSRange,
//        replacementString string: String) -> Bool {
//            
//            let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
//            let replacementTextHasDecimalSeparator = string.rangeOfString(".")
//            
//            if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
//                return false
//            } else {
//                return true
//            }
//    }
    
    func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool {
            
        if textField.tag == 2 {  //your textField
            let invalid = NSCharacterSet(charactersInString: "aeiou")  //characters to block
            if let x = string.rangeOfCharacterFromSet(invalid) {
                return false
            }
        }
        return true
    }

    
}
