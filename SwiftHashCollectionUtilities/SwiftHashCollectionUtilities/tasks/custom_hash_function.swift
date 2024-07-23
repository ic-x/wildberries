//
//  custom_hash_function.swift
//  SwiftHashCollectionUtilities
//
//  Created by Clark Adams on 7/23/24.
//

import Foundation
import CryptoKit

// Function to hash a string using a custom hash algorithm
func customHashFunction(input: String, salt: String) -> String {
    // Convert the input string and salt to Data
    let inputData = Data(input.utf8)
    let saltData = Data(salt.utf8)
    
    // Compute the SHA-256 hash of the input string
    let inputHash = SHA256.hash(data: inputData)
    
    // Compute the SHA-256 hash of the salt
    let saltHash = SHA256.hash(data: saltData)
    
    // Concatenate the hashes
    var combinedData = Data(inputHash) + Data(saltHash)
    
    // Apply additional hashing to the result
    for _ in 0..<1000 {
        combinedData = Data(SHA256.hash(data: combinedData))
    }
    
    // Convert the final hash to a string and return it
    return combinedData.compactMap { String(format: "%02x", $0) }.joined()
}
