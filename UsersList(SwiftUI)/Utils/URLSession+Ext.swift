//
//  URLSession+Ext.swift
//  UsersList(SwiftUI)
//
//  Created by Veysal Hasanbayli on 29.04.24.
//

import Foundation

extension URLSession {
    func fetch<T: Decodable>(with url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw CustomNetworkError.invalidURL
        }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await data(for: urlRequest)
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                   statusCode == 200 else {
            throw CustomNetworkError.invalidResponse
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw CustomNetworkError.invalidData
        }
    }
}


enum CustomNetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    
    var errorDescription: String? {
        switch self {
        case .invalidData:
            return "Invalid Data"
        case .invalidResponse:
            return "Invalid Response"
        case .invalidURL:
            return "Invalid Url"
        }
    }
}
