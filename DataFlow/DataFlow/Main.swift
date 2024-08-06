//
//  main.swift
//  DataFlow
//

import Foundation

func system() async {
    let server = Server()

    // Create clients
    let clients = [
        Client(id: 1, taskProcessor: DataProcessingTask()),
        Client(id: 2, taskProcessor: DataProcessingTask()),
        Client(id: 3, taskProcessor: DataProcessingTask())
    ]

    // Add clients to the server
    for client in clients {
        await server.addClient(client)
    }

    // Simulate data chunks to be processed
    let dataChunks: [DataChunk] = [
        DataChunk(id: 1, data: "Data1"),
        DataChunk(id: 2, data: "Data2"),
        DataChunk(id: 3, data: "Data3"),
        DataChunk(id: 4, data: "Data4"),
        DataChunk(id: 5, data: "Data5"),
        DataChunk(id: 6, data: "Data6"),
        DataChunk(id: 7, data: "Data7"),
        DataChunk(id: 8, data: "Data8")
    ]

    // Distribute tasks to clients
    await server.distributeTasks(dataChunks: dataChunks)

    // Retrieve results and errors
    let results = await server.getResults()
    let errors = await server.getErrors()

    // Print the results
    print("Results:")
    results.isEmpty ? print("-") : results.forEach { print($0) }

    // Print any errors
    print("\nErrors:")
    errors.isEmpty ? print("-") : errors.forEach { print($0) }
}

@main
struct MainApp {
    static func main() {
        let semaphore = DispatchSemaphore(value: 0)
        
        Task {
            await system()
            semaphore.signal() // Signal when system finishes
        }
        
        // Wait until all async tasks are completed
        semaphore.wait()
    }
}
