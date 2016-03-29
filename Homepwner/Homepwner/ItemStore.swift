//
//  ItemStore.swift
//  Homepwner
//
//  Created by Keval Shah on 2/23/16.
//  Copyright © 2016 Keval Shah. All rights reserved.
//

import UIKit

class ItemStore
{
    var allItems = [Item]()
    let itemArchiveURL: NSURL = {
        let documentDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("items.archive")
    }()
    
    func saveChanges() -> Bool
    {
        print("Saving items to : \(itemArchiveURL.path!)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path!)
    }
    
    init()
    {
        if let archivedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(itemArchiveURL.path!) as? [Item]
        {
            allItems += archivedItems
        }
    }

    func createItem() -> Item
    {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    func removeItem(item: Item)
    {
        if let index = allItems.indexOf(item)
        {
            allItems.removeAtIndex(index)
        }
    }
    
    func moveItemAtIndex(fromIndex: Int, toIndex: Int)
    {
        if fromIndex == toIndex
        {
            return
        }
        
        let movedItem = allItems[fromIndex]
        
        allItems.removeAtIndex(fromIndex)
        
        allItems.insert(movedItem, atIndex: toIndex)
    }
    
    /* init()
    {
        for _ in 0..<10
        {
            createItem()
        }
    } */

}



