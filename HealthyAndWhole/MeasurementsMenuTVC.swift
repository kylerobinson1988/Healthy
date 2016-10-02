//
//  MeasurementsMenuTVC.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 9/9/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class MeasurementsMenuTVC: UITableViewController {

    var measurements: [Measurements] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for item in user.measurements! {
            
            let adjustedItem = item as! Measurements
            measurements.append(adjustedItem)
            
        }
        
        tableView.reloadData()
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return measurements.count + 1
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0:
            
            switch indexPath.row {
                
            case 0:
                
                let cell = tableView.dequeueReusableCellWithIdentifier("infoCell", forIndexPath: indexPath) as! InfoCell
                cell.infoLabel.text = "Enter you starting measurements below. You can enter your final measurements after you finish the eight weeks of the program."
                
                return cell
                
            default:
                
                let cell = tableView.dequeueReusableCellWithIdentifier("measurementCell", forIndexPath: indexPath) as! MeasurementCell
                
                cell.indicator.fillColor = measurements[indexPath.row - 1].isComplete == false ? UIColor.raspberryRed() : UIColor.mintGreen()
                
                cell.titleLabel.text = indexPath.row == 1 ? "Baseline Measurements" : "Final Measurements"
                
                return cell
                
            }
            
        default:
            
            if user.complete == false {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("infoCell", forIndexPath: indexPath) as! InfoCell
                
                cell.infoLabel.text = "When you've completed the nine weeks, you'll enter the final measurements here."
                
                return cell
                
            } else {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("graphCell", forIndexPath: indexPath) as! GraphCell
                
                return cell
                
            }
            
        }
    
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0 && indexPath.row != 0 { measurementsSegue(indexPath.row - 1) }
        
    }
    
    // MARK: - Navigation

    func measurementsSegue(index: Int) {
        
        let measurementsDetailTVC = storyboard?.instantiateViewControllerWithIdentifier("measurementsDetailTVC") as! MeasurementsDetailTVC
        
        measurementsDetailTVC.measurements = measurements[index]
        
        self.navigationController?.pushViewController(measurementsDetailTVC, animated: true)
        
    }
    
}










