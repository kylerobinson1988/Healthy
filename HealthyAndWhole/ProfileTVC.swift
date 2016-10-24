//
//  ProfileTVC.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 10/12/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class ProfileTVC: UITableViewController {

    @IBOutlet weak var notificationSwitch: UISwitch!
    @IBOutlet weak var notificationPicker: UIPickerView!
    
    var notificationsActivated = false
    var amTruePMFalse = true
    
    var selectedHour = 12
    var selectedMinute = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Picker methods
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 3
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
            
        case 0: //Hours
            return 12
            
        case 1: //Minutes
            
            return 60
            
        default: //AM/PM
            
            return 2
            
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch component {
            
        case 0: //Hours
            
            return "\(row + 1)"
            
        case 1: //Minutes
            
            switch row {
                
            case 0...9:
                
                return "0\(row)"
                
            default:
                
                return "\(row)"
                
            }
            
        default:
            
            return row == 0 ? "AM" : "PM"
            
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
            
        case 0:
            
            selectedHour = Int(row + 1)
            
        case 1:
            
            selectedMinute = Int(row)
            
        default:
            
            amTruePMFalse = row == 0 ? true : false
            
        }
        
        setTime()
        
    }
    
    func setTime() {
    
        if amTruePMFalse == true && selectedHour == 12 {
            reminderHour = 0
        } else if amTruePMFalse == false && selectedHour == 12 {
            reminderHour = 12
        } else {
            reminderHour = amTruePMFalse == true ? selectedHour : selectedHour + 12
        }
        reminderMinute = selectedMinute
        
        print("Hour: \(reminderHour), Minute: \(reminderMinute)")
        
        if notificationsActivated == true {
        
            dailyReminder()
        
        }
    }

    //MARK: - Actions
    
    @IBAction func switchFlipped(sender: AnyObject) {
    
        notificationsActivated = sender.on == true ? true : false
    
        dailyReminder()
        
    }
    
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
        notification.alertBody = "Remember to log your day in the app!"
        notification.fireDate = date
        notification.repeatInterval = NSCalendarUnit.Day
        
        if notificationsActivated == true {
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
        } else {
            UIApplication.sharedApplication().cancelAllLocalNotifications()
        }
        
    }
    
    
    @IBAction func resetPressed(sender: AnyObject) {
        
        Alert.WarningWithCompletion(self, title: "Warning", message: "Are you sure you wish to delete your saved data? This action can't be undone.") { 
            
            context.deleteObject(user)
            
            do {
                try context.save()
            } catch let error as NSError {
                print("Error deleting user: \(error)")
            }
            
        }
        
    }
    
}
