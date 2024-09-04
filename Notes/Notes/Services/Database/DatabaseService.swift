//
//  NoteDatabaseService.swift
//  Notes
//
//  Created by Louise Hogan on 7/31/24.
//

import Foundation

class DatabaseService: Database {
    typealias ObjectType = NoteModel
    
    private let key = "notes"
    
    func fetchAll() -> [NoteModel] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        return (try? JSONDecoder().decode([NoteModel].self, from: data)) ?? []
    }
    
    func fetch(byId id: UUID) -> NoteModel? {
        return fetchAll().first { $0.id == id }
    }
    
    func save(_ note: NoteModel) {
        var notes = fetchAll()
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index] = note
        } else {
            notes.append(note)
        }
        saveAll(notes)
    }
    
    func delete(_ note: NoteModel) {
        var notes = fetchAll()
        notes.removeAll { $0.id == note.id }
        saveAll(notes)
    }
    
    private func saveAll(_ notes: [NoteModel]) {
        if let data = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
