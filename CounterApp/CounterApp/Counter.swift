//
//  Counter.swift
//  CounterApp
//
//  Created by Keval Shah on 3/22/16.
//  Copyright © 2016 Keval Shah. All rights reserved.
//

import UIKit
class Counter: NSObject
{
    var name: String
    var countValue: Int
    
    init(name: String, countValue: Int)
    {
        self.name = name
        self.countValue = countValue
        super.init()
    }
    
    convenience init(random: Bool = false)
    {
        if random
        {
            let nouns = ["Coffee","Run Miles","Glasses of Water"]
            
            let idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            
            self.init(name: randomName, countValue: randomValue )
        }
        else
        {
            self.init(name: "", countValue: 0)
        }
    }
    
}

