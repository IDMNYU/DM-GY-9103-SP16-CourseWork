//
//  DateViewController.swift
//  Homepwner
//
//  Created by Keval Shah on 3/22/16.
//  Copyright © 2016 Keval Shah. All rights reserved.
//

import UIKit

class DateViewController: UIViewController
{
    
    @IBOutlet var datePicker: UIDatePicker!
    
    var item: Item! {
        didSet {
            navigationItem.title = "Enter new date"
        }
    }
    
    /*    override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
        datePicker.date = item.dateCreated
    }
    */
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        item.dateCreated = datePicker.date
    }
}
