//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Nabendu Biswas on 23/10/16.
//  Copyright © 2016 Nabendu Biswas. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }

}
