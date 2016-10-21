//
//  StatTVC.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 10/21/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class StatTVC: UITableViewController {

    var category = ""
    
    var statArray: [String] = []
    var statArray2: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch category {
            
        case "Water":
            
            for item in user.log! {
                
                statArray.append("\((item as! Log).water)")
                
            }
            
        case "Breakfast":
            
            for item in user.log! {
                
                statArray.append("\((item as! Log).breakfast)")
                statArray2.append("\((item as! Log).breakfastCalories)")
                
            }
            
        case "Lunch":
            
            for item in user.log! {
                
                statArray.append("\((item as! Log).lunch)")
                statArray2.append("\((item as! Log).lunchCalories)")
                
            }
            
        case "Dinner":
            
            for item in user.log! {
                
                statArray.append("\((item as! Log).dinner)")
                statArray2.append("\((item as! Log).dinnerCalories)")
                
            }
            
        case "Snacks":
        
            for item in user.log! {
                
                statArray.append("\((item as! Log).snacks)")
                statArray2.append("\((item as! Log).snacks)")
                
            }
            
        case "Sleep":
            
            for item in user.log! {
                
                statArray.append("\((item as! Log).sleepInfo)")
                statArray2.append("\((item as! Log).sleepTime)")
                
            }
            
        case "Activity":
            
            for item in user.log! {
                
                statArray.append("\((item as! Log).stepCount)")
                statArray2.append("\((item as! Log).activeMinutes)")
                
            }
            
        case "Mood":
            
            for item in user.log! {
                    
                    statArray.append("\((item as! Log).mood)")
                
            }
            
        case "Closeness To God":
            
            for item in user.log! {
                    
                    statArray.append("\((item as! Log).closeness)")
                    
            }
           
        default:
            
            break
            
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 8
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Week \(section + 1)"
        
    }
    
}
