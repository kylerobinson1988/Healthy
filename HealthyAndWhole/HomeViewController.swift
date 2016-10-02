//
//  HomeViewController.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 9/5/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit
import CoreData

var user: User!

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchFromCoreData()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = true
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBarHidden = false
        
    }
    
    // MARK: - CoreData
    
    func fetchFromCoreData() {
        
        let request = NSFetchRequest(entityName: "User")
        
        do {
            
            let users = try context.executeFetchRequest(request) as! [User]
            
            if users.count != 0 {
                user = users.first
            } else {
                
                let entity = NSEntityDescription.entityForName("User", inManagedObjectContext: context)
                let newUser = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context) as! User
                
                newUser.name = ""
                newUser.complete = false
                newUser.weeksCompleted = 0
                
                let measurementEntity = NSEntityDescription.entityForName("Measurements", inManagedObjectContext: context)
                let measurements = NSManagedObject(entity: measurementEntity!, insertIntoManagedObjectContext: context)
                
                newUser.measurements = NSSet(array: [measurements])
                
                let formatter = NSDateFormatter()
                formatter.dateFormat = "MM/dd/yyyy"
                
                newUser.startDate = formatter.stringFromDate(NSDate())
                
                var logs: [Log] = []
                
                for week in 1..<9 {
                    
                    for day in 1..<8 {
                        
                        let newLog = Log(entity: NSEntityDescription.entityForName("Log", inManagedObjectContext: context)!, insertIntoManagedObjectContext: context)
                        newLog.user = newUser
                        newLog.week = week
                        newLog.day = day
                        logs.append(newLog)
                        
                    }
                    
                }
                
                let orderedSet = NSOrderedSet(array: logs)
                newUser.log = orderedSet
                
                user = newUser
                
                do {
                    try context.save()
                } catch let error as NSError {
                    print("Error saving new user: \(error)")
                }
                
                
            }
            
        } catch let error as NSError {
            print("Error loading user: \(error)")
        }
        
    }

}

