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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        notificationSwitch.on = false //user.timerOn == true ? true : false
        
        notificationPicker.selectRow(Int(user.timerHour ?? 0), inComponent: 0, animated: false)
        notificationPicker.selectRow(Int(user.timerMinute ?? 0), inComponent: 1, animated: false)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Error saving: \(error)")
        }
        
    }
    
    // MARK: - Picker methods
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 2
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
            
        case 0: //Hours
            return 24
            
        default: //Minutes
            
            return 60
            
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch component {
            
        case 0: //Hours
            
            if row == 0 {
                return "12"
            } else {
                return "\(row)"
            }
            
        default: //Minutes
            
            switch row {
                
            case 0...9:
                
                return "0\(row)"
                
            default:
                
                return "\(row)"
                
            }
            
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
            
        case 0:
            
            user.timerHour = Int(row)
            
        default:
            
            user.timerMinute = Int(row)
            
        }
        
        setTime()
        
    }
    
    func setTime() {
        
        if user.timerOn == false {
            UIApplication.sharedApplication().cancelAllLocalNotifications()
            return
        }
        
        print("Hour: \(user.timerHour), Minute: \(user.timerMinute)")
        
        //Remove any old notifications first.
        UIApplication.sharedApplication().cancelAllLocalNotifications()
        
        let today = NSDate()
        let calendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let components = calendar.components(NSCalendarUnit.Year, fromDate: today)
        
        components.timeZone = NSTimeZone.systemTimeZone()
        print("Time Zone: \(components.timeZone)")
        
        components.hour = Int(user.timerHour ?? 5) - 5
        components.minute = Int(user.timerMinute ?? 0)
        
        let date: NSDate = calendar.dateFromComponents(components)!
        
        print("Date for Notifications: \(date)")
        
        var nextFireTime = calendar.dateFromComponents(components)
        if nextFireTime?.timeIntervalSinceNow < 0 {
            nextFireTime = nextFireTime?.dateByAddingTimeInterval(60*60*24)
        }
        
        let notification: UILocalNotification = UILocalNotification()
        notification.category = "Healthy & Whole"
        notification.alertBody = "Remember to log your day in the app!"
        notification.fireDate = nextFireTime
        notification.repeatInterval = NSCalendarUnit.Day
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    
    }

    //MARK: - Actions
    
    @IBAction func switchFlipped(sender: AnyObject) {
    
        Alert.Warning(self, title: "Coming Soon", message: "Daily notifications will appear in a future release.")
        
        notificationSwitch.on = false
        
        return
        
        /*
        user.timerOn = sender.on == true ? true : false
    
        setTime()
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Error with switch flip: \(error)")
        }
         */
        
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
