//
//  LogMenuTVC.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 9/8/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class LogMenuTVC: UITableViewController {

    //This variable holds logs loaded from CoreData.
    var logs: [Log] = []
    
    var logIndex = 0
    
    var currentLog: Log!
    
    var weeksCompleted = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadFromCoreData()
        
        self.navigationItem.title = "Logs"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        calculateWeeksComplete()
        
        self.tableView.reloadData()
        
    }

    func loadFromCoreData() {
        
        for item in user.log! {
            
            let adjustedItem = item as! Log
            logs.append(adjustedItem)
        
            if currentLog == nil && (adjustedItem.isComplete == false || adjustedItem.isComplete == nil) {
                currentLog = adjustedItem
            }
            
        }

    }
    
    func calculateWeeksComplete() {
        
        weeksCompleted = 0
        
        var daysCompleted = 0 {
            
            didSet {
                
                if daysCompleted % 7 == 0 { weeksCompleted += 1 }
                
            }
            
        }
        
        for item in logs {
            
            if item.isComplete == true { daysCompleted += 1 }
            
        }
        
//        weeksCompleted = daysCompleted / 7
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 10
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 7
            
        }
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
            
        case 0:
            return ""
        case 1:
            return "Today"
        default:
            return "Week \(section - 1)"
            
        }
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0: //Header
            
            let cell = tableView.dequeueReusableCellWithIdentifier("statusCell") as! StatusCell
            
            let barValue = (CGFloat(weeksCompleted) / 8)
            cell.statusBar.currentValue = weeksCompleted == 0 ? 0 : barValue
            cell.weeksCompleteLabel.text = weeksCompleted == 1 ? "\(weeksCompleted) Week Completed" : "\(weeksCompleted) Weeks Completed"
            
            return cell
            
        case 1: //Today. When finished, this is where the graphs will go.
            
            let cell = tableView.dequeueReusableCellWithIdentifier("logMenuCell", forIndexPath: indexPath) as! LogMenuCell
            
            //Completed
            if weeksCompleted == 8 || demoMode == true {
                
                cell.dayLabel.text = "Final Results"
                cell.completionLabel.hidden = true
                cell.completionIndicator.fillColor = UIColor(red:0.15, green:0.53, blue:0.80, alpha:1.00)
                
                return cell
                
            }
            
            //Not Completed
            if currentLog != nil {
                cell.log = currentLog
                cell.dayLabel.text = "Week \(currentLog.week!), Day \(currentLog.day!)"
            }
            
            return cell
            
        case 2: //Week 1
            
            let cell = tableView.dequeueReusableCellWithIdentifier("logMenuCell", forIndexPath: indexPath) as! LogMenuCell
            
            cell.completionLabel.text = "Incomplete"
            let log = logs[indexPath.row]
            
            cell.log = log
            
            return cell
            
        case 3: //Week 2
            
            let cell = tableView.dequeueReusableCellWithIdentifier("logMenuCell", forIndexPath: indexPath) as! LogMenuCell
            
            cell.completionLabel.text = "Incomplete"
            let log = logs[indexPath.row + 7]
            
            cell.log = log
            
            return cell
            
        case 4: //Week 3
            
            let cell = tableView.dequeueReusableCellWithIdentifier("logMenuCell", forIndexPath: indexPath) as! LogMenuCell
            
            cell.completionLabel.text = "Incomplete"
            let log = logs[indexPath.row + 14]
            
            cell.log = log
            
            return cell
            
        case 5: //Week 4
            
            let cell = tableView.dequeueReusableCellWithIdentifier("logMenuCell", forIndexPath: indexPath) as! LogMenuCell
            
            cell.completionLabel.text = "Incomplete"
            let log = logs[indexPath.row + 21]
            
            cell.log = log
            
            return cell
            
        case 6: //Week 5
            
            let cell = tableView.dequeueReusableCellWithIdentifier("logMenuCell", forIndexPath: indexPath) as! LogMenuCell
            
            cell.completionLabel.text = "Incomplete"
            let log = logs[indexPath.row + 28]
            
            cell.log = log
            
            return cell
            
        case 7: //Week 6
            
            let cell = tableView.dequeueReusableCellWithIdentifier("logMenuCell", forIndexPath: indexPath) as! LogMenuCell
            
            cell.completionLabel.text = "Incomplete"
            let log = logs[indexPath.row + 35]
            
            cell.log = log
            
            return cell
        case 8: //Week 7
            
            let cell = tableView.dequeueReusableCellWithIdentifier("logMenuCell", forIndexPath: indexPath) as! LogMenuCell
            
            cell.completionLabel.text = "Incomplete"
            let log = logs[indexPath.row + 42]
            
            cell.log = log
            
            return cell
        default: //Week 8
            
            let cell = tableView.dequeueReusableCellWithIdentifier("logMenuCell", forIndexPath: indexPath) as! LogMenuCell
            
            cell.completionLabel.text = "Incomplete"
            let log = logs[indexPath.row + 49]
            
            cell.log = log
            
            return cell
            
        }
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.section {
            
        case 0: //Header
            
            return
            
        case 1:
            
            if demoMode == true {
                
                performSegueWithIdentifier("showGraphsSegue", sender: nil)
                return
                
            }
            
            if weeksCompleted != 8 {
                
                let log = currentLog
                logSegue(log)
                
            } else {
                
                performSegueWithIdentifier("showGraphsSegue", sender: nil)
                
            }
            
            
        case 2: //Week 1
            
            let log = logs[indexPath.row]
            
            logSegue(log)
            
        case 3: //Week 2
            
            let log = logs[indexPath.row + 7]
            
            logSegue(log)
            
        case 4: //Week 3
            
            let log = logs[indexPath.row + 14]
            
            logSegue(log)
            
        case 5: //Week 4
            
            let log = logs[indexPath.row + 21]
            
            logSegue(log)
            
        case 6: //Week 5
            
            let log = logs[indexPath.row + 28]
            
            logSegue(log)
            
        case 7: //Week 6
            
            let log = logs[indexPath.row + 35]
            
            logSegue(log)

        case 8: //Week 7
            
            let log = logs[indexPath.row + 42]
            
            logSegue(log)

        default: //Week 8
            
            let log = logs[indexPath.row + 49]
            
            logSegue(log)
            
        }
        
    }
   
    func logSegue(log: Log) {
        
        let logDetailTVC = storyboard?.instantiateViewControllerWithIdentifier("logDetailTVC") as! LogDetailTVC
        
        logDetailTVC.log = log
        
        self.navigationController?.pushViewController(logDetailTVC, animated: true)
        
    }
    
}






