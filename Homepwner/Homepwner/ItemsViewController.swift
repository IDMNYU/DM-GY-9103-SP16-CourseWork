//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Keval Shah on 2/23/16.
//  Copyright © 2016 Keval Shah. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController
{
    var itemStore: ItemStore!
    
    
    @IBAction func addNewItem(sender: AnyObject)
    {
        //let lastRow = tableView.numberOfRowsInSection(0)
        //let indexPath = NSIndexPath(forRow: lastRow, inSection: 0)
        
        //tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        let newItem = itemStore.createItem()
        
        if let index = itemStore.allItems.indexOf(newItem)
        {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        

    }
    
    @IBAction func toggleEditingMode(sender: AnyObject)
    {
        if editing
        {
            sender.setTitle("Edit", forState: .Normal)
            setEditing(false, animated: true)
        }
        else
        {
            sender.setTitle("Done", forState: .Normal)
            setEditing(true, animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "iosback.png"))
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight + 15, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        /*var over50 = 0
        for i in itemStore.allItems
        {
            if i.valueInDollars > 50
            {
                over50 += 1
            }
        }
        var itemsInSection = 0
        if section == 0
        {
            itemsInSection = over50
        }
        else if section  == 1
        {
            itemsInSection = itemStore.allItems.count - over50
        }
        
        return itemsInSection*/
        
        let count = itemStore.allItems.count
        return count + 1
    }
    
  /*  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section == 0
        {
            return "Items Over $50"
        }
        else
        {
            return "Items Under or $50"
        }
    } */
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
        
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
       /* let row = indexPath.row

        var item: Item?
        var currItemIndex = 0
        let section = indexPath.section

        for i in itemStore.allItems
        {
            if section == 0 && i.valueInDollars > 50
            {
                currItemIndex++
            }
                
            else  if section == 1 &&  i.valueInDollars <= 50
            {
                currItemIndex++
            }
            
            if currItemIndex - 1 == row
            {
                item = i
                break;
            }
        }
        
        cell.textLabel?.text = item!.name
        cell.detailTextLabel?.text = "$\(item!.valueInDollars)"
        
        return cell*/
        
        
        cell.updateLabels()
        
        if indexPath.row < itemStore.allItems.count
        {
            let item = itemStore.allItems[indexPath.row]
            cell.nameLabel.text = item.name
            cell.serialNumberLabel.text = item.serialNumber
            //let textSize = cell.textLabel?.font
            //cell.textLabel?.font  = textSize!.fontWithSize(20)
            cell.valueLabel.text = "$\(item.valueInDollars)"
            if item.valueInDollars < 50
            {
                cell.valueLabel.textColor = UIColor.greenColor()
            }
            else
            {
                cell.valueLabel.textColor = UIColor.redColor()
            }
        }
            
        else
        {
            cell.nameLabel?.text = "No More Items!"
            cell.valueLabel?.text = ""
            cell.serialNumberLabel?.text = " "
        }
        
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Delete \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Remove", style: .Destructive, handler: {(action) -> Void in
                self.itemStore.removeItem(item)
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)})
            ac.addAction(deleteAction)

            
            presentViewController(ac, animated: true, completion: nil)
            
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return !(indexPath.row == itemStore.allItems.count)        
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        itemStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return !(indexPath.row == itemStore.allItems.count)
    }
    
    override func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
            if proposedDestinationIndexPath.row == itemStore.allItems.count
            {
                return NSIndexPath(forRow: proposedDestinationIndexPath.row - 1,  inSection: 0)
            }
            else
            {
                return proposedDestinationIndexPath
            }
        }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row < itemStore.allItems.count
        {
            return 60
        }
        else
        {
            return 44
        }
    }
    
}