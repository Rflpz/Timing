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

    @NSManaged var name: String
    @NSManaged var desc: String
    @NSManaged var category: String

}
