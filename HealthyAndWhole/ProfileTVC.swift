//
//  ProfileTVC.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 10/12/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class ProfileTVC: UITableViewController {

    var notificationsActivated = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    //MARK: - Actions
    
    func dailyReminder() {
        
        let dateComp: NSDateComponents = NSDateComponents()
//        dateComp.year = 2015;
//        dateComp.month = 06;
//        dateComp.day = 03;
        dateComp.hour = reminderHour;
        dateComp.minute = reminderMinute;
        dateComp.timeZone = NSTimeZone.systemTimeZone()
        
        let calender: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let date: NSDate = calender.dateFromComponents(dateComp)!
        
        let notification: UILocalNotification = UILocalNotification()
        notification.category = "Healthy & Whole"
        notification.alertBody = "Don't forget to log your day in the app!"
        notification.fireDate = date
        notification.repeatInterval = NSCalendarUnit.Day
        
        if notificationsActivated == true {
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
        } else {
            UIApplication.sharedApplication().cancelAllLocalNotifications()
        }
        
    }
    
    func resetData() {
        
        context.deleteObject(user)
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Error deleting user: \(error)")
        }
        
    }
    
}
