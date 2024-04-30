//
//  UserListViewModel.swift
//  UsersList(SwiftUI)
//
//  Created by Veysal Hasanbayli on 29.04.24.
//

import Foundation

@MainActor
final class UserListViewModel: ObservableObject {
    @Published var users: [UserList.User]?
    @Published var shouldShowAlert = false
    @Published var isLoading = false
    @Published var error = ""
    
    private let url = "https://api.github.com/uswers"
    func getUsers() async {
        isLoading = true
        do {
            let users = try await NetworkService.shared.fetchUsers(with: url)
            self.users = users
            self.isLoading = false
        } catch {
            self.error = error.localizedDescription
            shouldShowAlert = true
            isLoading = false
        }
    }
    
}
