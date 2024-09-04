//
//  NetworkError.swift
//  Example
//
//  Created by Louise Hogan on 7/31/24.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case statusCode(Int)
    case noData
    case decoding(Error)
    case unknown(Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidResponse:
            return "Invalid response from server."
        case .statusCode(let code):
            return "Received HTTP status code: \(code)"
        case .noData:
            return "No data received from server."
        case .decoding(let error):
            return "Decoding error: \(error.localizedDescription)"
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        }
    }
}
