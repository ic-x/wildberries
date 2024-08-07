//
//  dictionary_operations.swift
//  SwiftHashCollectionUtilities
//
//  Created by Clark Adams on 7/23/24.
//

import Foundation

// Function to perform various dictionary operations
public func performDictionaryOperations() {
    // Create a dictionary with city names as keys and populations as values
    var cityPopulation: [String: Int] = [
        "New York": 8419000,
        "Los Angeles": 3980000,
        "Chicago": 2716000
    ]
    print("Initial dictionary: \(cityPopulation)")

    // Add several key-value pairs to the dictionary
    cityPopulation["Houston"] = 2328000
    cityPopulation["Phoenix"] = 1690000
    print("After adding elements: \(cityPopulation)")

    // Remove one key-value pair from the dictionary
    cityPopulation.removeValue(forKey: "Chicago")
    print("After removing Chicago: \(cityPopulation)")

    // Update the value for one of the keys
    cityPopulation["New York"] = 8500000
    print("After updating New York population: \(cityPopulation)")

    // Retrieve the value for one of the keys
    if let population = cityPopulation["Los Angeles"] {
        print("Population of Los Angeles: \(population)")
    } else {
        print("Los Angeles not found in the dictionary")
    }
}
