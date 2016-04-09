//
//  CounterListCell.swift
//  CounterApp
//
//  Created by Keval Shah on 3/22/16.
//  Copyright © 2016 Keval Shah. All rights reserved.
//

import UIKit

class CounterListCell: UITableViewCell
{
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var counterLabel: UILabel!
    
    func updateLabels()
    {
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        nameLabel.font = bodyFont
        counterLabel.font = bodyFont
    }
}
