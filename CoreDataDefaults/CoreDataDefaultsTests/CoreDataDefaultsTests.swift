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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        CoreDataManager.shared.isStoreTypeInStore = true
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        CoreDataManager.shared.isStoreTypeInStore = true
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

}
