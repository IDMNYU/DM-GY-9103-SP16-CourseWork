//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Keval Shah on 3/22/16.
//  Copyright © 2016 Keval Shah. All rights reserved.
//

import UIKit
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
        formatter.dateStyle = .NoStyle
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
