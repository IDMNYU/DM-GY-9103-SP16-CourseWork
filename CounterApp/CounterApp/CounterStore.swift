//
//  CounterStore.swift
//  CounterApp
//
//  Created by Keval Shah on 3/22/16.
//  Copyright © 2016 Keval Shah. All rights reserved.
//

import UIKit

class CounterStore
{
    var allCounters = [Counter]()
    
    func createCounter() -> Counter
    {
        let newCounter = Counter(random: true)
        
        allCounters.append(newCounter)
        
        return newCounter
    }
    
    func removeCounter(counter: Counter)
    {
        if let index = allCounters.indexOf(counter)
        {
            allCounters.removeAtIndex(index)
        }
    }
    
    func moveItemAtIndex(fromIndex: Int, toIndex: Int)
    {
        if fromIndex == toIndex
        {
            return
        }
        
        let movedItem = allCounters[fromIndex]
        
        allCounters.removeAtIndex(fromIndex)
        
        allCounters.insert(movedItem, atIndex: toIndex)
    }
    
    init()
    {
        for _ in 0..<5
        {
            createCounter()
        }
    }
    
}



