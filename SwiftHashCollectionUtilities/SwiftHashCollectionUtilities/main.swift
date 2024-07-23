//
//  main.swift
//  SwiftHashCollectionUtilities
//
//  Created by Clark Adams on 7/23/24.
//

import Foundation

// MARK: - Task 1: Hash using built-in function
let testString = "Hello, Swift!"
let builtinHash = hashUsingBuiltinFunction(input: testString)
print("Built-in hash for '\(testString)': \(builtinHash)")

// MARK: - Task 2: Custom hash function
let customHash = customHashFunction(input: testString, salt: "Some salt")
print("Custom hash for '\(testString)': \(customHash)")

// MARK: - Task 3: Set operations
performSetOperations()

// MARK: - Task 4: Dictionary operations
performDictionaryOperations()
