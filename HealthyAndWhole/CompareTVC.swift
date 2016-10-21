//
//  CompareTVC.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 10/19/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class CompareTVC: UITableViewController {
    
    var measurementsArray: [Measurements] = []
    var startMeasurements: Measurements?
    var endMeasurements: Measurements?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for item in user.measurements! { measurementsArray.append(item as! Measurements) }
        
        startMeasurements = measurementsArray[0]
        endMeasurements = measurementsArray[1]
        
        self.tableView.reloadData()
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 9
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("startEndCell", forIndexPath: indexPath) as! StartEndCell
        
        guard startMeasurements != nil && endMeasurements != nil else { return cell }

        switch indexPath.row {
            
        case 0:
            cell.categoryLabel.text = "Height"
            cell.startNumber.text = "\(startMeasurements!.height!)"
            cell.endNumber.text = "\(endMeasurements!.height!)"
            return cell
        case 1:
            cell.categoryLabel.text = "Weight"
            cell.startNumber.text = "\(startMeasurements!.weight!)"
            cell.endNumber.text = "\(endMeasurements!.weight!)"
            return cell
        case 2:
            cell.categoryLabel.text = "Hip"
            cell.startNumber.text = "\(startMeasurements!.hip!)"
            cell.endNumber.text = "\(endMeasurements!.hip!)"
            return cell
        case 3:
            cell.categoryLabel.text = "Waist"
            cell.startNumber.text = "\(startMeasurements!.waist!)"
            cell.endNumber.text = "\(endMeasurements!.waist!)"
            return cell
        case 4:
            cell.categoryLabel.text = "Bust"
            cell.startNumber.text = "\(startMeasurements!.bust!)"
            cell.endNumber.text = "\(endMeasurements!.bust!)"
            return cell
        case 5:
            cell.categoryLabel.text = "Thigh"
            cell.startNumber.text = "\(startMeasurements!.thigh!)"
            cell.endNumber.text = "\(endMeasurements!.thigh!)"
            return cell
        case 6:
            cell.categoryLabel.text = "Upper Arm"
            cell.startNumber.text = "\(startMeasurements!.upperArm!)"
            cell.endNumber.text = "\(endMeasurements!.upperArm!)"
            return cell
        case 7:
            cell.categoryLabel.text = "Mood"
            cell.startNumber.text = "\(startMeasurements!.mood!)"
            cell.endNumber.text = "\(endMeasurements!.mood!)"
            return cell
        default:
            cell.categoryLabel.text = "Closeness To God"
            cell.startNumber.text = "\(startMeasurements!.closeness!)"
            cell.endNumber.text = "\(endMeasurements!.closeness!)"
            return cell
            
        }

    }
    
}
