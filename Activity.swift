//
//  Activity.swift
//  Timing
//
//  Created by Rflpz on 21/10/14.
//  Copyright (c) 2014 Rflpz. All rights reserved.
//

import Foundation
import CoreData
@objc(Activity)
class Activity: NSManagedObject {

    @NSManaged var category: String
    @NSManaged var desc: String
    @NSManaged var name: String
    @NSManaged var lastUpdate: String
    @NSManaged var time: String
    @NSManaged var dateCreated: String

}
