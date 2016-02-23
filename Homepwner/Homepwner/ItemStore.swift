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

    func createItem() -> Item
    {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    init()
    {
        for _ in 0..<10
        {
            createItem()
        }
    }

}



