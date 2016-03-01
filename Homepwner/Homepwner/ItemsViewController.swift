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
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //get the height of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left:0, bottom:0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section:Int) ->Int {
        return itemStore.allItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        //create an instance of UITableViewCell, with default appearance
        //let cell = UITableViewCell(style: .Value1, reuseIdentifier: "UITableViewCell")
       
        //get a new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        
        //set the text on the cell with the description of the item
        //that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
        
    }
    
}

