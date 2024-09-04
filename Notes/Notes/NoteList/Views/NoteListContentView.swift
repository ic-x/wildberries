//
//  NoteListView.swift
//  Notes
//
//  Created by Louise Hogan on 7/31/24.
//

import SwiftUI

struct NoteListContentView: View {
    // MARK: Observer Pattern
    @ObservedObject var viewModel: NoteViewModel // Observes changes in NoteViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.notes) { note in
                    NavigationLink(destination: NoteDetailView(note: note, viewModel: viewModel)) {
                        Text(note.title)
                            .bold()
                    }
                }
                .onDelete(perform: deleteNote)
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: NoteDetailView(viewModel: viewModel)) {
                        Image(systemName: "plus")
                            .bold()
                    }
                }
            }
        }
    }
    
    private func deleteNote(at offsets: IndexSet) {
        offsets.forEach { index in
            let note = viewModel.notes[index]
            viewModel.deleteNote(note)
        }
    }
}
