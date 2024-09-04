//
//  NoteViewModel.swift
//  Notes
//
//  Created by Louise Hogan on 7/31/24.
//

import Foundation

class NoteViewModel: ObservableObject { // ObservableObject to notify views
    @Published var notes: [NoteModel] = [] // @Published triggers UI updates
    
    // MARK: Dependency Injection
    private var databaseService: DatabaseService
    private var networkService: NetworkService
    
    init(databaseService: DatabaseService, networkService: NetworkService) {
        self.databaseService = databaseService
        self.networkService = networkService
        loadNotes()
    }
    
    func loadNotes() {
        notes = databaseService.fetchAll()
    }
    
    func addOrUpdateNote(_ note: NoteModel) {
        databaseService.save(note)
        syncNoteWithServer(note)
        loadNotes()
    }
    
    func deleteNote(_ note: NoteModel) {
        databaseService.delete(note)
        deleteNoteFromServer(note)
        loadNotes()
    }
    
    private func syncNoteWithServer(_ note: NoteModel) {
        guard let url = URL(string: "https://api.example.com/notes") else { return }
        
        do {
            let requestData = try JSONEncoder().encode(note)
            networkService.request(url: url, method: .post, headers: ["Content-Type": "application/json"], body: requestData) { (result: Result<NoteModel, NetworkError>) in
                switch result {
                case .success(let updatedNote):
                    print("Successfully synced note: \(updatedNote)")
                case .failure(let error):
                    print("Failed to sync note: \(error.localizedDescription)")
                }
            }
        } catch {
            print("Failed to encode note for syncing: \(error.localizedDescription)")
        }
    }
    
    private func deleteNoteFromServer(_ note: NoteModel) {
        guard let url = URL(string: "https://api.example.com/notes/\(note.id.uuidString)") else { return }
        
        networkService.request(url: url, method: .delete, headers: ["Content-Type": "application/json"], body: nil) { (result: Result<NoteModel, NetworkError>) in
            switch result {
            case .success:
                print("Successfully deleted note from server")
            case .failure(let error):
                print("Failed to delete note from server: \(error.localizedDescription)")
            }
        }
    }
}

