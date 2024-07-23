//
//  hash_builtin.swift
//  SwiftHashCollectionUtilities
//
//  Created by Clark Adams on 7/23/24.
//

import Foundation

// Function to hash a string using built-in hash function
func hashUsingBuiltinFunction(input: String) -> Int {
    return input.hashValue
}
