//
//  ManagedObectExtension.swift
//  CoreDataPref
//
//  Created by Ankit Thakur on 1/11/19.
//

import Foundation
import CoreData

@objc
internal protocol ManagedObjectProtocol {
    var value: NSData? {get set}
    var key: String {get set}
}

internal extension NSManagedObject {

    @nonobjc internal class func fetchrequest<T: NSManagedObject>(entityClass: T.Type) ->
        NSFetchRequest<NSFetchRequestResult> {

            let entityName = NSStringFromClass(entityClass)
            return NSFetchRequest(entityName: entityName)
    }

    class func save<T: NSManagedObject>(key: String, jsonData: Data, entity: T.Type) throws
        where T: ManagedObjectProtocol {
        // store the values in core data
        let managedObjectContext = CoreDataManager.shared.backgroundManagedObjectContext()
        managedObjectContext.name = "Context save - \(NSStringFromClass(T.self))"
        var dbModel: T?
        do {
            let fetchRequest: NSFetchRequest = T.fetchrequest(entityClass: T.self)
            fetchRequest.predicate = NSPredicate(format: "key matches %@", key)
            let fetchResults = try managedObjectContext.fetch(fetchRequest)

            if !fetchResults.isEmpty {
                dbModel = fetchResults.first as? T
            } else {
                let entityName = NSStringFromClass(T.self)
                guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: managedObjectContext) else {
                    fatalError("Failed to decode User")
                }
                dbModel = T(entity: entity, insertInto: managedObjectContext)
            }

            dbModel?.key = key
            dbModel?.value = jsonData as NSData
            try managedObjectContext.save()
            // since the data is stored, so reset and clear the context.
            managedObjectContext.reset()

            CDLogger.info(apiName: "DB Save value for key", object: "\(key)" as AnyObject)

        } catch let error {
            print(error)
            throw DBModelError.jsonParseError("failed to save \(key) in db")
        }
    }

    class func fetch<T: NSManagedObject>(_ tableName: T.Type, forKey key: String) throws -> T? where T: ManagedObjectProtocol {
        // store the values in core data
        let managedObjectContext = CoreDataManager.shared.backgroundManagedObjectContext()
        managedObjectContext.name = "Context fetch - \(NSStringFromClass(T.self))"
        var dbModel: T?
        do {
            let fetchRequest: NSFetchRequest = T.fetchrequest(entityClass: tableName)
            fetchRequest.predicate = NSPredicate(format: "key matches %@", key)
            fetchRequest.returnsObjectsAsFaults = false
            let fetchResults = try managedObjectContext.fetch(fetchRequest)
            if fetchResults.count == 1 {
                dbModel = fetchResults.first as? T
                if dbModel?.key != nil && dbModel?.value != nil {
                    return dbModel
                }
            } else if fetchResults.isEmpty {
                throw DBModelError.jsonParseError("no value for \(key) is found in db")
            } else if !fetchResults.isEmpty {
                throw DBModelError.jsonParseError("more than 1 \(key) value in db")
            }
            return dbModel

        } catch let error {
            throw DBModelError.jsonParseError("failed to save \(key) in db - \(error.localizedDescription)")
        }
    }
}
