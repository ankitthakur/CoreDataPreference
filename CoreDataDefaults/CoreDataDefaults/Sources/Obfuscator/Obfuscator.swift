//
//  Obfuscator.swift
//  CoreDataDefaults
//
//  Created by Ankit Thakur on 1/12/19.
//

import Foundation
struct Obfuscator {
    
    // MARK: - Variables
    
    /// The salt used to obfuscate and reveal the string.
    private var salt: String    
    
    // MARK: - Initialization
    
    private init() {salt = "\(String(describing: Obfuscator.self))"}
    
    init(with salt: String) {
        self.salt = salt
    }
    
    // MARK: - Instance Methods
    
    /**
     This method obfuscates the string passed in using the salt
     that was used when the Obfuscator was initialized.
     
     - parameter string: the string to obfuscate
     
     - returns: the obfuscated string in a byte array
     */
    func bytesByObfuscatingString(string: String) -> [UInt8] {
        let textBytes = [UInt8](string.utf8)
        let cipher = [UInt8](self.salt.utf8)
        let length = cipher.count
        
        var encrypted = [UInt8]()
        
        for text in textBytes.enumerated() {
            encrypted.append(text.element ^ cipher[text.offset % length])
        }
        
        #if DEVELOPMENT
        print("Salt used: \(self.salt)\n")
        print("Swift Code:\n************")
        print("// Original \"\(string)\"")
        print("let key: [UInt8] = \(encrypted)\n")
        #endif
        
        return encrypted
    }
    
    /**
     This method reveals the original string from the obfuscated
     byte array passed in. The salt must be the same as the one
     used to encrypt it in the first place.
     
     - parameter key: the byte array to reveal
     
     - returns: the original string
     */
    func reveal(key: [UInt8]) -> String {
        let cipher = [UInt8](self.salt.utf8)
        let length = cipher.count
        
        var decrypted = [UInt8]()
        
        for keyelement in key.enumerated() {
            decrypted.append(keyelement.element ^ cipher[keyelement.offset % length])
        }
        
        return String(bytes: decrypted, encoding: .utf8)!
    }
}
