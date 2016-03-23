//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Keval Shah on 3/22/16.
//  Copyright © 2016 Keval Shah. All rights reserved.
//

import UIKit

class BorderedUITextField : UITextField
{
    var setBorderStyle : UITextBorderStyle = .None
    
    override func becomeFirstResponder() -> Bool
    {
        setBorderStyle = borderStyle
        borderStyle = .Line
        return super.becomeFirstResponder()
    }
    override func resignFirstResponder() -> Bool
    {
        let res = super.resignFirstResponder()
        borderStyle = setBorderStyle
        return res
    }
}
class DetailViewController: UIViewController, UITextFieldDelegate
{
    @IBAction func backgroundTapped(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBOutlet var nameField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var serialNumberField: UITextField!
    @IBOutlet var valueField: UITextField!
    
    var item: Item!
        {
        didSet
        {
            navigationItem.title = item.name
        }
    }
    
    let numberFormatter: NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        return formatter
    }()
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = numberFormatter.stringFromNumber(item.valueInDollars)
        dateLabel.text = dateFormatter.stringFromDate(item.dateCreated)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ChangeDate" {
            let dateViewController = segue.destinationViewController as! DateViewController
            dateViewController.item = item
            //dateViewController.datePicker.date = item.dateCreated
        }
    }
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberField.text
        
        if let valueText = valueField.text, value = numberFormatter.numberFromString(valueText)
        {
            item.valueInDollars = value.integerValue
        }
        else
        {
            item.valueInDollars = 0
        }
    }
}
