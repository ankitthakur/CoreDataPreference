//
//  CoreDataDefaultsCollection.swift
//  CoreDataDefaults
//
//  Created by Ankit Thakur on 1/11/19.
//

import Foundation

public extension CoreDataDefaults {

    static func array(forKey key: String) throws -> [Any]? {
        let data = try CoreDataDefaults.data(forKey: key)
        return try JSONSerialization.jsonObject(with: data!, options: []) as? [Any]

    }

    static func dictionary(forKey key: String) throws -> [String: Any]? {
        let data = try CoreDataDefaults.data(forKey: key)
        return try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]

    }

    static func data(forKey key: String) throws  -> Data? {

        if let object: CDDefault = try CDDefault.fetch(CDDefault.self, forKey: key) {
            return object.value as Data?
        }
        return nil

    }

    static func codable<T: Codable>(objectType: T.Type, forKey key: String) throws -> T? {

        guard let result = try data(forKey: key) else {
            return nil
        }

        return try JSONDecoder().decode(objectType, from: result)
    }

    static func set(value: [Any], forKey key: String) throws {
        let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
        try CoreDataDefaults.set(value: data, forKey: key)

    }

    static func set(value: [String: Any], forKey key: String) throws {
        let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
        try CoreDataDefaults.set(value: data, forKey: key)

    }

    static func set(value: Data, forKey key: String) throws {
        try CDDefault.save(key: key, jsonData: value, entity: CDDefault.self)
    }

    static func set<T: Codable>(value: T, forKey key: String) throws {

        let jsonData = try JSONEncoder().encode(value)
        try CoreDataDefaults.set(value: jsonData, forKey: key)
    }

}
