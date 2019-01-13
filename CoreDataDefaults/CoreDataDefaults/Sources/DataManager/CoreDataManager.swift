//
//  CoreDataManager.swift
//  CoreDataDefaults
//
//  Created by Ankit Thakur on 1/10/19.
//  Copyright © 2019 Ankit Thakur. All rights reserved.
//

import Foundation
import EncryptedCoreData

internal extension CodingUserInfoKey {
    static let mainManagedObjectContext = CodingUserInfoKey(rawValue: "mainManagedObjectContext")
    static let backgrounManagedObjectContext = CodingUserInfoKey(rawValue: "backgrounManagedObjectContext")
}

internal enum DBModelError: Error {
    case jsonParseError(String)
}

internal final class CoreDataManager {

    static let shared = CoreDataManager()

    fileprivate let modelName = "CDPref"

    // make it property so that test server can mark it true
    var isStoreTypeInStore = false
    // make it property so that test server can change it's value
    var databaseName = "CoreDataDefaults"

    //Initializer access level change now
    fileprivate init() {}

    // MARK: - Core Data Stack
    func backgroundManagedObjectContext() -> NSManagedObjectContext {
        let backgroundmanagedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)

        backgroundmanagedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator

        return backgroundmanagedObjectContext
    }

    // If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
    private(set) lazy var managedObjectContext: NSManagedObjectContext = {

        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator

        return managedObjectContext

    }()

    private lazy var managedObjectModel: NSManagedObjectModel = {
        let bundle = Bundle(for: type(of: self))
        let val = bundle.url(forResource: self.modelName, withExtension: "momd")
        guard let modelURL = Bundle(for: type(of: self)).url(forResource: self.modelName, withExtension: "momd") else {
            fatalError("Unable to Find Data Model")
        }

        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unable to Load Data Model")
        }

        return managedObjectModel
    }()

    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        var coordinator: NSPersistentStoreCoordinator?

        let fileManager = FileManager.default
        let storeName = "\(self.databaseName).sqlite"
        let documentsDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let persistentStoreURL = documentsDirectoryURL.appendingPathComponent(storeName)
        let description = persistentStoreURL.description
        
//        let obfuscator = Obfuscator(with: "\(String(describing: CoreDataDefaults.self))\(String(describing: String.self))\(String(describing: NSObject.self))")
//        let password = obfuscator.bytesByObfuscatingString(string: "random_password")
//        print(password)
//        
//        let val = obfuscator.reveal(key: password)
//        print(val)

        coordinator = EncryptedStore.make(options: [EncryptedStorePassphraseKey: "SOME_PASSWORD",
                                                    EncryptedStoreDatabaseLocation: description],
                                          managedObjectModel: managedObjectModel)

        return coordinator!
    }()

}
