//
//  PastReservationsTableViewCell.swift
//  CineCity
//
//  Created by Fabiana Montiel on 07/02/2020.
//  Copyright © 2020 Vtd. All rights reserved.
//

import UIKit

class PastReservationsTableViewCell: UITableViewCell {

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
