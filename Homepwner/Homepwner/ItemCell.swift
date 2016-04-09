//
//  ItemCell.swift
//  Homepwner
//
//  Created by Yuchi on 6/3/16.
//  Copyright © 2016 Yuchi. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell{
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    func updateLabels(){
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        nameLabel.font = bodyFont
        valueLabel.font = bodyFont
        
        let captain1Font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        serialNumberLabel.font = captain1Font
    
    }
    
    
    
}
