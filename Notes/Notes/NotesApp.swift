//
//  NotesApp.swift
//  Notes
//
//  Created by Louise Hogan on 7/31/24.
//

import SwiftUI

@main
struct NotesApp: App {
    init() {
        setupServices()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    private func setupServices() {
        // MARK: Service Locator Pattern (Singleton)
        ServiceLocator.shared.addService(DatabaseService())
        ServiceLocator.shared.addService(NetworkService())
    }
}
