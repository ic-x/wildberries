//
//  Networking.swift
//  Example
//
//  Created by Louise Hogan on 7/31/24.
//

import Foundation

protocol Networking {
    func request<T: Decodable>(
        url: URL,
        method: HTTPMethod,
        headers: [String: String]?,
        body: Data?,
        completion: @escaping (Result<T, NetworkError>) -> Void
    )
}
