import Foundation

public struct CoreDataDefaults {
}

public extension CoreDataDefaults {
    
    static func string(forKey key: String) throws -> String? {
        do {
            let data = try CoreDataDefaults.data(forKey: key)
            return String(data: data!, encoding: .utf8)
            
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
    static func set(value: String, forKey key: String) throws {
        do {
            let data = value.data(using: .utf8)
            try CoreDataDefaults.set(value: data, forKey: key)
        } catch let error {
            print(error)
        }
    }
    
    static func integer(forKey key: String) throws -> Int? {
        do {
            let data = try CoreDataDefaults.data(forKey: key)
            let intValue: Int = data!.withUnsafeBytes { (pointer: UnsafePointer<Int>) -> Int? in
                    if MemoryLayout<Int>.size != data!.count { return nil }
                    return pointer.pointee
                } ?? 0
            
            return intValue
            
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
    static func set(value: Int, forKey key: String) throws {
        do {
            
            let data = withUnsafeBytes(of: value) { Data($0) }
            try CoreDataDefaults.set(value: data, forKey: key)
        } catch let error {
            print(error)
        }
    }
    
    static func float(forKey key: String) throws -> Float? {
        do {
            let data = try CoreDataDefaults.data(forKey: key)
            let floatValue: Float = data!.withUnsafeBytes { (pointer: UnsafePointer<Float>) -> Float? in
                    if MemoryLayout<Float>.size != data!.count { return nil }
                    return pointer.pointee
                } ?? 0
            
            return floatValue
            
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
    static func set(value: Float, forKey key: String) throws {
        do {
            let data = withUnsafeBytes(of: value) { Data($0) }
            try CoreDataDefaults.set(value: data, forKey: key)
        } catch let error {
            print(error)
        }
    }
    
    static func double(forKey key: String) throws -> Double? {
        do {
            let data = try CoreDataDefaults.data(forKey: key)
            let doubleValue: Double = data!.withUnsafeBytes { (pointer: UnsafePointer<Double>) -> Double? in
                    if MemoryLayout<Double>.size != data!.count { return nil }
                    return pointer.pointee
                } ?? 0
            
            return doubleValue
            
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
    static func set(value: Double, forKey key: String) throws {
        do {
            
            let data = withUnsafeBytes(of: value) { Data($0) }
            try CoreDataDefaults.set(value: data, forKey: key)
        } catch let error {
            print(error)
        }
    }
    
    static func boolean(forKey key: String) throws -> Bool? {
        do {
            let data = try CoreDataDefaults.data(forKey: key)
            let booleanValue: Int = data!.withUnsafeBytes { (pointer: UnsafePointer<Int>) -> Int? in
                    if MemoryLayout<Bool>.size != data!.count { return nil }
                    return pointer.pointee
                } ?? 0
            
            return booleanValue != 0
            
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
    static func set(value: Bool, forKey key: String) throws {
        do {
            
            let intValue = value ? 1 : 0
            try CoreDataDefaults.set(value: intValue, forKey: key)
        } catch let error {
            print(error)
            throw error
        }
    }
}
