# CoreDataPreference
Using core data as UserDefault settings with encryption (EncryptedCoreData)


Code Sample

    do {
        try CoreDataPref.set(value: Float(2.0), forKey: "floatValue")
        try CoreDataPref.set(value: 2, forKey: "IntValue")
        try CoreDataPref.set(value: ["key1": "value1", "key2": "value2"], forKey: "dictionary")
        try CoreDataPref.set(value: ["value1", "value2"], forKey: "array")
        try CoreDataPref.set(value: struct2(), forKey: "struct")
        try CoreDataPref.set(value: true, forKey: "bool")
            
        let floatValue = try CoreDataPref.float(forKey: "floatValue")
        let intValue = try CoreDataPref.integer(forKey: "IntValue")
        let dictionary = try CoreDataPref.dictionary(forKey: "dictionary")
        let array = try CoreDataPref.array(forKey: "array")
        let url = try CoreDataPref.codable(objectType: Struct2.self, forKey: "struct")
        let boolValue = try CoreDataPref.boolean(forKey: "bool")

    } catch let error {
        print(error)
    }
    

Here is the Swift Lint Report:

    $ swiftlint
    Loading configuration from '.swiftlint.yml'
    Linting Swift files at paths
    Linting 'AppDelegate.swift' (1/14)
    Linting 'CoreDataPrefSampleTests.swift' (2/14)
    Linting 'CoreDataPrefTests.swift' (3/14)
    Linting 'ViewController.swift' (4/14)
    Linting 'XCTestManifests.swift' (5/14)
    Linting 'Package.swift' (6/14)
    Linting 'LinuxMain.swift' (7/14)
    Linting 'ManagedObectExtension.swift' (8/14)
    Linting 'Logger.swift' (9/14)
    Linting 'CoreDataManager.swift' (10/14)
    Linting 'CoreDataPrefCollection.swift' (11/14)
    Linting 'CoreDataPref.swift' (12/14)
    Linting 'CDDefault+CoreDataClass.swift' (13/14)
    Linting 'CDDefault+CoreDataProperties.swift' (14/14)
    Done linting! Found 0 violations, 0 serious in 14 files.
