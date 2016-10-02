//
//  GraphCell.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 9/9/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class GraphCell: UITableViewCell {

    @IBOutlet weak var indicator: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var graph: DesignableGraph!
    
    var dayArray: [Int] = []
    var weekArray: [Int] = []
    
    var graphCategory: String = "" { didSet { setupGraph() } }
    
    func setupGraph() {
        
        for item in user.log! {
            
            let log = item as! Log
            
            switch graphCategory {
                
            case "water":
                dayArray.append(Int(log.water!))
            case "breakfastCalories":
                dayArray.append(Int(log.breakfastCalories!))
            case "lunchCalories":
                dayArray.append(Int(log.lunchCalories!))
            case "dinnerCalories":
                dayArray.append(Int(log.dinnerCalories!))
            case "snackCalories":
                dayArray.append(Int(log.snackCalories!))
            case "sleepHours":
                dayArray.append(Int(log.sleepTime!))
            case "stepCount":
                dayArray.append(Int(log.stepCount!))
            case "activeMinutes":
                dayArray.append(Int(log.activeMinutes!))
            case "mood":
                dayArray.append(Int(log.mood!))
            case "closeness":
                dayArray.append(Int(log.breakfastCalories!))
            default:
                break
            }
            
        }
        
        //Now find averages based on weeks
        
        for week in 0...8 {
            
            for item in weekCount...(weekCount + 6) {
                
                
                
            }
            
            
            
        }
        
        
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
