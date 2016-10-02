//
//  Log+CoreDataProperties.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 9/14/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Log {

    @NSManaged var breakfast: String?
    @NSManaged var closeness: NSNumber?
    @NSManaged var dinner: String?
    @NSManaged var lunch: String?
    @NSManaged var mood: NSNumber?
    @NSManaged var prayerTime: NSNumber?
    @NSManaged var sleepInfo: String?
    @NSManaged var snacks: String?
    @NSManaged var stepCount: NSNumber?
    @NSManaged var water: NSNumber?
    @NSManaged var sleepTime: NSNumber?
    @NSManaged var activeMinutes: NSNumber?
    @NSManaged var breakfastCalories: NSNumber?
    @NSManaged var lunchCalories: NSNumber?
    @NSManaged var dinnerCalories: NSNumber?
    @NSManaged var snackCalories: NSNumber?
    @NSManaged var user: User?
    @NSManaged var isComplete: NSNumber?
    
    @NSManaged var week: NSNumber?
    @NSManaged var day: NSNumber?
    
}
