//
//  DataProcessor.swift
//  DataFlow
//

import Foundation

protocol DataProcessor {
    func process(data: DataChunk) async throws -> String
}

struct DataProcessingTask: DataProcessor {
    func process(data: DataChunk) async throws -> String {
        // Simulate a delay in processing
        print("Processing data chunk with id \(data.id)")
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
        
        // Simulate an error for certain data chunks
        if data.id % 3 == 0 {
            throw ServerError.taskError("Error processing data chunk with id \(data.id)")
        }
        
        return "Processed \(data.data)"
    }

    enum ServerError: Error {
        case taskError(String)
    }
}
