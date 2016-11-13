//
//  GraphsTVC.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 9/28/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class GraphsTVC: UITableViewController {

    var selectedCategory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.tableView.reloadData()
        
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return indexPath.section == 0 ? 70 : 220
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0:
            
            let cell = tableView.dequeueReusableCellWithIdentifier("infoCell", forIndexPath: indexPath) as! InfoCell
            
            cell.infoLabel.text = "You can see your progress across the eight weeks below. Tap a graph for that statistic's detail."
            
            return cell
            
        default: //The categories.
            
            let cell = tableView.dequeueReusableCellWithIdentifier("graphCell") as! GraphCell
            
            switch indexPath.row {
            case 0:
                cell.graphCategory = "water"
            case 1:
                cell.graphCategory = "breakfast"
            case 2:
                cell.graphCategory = "lunch"
            case 3:
                cell.graphCategory = "dinner"
            case 4:
                cell.graphCategory = "snacks"
            case 5:
                cell.graphCategory = "sleep"
            case 6:
                cell.graphCategory = "stepCount"
            case 7:
                cell.graphCategory = "activeMinutes"
            case 8:
                cell.graphCategory = "mood"
            default:
                cell.graphCategory = "closeness"
                
            }
            
            return cell
            
        }
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0 { return }
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! GraphCell
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let statTVC = storyboard.instantiateViewControllerWithIdentifier("statTVC") as! StatTVC
        
        statTVC.category = cell.graphCategory
        
        self.navigationController?.pushViewController(statTVC, animated: true)
        
    }

}



























