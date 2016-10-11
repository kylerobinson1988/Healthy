//
//  GraphCell.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 9/9/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class GraphCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var graph: DesignableGraph!
    
    var dayArray: [CGFloat] = []
    var weekArray: [Grouping] = []
    
    var scale = 0
    
    var graphCategory: String = "" { didSet { setupGraph() } }
    
    func setupGraph() {
        
        dayArray = []
        weekArray = []
        
        for item in user.log! {
            
            let log = item as! Log
            
//            print("Log Week \(log.week), Day \(log.day)")
            
            switch graphCategory {
                
            case "water":
                dayArray.append(CGFloat(log.water!))
            case "breakfastCalories":
                dayArray.append(CGFloat(log.breakfastCalories!))
            case "lunchCalories":
                dayArray.append(CGFloat(log.lunchCalories!))
            case "dinnerCalories":
                dayArray.append(CGFloat(log.dinnerCalories!))
            case "snackCalories":
                dayArray.append(CGFloat(log.snackCalories!))
            case "sleepHours":
                dayArray.append(CGFloat(log.sleepTime!))
            case "stepCount":
                dayArray.append(CGFloat(log.stepCount!))
            case "activeMinutes":
                dayArray.append(CGFloat(log.activeMinutes! ?? 0))
            case "mood":
                dayArray.append(CGFloat(log.mood!))
            case "closeness":
                dayArray.append(CGFloat(log.breakfastCalories!))
            default:
                break
            }
            
        }
        
        //Now find averages based on weeks.
        
        var index = 0
        
        for week in 1...7 {
            
            var sum = 0
            
            for item in index...(index + 6) {
                
//                print("Index: \(index)")
                
                let thingy = dayArray[item]

                sum += Int(thingy)
                index += 1

            }
            
            weekArray.append(Grouping(name: "\(week)", value: CGFloat(sum / 7)))
                
//            index += 7
            
        }
        
        //Next, we set up the graph.
        
        graph.groupings = weekArray
        graph.type = .Bars
        
        print(graph.groupings.map { $0.values })
        
        //Final config for the cell.
        
        switch graphCategory {
            
        case "water":
            titleLabel.text = "Water"
        case "breakfastCalories":
            titleLabel.text = "Breakfast"
        case "lunchCalories":
            titleLabel.text = "Lunch"
        case "dinnerCalories":
            titleLabel.text = "Dinner"
        case "snackCalories":
            titleLabel.text = "Snacks"
        case "sleepHours":
            titleLabel.text = "Sleep"
        case "stepCount":
            titleLabel.text = "Steps"
        case "activeMinutes":
            titleLabel.text = "Active Minutes"
        case "mood":
            titleLabel.text = "Mood"
        default:
            titleLabel.text = "Closeness To God"
        }
        
        graph.duration = 0.4
        graph.start()
        
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
