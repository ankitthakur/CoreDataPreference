//
//  ViewController.swift
//  CoreDataPrefSample
//
//  Created by Ankit Thakur on 1/11/19.
//  Copyright © 2019 Ankit Thakur. All rights reserved.
//

import UIKit
import CoreDataPref

class ViewController: UIViewController {

    struct Struct1: Codable {
        let value1 = "value1"
        let value2 = "value2"
        let value3 = "value3"
    }
    struct Struct1: Codable {
        let value1 = "value1"
        let value2 = "value2"
        let struct1Val = Struct1()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            try CoreDataPref.set(value: Float(2.0), forKey: "floatValue")
            try CoreDataPref.set(value: 2, forKey: "IntValue")
            try CoreDataPref.set(value: ["key1": "value1", "key2": "value2"], forKey: "dictionary")
            try CoreDataPref.set(value: ["value1", "value2"], forKey: "array")
            try CoreDataPref.set(value: URL(fileURLWithPath: Bundle.main.bundlePath), forKey: "url")
            try CoreDataPref.set(value: struct2(), forKey: "struct")
            try CoreDataPref.set(value: true, forKey: "bool")

            let floatValue = try CoreDataPref.float(forKey: "floatValue")
            let intValue = try CoreDataPref.integer(forKey: "IntValue")
            let dictionary = try CoreDataPref.dictionary(forKey: "dictionary")
            let array = try CoreDataPref.array(forKey: "array")
            let url = try CoreDataPref.codable(objectType: Struct2.self, forKey: "struct")
            let boolValue = try CoreDataPref.boolean(forKey: "bool")

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
