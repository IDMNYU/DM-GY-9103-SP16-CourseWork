//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Keval on 2/9/16.
//  Copyright © 2016 Keval Shah. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate
{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view")
    }
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Double?
    {
        didSet
        {
         updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double?
    {
        if let value = fahrenheitValue
        {
            return (value - 32) * (5/9)
        }
        else
        {
            return nil
        }
    }
    
    func updateCelsiusLabel()
    {
        if let value = celsiusValue
        {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else
        {
            celsiusLabel.text = "---"
        }
    }
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField)
    {
     /*   if let text = textField.text where !text.isEmpty
        {
            celsiusLabel.text = textField.text
        }
        else
        {
            celsiusLabel.text = "---"
        }*/
        
        if let text = textField.text, value = Double(text)
        {
            fahrenheitValue = value
        }
        else
        {
            fahrenheitValue = nil
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        //let numerical = NSCharacterSet.decimalDigitCharacterSet().invertedSet
        
        //Creating a new Character Set since decimalDigitCharacterSet does not allow "."; Inverting set to include everything but characters.
        let numerical = string.rangeOfCharacterFromSet(NSCharacterSet(charactersInString: "0123456789.").invertedSet)
        let existingTextHasDecimalSeperator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeperator = string.rangeOfString(".")

        
        if numerical != nil
        {
            return false
        }
        else if existingTextHasDecimalSeperator != nil && replacementTextHasDecimalSeperator != nil
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject)
    {
        textField.resignFirstResponder()
    }
    
    let numberFormatter: NSNumberFormatter =
    {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
}
