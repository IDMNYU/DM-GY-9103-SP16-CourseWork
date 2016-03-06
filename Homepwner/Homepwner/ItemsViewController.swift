//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Yuchi on 1/3/16.
//  Copyright © 2016 Yuchi. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController{
    
    var itemStore: ItemStore!
    @IBAction func addNewItem(sender: AnyObject){
        
 
        //make a new index path fr the 0th section, last row
//        let lastRow = tableView.numberOfRowsInSection(0)
//        let indexPath = NSIndexPath(forRow: lastRow, inSection: 0)
        
        //insert this new row into the table
//        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        
        //Create a new item and add it to the store
        let newItem = itemStore.createItem()
        
        //figure out where that items is in the arrary
        if let index = itemStore.allItems.indexOf(newItem){
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        
        //insert this new row into the table
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    
        }
        
    }
    @IBAction func toggleEditingMode(sender: AnyObject){
        
        //if you are currently in editing mode..
        if editing {
            //change text of button to inform user of state
            sender.setTitle("Edit", forState: .Normal)
            
            //turn off editing mode
            setEditing(false, animated: true)
            
        }else {
            //chnage text of button to inform user of state
            sender.setTitle("Done", forState: .Normal)
            //enter editing mode
            setEditing(true, animated: true)
        }
        
    }
    
    override func tableView(tableView:UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        //if the table view is asking to commit a delete command ...
        if editingStyle == .Delete {
            let item = itemStore.allItems[indexPath.row]
            
            
            
            let title = "Remove \(item.name)?"
            let message = "Are you sure you wanna delete this item?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Remove", style: .Destructive, handler: { (action) -> Void in
            
            
            //remove the item from the store
            self.itemStore.removeItem(item)
            
            //also remove the row from the table view with an animation
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                
            })
            
            ac.addAction(deleteAction)
            
            //present the alert controller
            presentViewController(ac, animated:  true, completion: nil)
            
            
        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath){
        
        //update the model
        itemStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //get the height of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left:0, bottom:0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
//        tableView.rowHeight = 65
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        
    
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section:Int) ->Int {
        return itemStore.allItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        //create an instance of UITableViewCell, with default appearance
        //let cell = UITableViewCell(style: .Value1, reuseIdentifier: "UITableViewCell")
       
        //get a new or recycled cell
        //let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)

        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
        
        //update font
        cell.updateLabels()
        
        //set the text on the cell with the description of the item
        //that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        
        let item = itemStore.allItems[indexPath.row]
        
//        cell.textLabel?.text = item.name
//        cell.detailTextLabel?.text = "$\(item.valueInDollars)"

        //configure the cell with the item
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        cell.valueLabel.text = "&\(item.valueInDollars)"
        print(item.valueInDollars)
        if item.valueInDollars>50 {
        cell.valueLabel.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        } else {
        cell.valueLabel.textColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        }
        
        return cell
        
    }
    
}

