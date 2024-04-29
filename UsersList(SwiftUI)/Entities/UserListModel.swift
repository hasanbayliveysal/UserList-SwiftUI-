//
//  UserListModel.swift
//  UsersList(SwiftUI)
//
//  Created by Veysal Hasanbayli on 29.04.24.
//

import Foundation

struct UserList {
    let user: [User]
    
    struct User: Decodable {
        let id      : Int?
        let username: String?
        let imageUrl: String?
        let type:     String?
        
        enum CodingKeys: String, CodingKey {
            case username = "login"
            case imageUrl = "avatar_url"
            case type, id
        }
    }
}
