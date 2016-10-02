//
//  Measurements+CoreDataProperties.swift
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

extension Measurements {

    @NSManaged var height: String?
    @NSManaged var weight: String?
    @NSManaged var hip: String?
    @NSManaged var waist: String?
    @NSManaged var bust: String?
    @NSManaged var thigh: String?
    @NSManaged var upperArm: String?
    @NSManaged var healthProblems: String?
    @NSManaged var mood: NSNumber?
    @NSManaged var closeness: NSNumber?
    @NSManaged var isComplete: NSNumber?
    @NSManaged var user: User?

}
