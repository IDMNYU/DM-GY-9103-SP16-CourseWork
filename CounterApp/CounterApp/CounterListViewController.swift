//
//  CounterListViewController.swift
//  CounterApp
//
//  Created by Keval Shah on 3/22/16.
//  Copyright © 2016 Keval Shah. All rights reserved.
//

import UIKit

class CounterListViewController: UITableViewController
{
    
    var counterStore: CounterStore!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    @IBAction func addNewCounter(sender: AnyObject)
    {
        //let lastRow = tableView.numberOfRowsInSection(0)
        //let indexPath = NSIndexPath(forRow: lastRow, inSection: 0)
        
        //tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        let newCounter = counterStore.createCounter()
        
        if let index = counterStore.allCounters.indexOf(newCounter)
        {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
        
    }
    
    
}
