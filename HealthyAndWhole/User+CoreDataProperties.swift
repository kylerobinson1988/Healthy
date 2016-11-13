//
//  User+CoreDataProperties.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 9/9/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var name: String?
    @NSManaged var complete: NSNumber?
    @NSManaged var currentDay: NSNumber?
    @NSManaged var currentWeek: NSNumber?
    @NSManaged var startDate: String?
    @NSManaged var weeksCompleted: NSNumber?
    @NSManaged var user: NSSet?
    @NSManaged var measurements: NSOrderedSet?
    @NSManaged var log: NSOrderedSet?
    @NSManaged var timerOn: NSNumber?
    @NSManaged var timerHour: NSNumber?
    @NSManaged var timerMinute: NSNumber?
    
}
