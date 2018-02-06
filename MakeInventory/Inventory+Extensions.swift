//
//  Inventory+Extensions.swift
//  MakeInventory
//
//  Created by Eliel A. Gordon on 11/12/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import Foundation
import CoreData

extension Inventory {
    
    @discardableResult
    convenience init(title: String, count: Int64, dateCreated: Date = Date(), in context: NSManagedObjectContext) {
        self.init(context: context)
        
        self.title = title
        self.quantity = count
        self.dateCreated = dateCreated
    }
}
