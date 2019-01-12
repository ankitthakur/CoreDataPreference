import XCTest
@testable import CoreDataPref

final class CoreDataPrefTests: XCTestCase {

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
            try CoreDataPref.set(value: value, forKey: "floatvalue")

            let floatValue = try CoreDataPref.float(forKey: "floatvalue")

            XCTAssert(value == floatValue!, "float values are incorrect")

        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }

    func testDouble() {
        do {
            let value = Double(45.0)
            try CoreDataPref.set(value: value, forKey: "doublevalue")
            let doublevalue = try CoreDataPref.double(forKey: "doublevalue")

            XCTAssert(value == doublevalue!, "float values are incorrect")

        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }

    func testInt() {
        do {
            let value = Int(46)
            try CoreDataPref.set(value: value, forKey: "intvalue")
            let intvalue = try CoreDataPref.integer(forKey: "intvalue")

            XCTAssert(value == Int(intvalue!), "int values are incorrect")

        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }

    func testDictionary() {
        do {
            let value: [String: String] = ["key1": "value1", "key2": "value2"]
            try CoreDataPref.set(value: value, forKey: "dictValue")
            let dictValue: [String: String]? = try CoreDataPref.dictionary(forKey: "dictValue") as? [String: String]

            XCTAssert(value == dictValue!, "dictionary values are incorrect")

        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
}
