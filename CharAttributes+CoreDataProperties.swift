//
//  CharAttributes+CoreDataProperties.swift
//  tabletopHelper
//
//  Created by Bruce Randall on 12/3/15.
//  Copyright © 2015 Bruce Randall. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension CharAttributes {

    @NSManaged var charName: String?
    @NSManaged var charClass: String?
    @NSManaged var charLevel: String?
    @NSManaged var charEXP: String?

}
