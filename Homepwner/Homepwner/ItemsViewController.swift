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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight + 15, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
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
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
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
        if indexPath.row < itemStore.allItems.count
        {
            let item = itemStore.allItems[indexPath.row]
            cell.textLabel?.text = item.name
            let textSize = cell.textLabel?.font
            cell.textLabel?.font  = textSize!.fontWithSize(20)
            cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        }
            
        else
        {
            cell.textLabel?.text = "No More Items!"
            cell.detailTextLabel?.text = ""
        }
        
        return cell
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