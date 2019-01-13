# CoreDataPreference
Using core data as UserDefault settings with encryption (EncryptedCoreData)

[![Build Status](https://travis-ci.org/ankitthakur/CoreDataPreference.svg?branch=master)](https://travis-ci.org/ankitthakur/CoreDataPreference)



**Dependencies:**
'EncryptedCoreData' for securing db.
'SwiftyBeaver' for logging purpose

**Installation**

In Project pod file, add above 2 dependencies:

```

  # Pods for CoreDataDefaults
  pod 'EncryptedCoreData', :git => 'https://github.com/project-imas/encrypted-core-data', :commit => 'b97ffaf2f19dad4d1558bc9b0668cc2e09d17347'
  pod 'SwiftyBeaver'
  
```

Then add CoreDataDefaults.framework as `Embedded framework` in Main project
[![Embedded framework](https://github.com/ankitthakur/CoreDataPreference/blob/master/embedded_binary.png)]

**Code Coverage**

[![Code Coverage](https://github.com/ankitthakur/CoreDataPreference/blob/master/code_coverage_report.png)]

**Test Report**

[![Code Coverage](https://github.com/ankitthakur/CoreDataPreference/blob/master/test_report.png)]

Code Sample

    do {
        try CoreDataPref.set(value: Float(2.0), forKey: "floatValue")
        try CoreDataPref.set(value: 2, forKey: "IntValue")
        try CoreDataPref.set(value: ["key1": "value1", "key2": "value2"], forKey: "dictionary")
        try CoreDataPref.set(value: ["value1", "value2"], forKey: "array")
        try CoreDataPref.set(value: true, forKey: "bool")
            
        let floatValue = try CoreDataPref.float(forKey: "floatValue")
        let intValue = try CoreDataPref.integer(forKey: "IntValue")
        let dictionary = try CoreDataPref.dictionary(forKey: "dictionary")
        let array = try CoreDataPref.array(forKey: "array")
        let boolValue = try CoreDataPref.boolean(forKey: "bool")

    } catch let error {
        print(error)
    }
    
If we want to save any class or struct, just make them Codable, and store it like below
    
    struct Struct1: Codable {
        let value1 = "value1"
        let value2 = "value2"
        let value3 = "value3"
    }
    struct Struct2: Codable {
        let value1 = "value1"
        let value2 = "value2"
        let struct1Val = Struct1()
    }

        do {
            // save struct in preferences
            try CoreDataPref.set(value: Struct2(), forKey: "struct")
            
            // fetch struct from preferences
            let struct = try CoreDataPref.codable(objectType: Struct2.self, forKey: "struct")
            
        } catch let error {
            print(error)
        }


Here is the Swift Lint Report:

    $ swiftlint
    Loading configuration from '.swiftlint.yml'
    Linting Swift files at paths
    Linting 'ManagedObectExtension.swift' (1/9)
    Linting 'Logger.swift' (2/9)
    Linting 'Obfuscator.swift' (3/9)
    Linting 'CoreDataManager.swift' (4/9)
    Linting 'CoreDataPrefCollection.swift' (5/9)
    Linting 'CDDefault+CoreDataClass.swift' (6/9)
    Linting 'CDDefault+CoreDataProperties.swift' (7/9)
    Linting 'CoreDataDefaults.swift' (8/9)
    Linting 'CoreDataDefaultsTests.swift' (9/9)

