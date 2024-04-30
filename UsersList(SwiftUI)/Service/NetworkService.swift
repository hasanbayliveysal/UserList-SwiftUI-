//
//  NetworkService.swift
//  UsersList(SwiftUI)
//
//  Created by Veysal Hasanbayli on 29.04.24.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    func fetchUsers(with url: String) async throws -> [UserList.User] {
        return try await URLSession.shared.fetch(with: url)
    }
}
