//
//  CoreDataDefaultsTests.swift
//  CoreDataDefaultsTests
//
//  Created by Ankit Thakur on 1/13/19.
//  Copyright © 2019 Ankit Thakur. All rights reserved.
//

import XCTest
@testable import CoreDataDefaults

class CoreDataDefaultsTests: XCTestCase {

    struct Struct1: Codable, Equatable {
        let value1 = "value1"
        let value2 = "value2"
        let value3 = "value3"
        
        static func == (lhs: Struct1, rhs: Struct1) -> Bool {
            return (lhs.value1 == rhs.value1 &&
                lhs.value2 == rhs.value2 &&
                lhs.value3 == rhs.value3)
        }
        
    }
    
    struct Struct2: Codable, Equatable {
        let value1 = "value1"
        let value2 = "value2"
        let struct1Val = Struct1()
        
        static func == (lhs: Struct2, rhs: Struct2) -> Bool {
            return (lhs.value1 == rhs.value1 &&
                lhs.value2 == rhs.value2 &&
                lhs.struct1Val == rhs.struct1Val)
        }
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        CoreDataManager.shared.isStoreTypeInStore = true
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        CoreDataManager.shared.isStoreTypeInStore = false
    }
    
    func testString() {
        do {
            let value = "hello friends"
            try CoreDataDefaults.set(value: value, forKey: "stringvalue")
            
            let stringValue = try CoreDataDefaults.string(forKey: "stringvalue")
            
            XCTAssert(value == stringValue!, "string values are incorrect")
            
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testFloat() {
        do {
            let value = Float(44.0)
            try CoreDataDefaults.set(value: value, forKey: "floatvalue")
            
            let floatValue = try CoreDataDefaults.float(forKey: "floatvalue")
            
            XCTAssert(value == floatValue!, "float values are incorrect")
            
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDouble() {
        do {
            let value = Double(45.0)
            try CoreDataDefaults.set(value: value, forKey: "doublevalue")
            let doublevalue = try CoreDataDefaults.double(forKey: "doublevalue")
            
            XCTAssert(value == doublevalue!, "float values are incorrect")
            
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testInt() {
        do {
            let value = Int(46)
            try CoreDataDefaults.set(value: value, forKey: "intvalue")
            let intvalue = try CoreDataDefaults.integer(forKey: "intvalue")
            
            XCTAssert(value == Int(intvalue!), "int values are incorrect")
            
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testBool() {
        do {
            let value = true
            
            try CoreDataDefaults.set(value: value, forKey: "boolValue")
            
            let boolvalue = try CoreDataDefaults.boolean(forKey: "boolValue")
            
            XCTAssert(value == boolvalue, "bool values are incorrect")
            
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testArray() {
        do {
            let value: [String] = ["key1", "key2"]
            try CoreDataDefaults.set(value: value, forKey: "arrayValue")
            let arrayValue = try CoreDataDefaults.array(forKey: "arrayValue") as? [String]
            
            XCTAssert(value == arrayValue!, "array values are incorrect")
            
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDictionary() {
        do {
            let value: [String: String] = ["key1": "value1", "key2": "value2"]
            try CoreDataDefaults.set(value: value, forKey: "dictValue")
            let dictValue: [String: String]? = try CoreDataDefaults.dictionary(forKey: "dictValue") as? [String: String]
            
            XCTAssert(value == dictValue!, "dictionary values are incorrect")
            
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testStruct() {
        
        do {
            let structValue = Struct2()
            try CoreDataDefaults.set(value: structValue, forKey: "struct")
            let value = try CoreDataDefaults.codable(objectType: Struct2.self, forKey: "struct")
            
            XCTAssert(value! == structValue, "struct values are incorrect")
            
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }

}
