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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counterStore.allCounters.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //let cell = UITableViewCell(style: .Value1, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")!
        let counter = counterStore.allCounters[indexPath.row]
        
        cell.textLabel?.text = counter.name
        cell.detailTextLabel?.text = "\(counter.countValue)"
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowCounter"
        {
            if let row = tableView.indexPathForSelectedRow?.row
            {
                let counter = counterStore.allCounters[row]
                let counterViewController = segue.destinationViewController as! CounterViewController
                counterViewController.counter = counter
            }
        }
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
