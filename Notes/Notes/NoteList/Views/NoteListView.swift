//
//  NoteViewContainer.swift
//  Notes
//
//  Created by Louise Hogan on 7/31/24.
//

import SwiftUI

struct NoteListView: View {
    @StateObject private var viewModel = NoteViewModel(
        // MARK: Dependency Injection through Service Locator
        databaseService: ServiceLocator.shared.getService()!,
        networkService: ServiceLocator.shared.getService()!
    )
    
    var body: some View {
        NoteListContentView(viewModel: viewModel)
    }
}
