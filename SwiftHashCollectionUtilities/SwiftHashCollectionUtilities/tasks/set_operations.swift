//
//  set_operations.swift
//  SwiftHashCollectionUtilities
//
//  Created by Clark Adams on 7/23/24.
//

import Foundation

// Function to perform various set operations
public func performSetOperations() {
    // Create a set of integers
    var numbers: Set<Int> = [1, 2, 3, 4, 5]
    print("Initial set: \(numbers)")

    // Add several elements to the set
    numbers.insert(6)
    numbers.insert(7)
    print("After adding elements: \(numbers)")

    // Remove one element from the set
    numbers.remove(3)
    print("After removing element 3: \(numbers)")

    // Check if a specific element exists in the set
    let containsFour = numbers.contains(4)
    print("Set contains 4: \(containsFour)")

    // Perform union, intersection, and difference operations with another set
    let anotherSet: Set<Int> = [5, 6, 7, 8, 9]

    let unionSet = numbers.union(anotherSet)
    print("Union of sets: \(unionSet)")

    let intersectionSet = numbers.intersection(anotherSet)
    print("Intersection of sets: \(intersectionSet)")

    let differenceSet = numbers.subtracting(anotherSet)
    print("Difference of sets: \(differenceSet)")
}
