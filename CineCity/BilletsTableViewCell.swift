//
//  BilletsTableViewCell.swift
//  CineCity
//
//  Created by Viviana Montiel on 24/01/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class BilletsTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
