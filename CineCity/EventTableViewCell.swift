//
//  EventTableViewCell.swift
//  CineCity
//
//  Created by Dorian on 12/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet var nameEvent: UILabel!
    @IBOutlet var dateEvent: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
