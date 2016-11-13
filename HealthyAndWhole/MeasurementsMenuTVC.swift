//
//  MeasurementsMenuTVC.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 9/9/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit
import CoreData

class MeasurementsMenuTVC: UITableViewController {

    var measurements: [Measurements] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Measurements"
//        self.navigationController?.navigationBar. = UIColor(red:0.15, green:0.53, blue:0.80, alpha:1.00)

        tableView.tableFooterView = UIView(frame: CGRectZero)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        measurements = []
        
        for item in user.measurements ?? [] {
            
            let adjustedItem = item as! Measurements
            measurements.append(adjustedItem)
            
        }
        
        tableView.reloadData()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return (user.complete == true || demoMode == true) ? 2 : 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0 {
            return (user.complete == true || demoMode == true) ? measurements.count + 1 : measurements.count
        } else {
            
            var isVerified = true
            
            for item in measurements {
                
                if item.isComplete == false { isVerified = false }
                
            }
            
            return isVerified == true ? 1 : 0
        }
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0:
            
            switch indexPath.row {
                
            case 0:
                
                let cell = tableView.dequeueReusableCellWithIdentifier("infoCell", forIndexPath: indexPath) as! InfoCell
                cell.infoLabel?.text = "Enter you starting measurements below. You can enter your final measurements after you finish the eight weeks of the program."
                
                return cell
                
            default:
                
                let cell = tableView.dequeueReusableCellWithIdentifier("measurementCell", forIndexPath: indexPath) as! MeasurementCell
                
                cell.indicator.fillColor = measurements[indexPath.row - 1].isComplete == true ? UIColor.mintGreen() : UIColor.raspberryRed()
                
                cell.titleLabel?.text = indexPath.row == 1 ? "Starting Measurements" : "Final Measurements"
                
                return cell
                
            }
            
        default:
            
            let cell = tableView.dequeueReusableCellWithIdentifier("compareCell", forIndexPath: indexPath)
            
            return cell
            
        }
    
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0 && indexPath.row != 0 {
            
            measurementsSegue(indexPath.row - 1)
        
        }
        
    }
    
    // MARK: - Navigation
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        if identifier == "compareSegue" && measurements.count >= 2 {
            
            if measurements[0].isComplete == true && measurements[1].isComplete == true {
                
                return true
                
            } else {
                
                Alert.Warning(self, title: "Error", message: "Please complete both Starting and Final Measurements to compare.")
                return false
                
            }
            
        }
        
        return true
        
    }

    func measurementsSegue(index: Int) {
        
        let measurementsDetailTVC = storyboard?.instantiateViewControllerWithIdentifier("measurementsDetailTVC") as! MeasurementsDetailTVC
        
        measurementsDetailTVC.measurements = measurements[index]
        
        if index == 1 {
            measurementsDetailTVC.finalMeasurements = true
        }
        
        self.navigationController?.pushViewController(measurementsDetailTVC, animated: true)
        
    }
    
}










