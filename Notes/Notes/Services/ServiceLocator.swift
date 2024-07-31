//
//  ServiceLocator.swift
//  Example
//
//  Created by Louise Hogan on 7/31/24.
//

import Foundation

// MARK: Service Locator Pattern (Singleton)
final class ServiceLocator {
    private init() {} // Private initializer ensures Singleton
    static let shared = ServiceLocator() // Singleton instance
    
    private var services: [String: AnyObject] = [:]

    func addService<T>(_ service: T) {
        services[String(describing: T.self)] = service as AnyObject
    }

    func getService<T>() -> T? {
        return services[String(describing: T.self)] as? T
    }
}
