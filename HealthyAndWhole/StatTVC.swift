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

        if demoMode == true {
            
            for item in 1...56 {
                
                statArray.append("\(item)")
                statArray2.append("Porkins \(item)")
                
            }
            
            return
        }
        
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
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return statArray2.isEmpty == true ? 30 : 60
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        guard statArray.count >= 56 else { return UITableViewCell() }
        
        switch indexPath.section {
            
        case 0:
            
            if statArray2.isEmpty == true {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("statDetailCell", forIndexPath: indexPath) as! StatDetailCell
                
                cell.cellLabel.text = statArray[indexPath.row]
                
                return cell
                
            } else {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("statDetailCell2", forIndexPath: indexPath) as! StatDetailCell2
                
                cell.topLabel.text = statArray[indexPath.row]
                cell.bottomLabel.text = statArray2[indexPath.row]
                
                return cell

            }
            
        case 1:
            
            if statArray2.isEmpty == true {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("statDetailCell", forIndexPath: indexPath) as! StatDetailCell
                
                cell.cellLabel.text = statArray[indexPath.row + 7]
                
                return cell
                
            } else {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("statDetailCell2", forIndexPath: indexPath) as! StatDetailCell2
                
                cell.topLabel.text = statArray[indexPath.row + 7]
                cell.bottomLabel.text = statArray2[indexPath.row + 7]
                
                return cell
                
            }
            
        case 2:
            
            if statArray2.isEmpty == true {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("statDetailCell", forIndexPath: indexPath) as! StatDetailCell
                
                cell.cellLabel.text = statArray[indexPath.row + 14]
                
                return cell
                
            } else {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("statDetailCell2", forIndexPath: indexPath) as! StatDetailCell2
                
                cell.topLabel.text = statArray[indexPath.row + 14]
                cell.bottomLabel.text = statArray2[indexPath.row + 14]
                
                return cell
                
            }
            
        case 3:
            
            if statArray2.isEmpty == true {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("statDetailCell", forIndexPath: indexPath) as! StatDetailCell
                
                cell.cellLabel.text = statArray[indexPath.row + 21]
                
                return cell
                
            } else {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("statDetailCell2", forIndexPath: indexPath) as! StatDetailCell2
                
                cell.topLabel.text = statArray[indexPath.row + 21]
                cell.bottomLabel.text = statArray2[indexPath.row + 21]
                
                return cell
                
            }
            
        case 4:
            
            if statArray2.isEmpty == true {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("statDetailCell", forIndexPath: indexPath) as! StatDetailCell
                
                cell.cellLabel.text = statArray[indexPath.row + 28]
                
                return cell
                
            } else {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("statDetailCell2", forIndexPath: indexPath) as! StatDetailCell2
                
                cell.topLabel.text = statArray[indexPath.row + 28]
                cell.bottomLabel.text = statArray2[indexPath.row + 28]
                
                return cell
                
            }
            
        case 5:
            
            if statArray2.isEmpty == true {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("statDetailCell", forIndexPath: indexPath) as! StatDetailCell
                
                cell.cellLabel.text = statArray[indexPath.row + 35]
                
                return cell
                
            } else {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("statDetailCell2", forIndexPath: indexPath) as! StatDetailCell2
                
                cell.topLabel.text = statArray[indexPath.row + 35]
                cell.bottomLabel.text = statArray2[indexPath.row + 35]
                
                return cell
                
            }
            
        case 6:
            
            if statArray2.isEmpty == true {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("statDetailCell", forIndexPath: indexPath) as! StatDetailCell
                
                cell.cellLabel.text = statArray[indexPath.row + 42]
                
                return cell
                
            } else {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("statDetailCell2", forIndexPath: indexPath) as! StatDetailCell2
                
                cell.topLabel.text = statArray[indexPath.row + 42]
                cell.bottomLabel.text = statArray2[indexPath.row + 42]
                
                return cell
                
            }
            
        default:
            
            if statArray2.isEmpty == true {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("statDetailCell", forIndexPath: indexPath) as! StatDetailCell
                
                cell.cellLabel.text = statArray[indexPath.row + 49]
                
                return cell
                
            } else {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("statDetailCell2", forIndexPath: indexPath) as! StatDetailCell2
                
                cell.topLabel.text = statArray[indexPath.row + 49]
                cell.bottomLabel.text = statArray2[indexPath.row + 49]
                
                return cell
                
            }
            
        }
        
    }
    
}









