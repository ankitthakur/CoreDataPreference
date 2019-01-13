//
//  CDDefault+CoreDataProperties.swift
//  
//
//  Created by Ankit Thakur on 1/10/19.
//
//

import Foundation
import CoreData

extension CDDefault: ManagedObjectProtocol {

    @nonobjc internal class func fetchRequest() -> NSFetchRequest<CDDefault> {
        return NSFetchRequest<CDDefault>(entityName: "CDDefault")
    }

    @NSManaged public var key: String
    @NSManaged public var value: NSData?
}
