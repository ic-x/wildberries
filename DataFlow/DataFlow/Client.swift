//
//  Client.swift
//  DataFlow
//

import Foundation

// An actor representing a client that processes data chunks
actor Client {
    let id: Int
    let taskProcessor: DataProcessor

    init(id: Int, taskProcessor: DataProcessor) {
        self.id = id
        self.taskProcessor = taskProcessor
    }

    // Method to process a data chunk asynchronously
    func process(data: DataChunk) async throws -> String {
        try await taskProcessor.process(data: data)
    }
}
