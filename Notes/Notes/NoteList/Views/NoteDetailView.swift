//
//  NoteDetailView.swift
//  Notes
//
//  Created by Louise Hogan on 7/31/24.
//

import SwiftUI

struct NoteDetailView: View {
    @State var note: NoteModel
    @ObservedObject var viewModel: NoteViewModel
    
    init(note: NoteModel? = nil, viewModel: NoteViewModel) {
        self.viewModel = viewModel
        _note = State(initialValue: note ?? NoteModel(id: UUID(), title: "", content: "", lastModified: Date()))
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $note.title)
                .bold()
                .onChange(of: note.title) {
                    saveNote()
                }
            
            TextField("Take a note...", text: $note.content)
                .onChange(of: note.content) {
                    saveNote()
                }
        }
        .navigationTitle(note.title.isEmpty ? "New Note" : "Edit Note")
    }
    
    private func saveNote() {
        note.lastModified = Date()
        viewModel.addOrUpdateNote(note)
    }
}
