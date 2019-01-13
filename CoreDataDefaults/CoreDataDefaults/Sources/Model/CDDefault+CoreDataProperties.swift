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

    @NSManaged public var key: String
    @NSManaged public var value: NSData?
}
