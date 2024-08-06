//
//  Server.swift
//  DataFlow
//

import Foundation

actor Server {
    private var clients: [Client] = []
    private var results: [String] = []
    private var errors: [Error] = []

    func addClient(_ client: Client) {
        clients.append(client)
        print("Client \(client.id) added")
    }

    func distributeTasks(dataChunks: [DataChunk]) async {
        print("Distributing tasks to clients...")
        
        await withTaskGroup(of: (Int, Result<String, Error>).self) { group in
            for (index, dataChunk) in dataChunks.enumerated() {
                let client = clients[index % clients.count]
                
                group.addTask {
                    do {
                        let result = try await client.process(data: dataChunk)
                        return (index, .success(result))
                    } catch {
                        return (index, .failure(error))
                    }
                }
            }

            // Collect results and errors
            for await (index, result) in group {
                switch result {
                case .success(let output):
                    print("Success for chunk \(index)")
                    results.append("Client \(clients[index % clients.count].id) processed chunk \(index): \(output)")
                case .failure(let error):
                    print("Error for chunk \(index)")
                    errors.append(error)
                }
            }
        }

        print("Task distribution complete.")
    }

    func getResults() -> [String] {
        return results
    }

    func getErrors() -> [Error] {
        return errors
    }
}
