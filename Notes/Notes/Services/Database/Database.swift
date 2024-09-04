//
//  DatabaseService.swift
//  Example
//
//  Created by Louise Hogan on 7/31/24.
//

import Foundation

protocol Database {
    associatedtype ObjectType
    func fetchAll() -> [ObjectType]
    func fetch(byId id: UUID) -> ObjectType?
    func save(_ object: ObjectType)
    func delete(_ object: ObjectType)
}
