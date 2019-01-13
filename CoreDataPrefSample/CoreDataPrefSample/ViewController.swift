//
//  ViewController.swift
//  CoreDataPrefSample
//
//  Created by Ankit Thakur on 1/11/19.
//  Copyright © 2019 Ankit Thakur. All rights reserved.
//

import UIKit
import CoreDataDefaults

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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            try CoreDataDefaults.set(value: Float(2.0), forKey: "floatValue")
            try CoreDataDefaults.set(value: 2, forKey: "IntValue")
            try CoreDataDefaults.set(value: ["key1": "value1", "key2": "value2"], forKey: "dictionary")
            try CoreDataDefaults.set(value: ["value1", "value2"], forKey: "array")
            try CoreDataDefaults.set(value: URL(fileURLWithPath: Bundle.main.bundlePath), forKey: "url")
            try CoreDataDefaults.set(value: Struct2(), forKey: "struct")
            try CoreDataDefaults.set(value: true, forKey: "bool")

            let floatValue = try CoreDataDefaults.float(forKey: "floatValue")
            let intValue = try CoreDataDefaults.integer(forKey: "IntValue")
            let dictionary = try CoreDataDefaults.dictionary(forKey: "dictionary")
            let array = try CoreDataDefaults.array(forKey: "array")
            let url = try CoreDataDefaults.codable(objectType: Struct2.self, forKey: "struct")
            let boolValue = try CoreDataDefaults.boolean(forKey: "bool")

            print(floatValue! as Any)
            print(intValue! as Any)
            print(dictionary! as Any)
            print(array! as Any)
            print(url! as Any)
            print(boolValue! as Any)

        } catch let error {
            print(error)
        }
    }
}
