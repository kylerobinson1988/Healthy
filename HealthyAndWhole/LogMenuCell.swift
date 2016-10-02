//
//  LogMenuCell.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 9/8/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class LogMenuCell: UITableViewCell {

    var log: Log! {
        
        didSet {
            
            self.completionIndicator.fillColor = log.isComplete == true ? UIColor.mintGreen() : UIColor.raspberryRed()
            self.completionLabel.text = log.isComplete == true ? "Complete" : "Incomplete"
            self.dayLabel.text = "Day \(log.day!)"

        }
        
    }
    
    @IBOutlet weak var completionIndicator: DesignableView!
    @IBOutlet weak var completionLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
